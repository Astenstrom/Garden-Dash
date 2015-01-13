    /***************************************** 
    Garden Dash

    Collect all the crops! Be careful. If you 
    harvest and weeds you lose. Look out for the
    cow poops, they will slow you down. 

    Use the keypad to move. 
    Press A to harvest crops. 
    Select to pause.

    Cheat: Press B to shoot
    food at the cow. Feed him and
    he may stop leaving all those 
    pesky poops around. 
    ******************************************/
#include <stdlib.h>
#include "myLib.h"
#include "farmer.h"
#include "BG512x512.h"
#include "splash.h"
#include "instructions.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "collisionmap.h"
#include "HarvestMoon.h"
#include "harvest.h"
#include "bg2.h"
#include "secret.h"


#define STARTSCREEN 0
#define GAMESCREEN 1
#define LOSESCREEN 2
#define WINSCREEN 3
#define PAUSESCREEN 4

//Sound
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
}SOUND;

SOUND soundA;
SOUND soundB;
int vbCountA;
int vbCountB;
int MAX_BULLETS = 5;
//int MAX_PLANTS = 24;
int NUMWEEDS;
int NUMCOLLECTED;

unsigned int buttons;
unsigned int oldButtons;

int hOff=0;
int vOff=0;

OBJ_ATTR shadowOAM[128];

int bigRow, bigCol;
int collMapSize = 256;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

typedef struct  
{
	int row;
	int col;
	int bigRow;
	int bigCol;
        int rdel;
        int cdel;
		int width;
        int height;
        int aniCounter;
        int aniState;
        int prevAniState;
        int currFrame;
        int behaviorcount;
        int movecount;
        //determines whether the cow is dropping slowing poops or not
        int isPooping;
} MOVOBJ;

typedef struct{
    int row;
    int col;
    int size;
    int rVel;
    int cVel;
    int active;
} BULLET;

typedef struct{
    int row;
    int col;
    int bigRow;
	int bigCol;
    int active;
} POOP;

//55-70,30-45
//width = 15
//height = 15
//width of bed = 135
//height of bed = 40
typedef struct
{
	int row;
	int col;
	int bigRow;
	int bigCol;
	int plantSize;
	int type;
	int collected;

}PLANT;

#define STARTSCREEN 0
#define GAMESCREEN 1
#define LOSESCREEN 2
#define WINSCREEN 3
#define PAUSESCREEN 4
#define INSTRUCTIONS 5

#define CORN 0
#define EGGPLANT 1
#define CARROT 2
#define TURNIP 3
#define WEED 4


#define MAX_BULLETS 5
#define BULLET_SPEED 3

BULLET bullets[MAX_BULLETS];
PLANT plants[24];
POOP poops[4];

int state = STARTSCREEN;

MOVOBJ farmer;
MOVOBJ cow;


void hideSprites();
void game();
void splash();
void pause();
void win();
void lose();
void instructions();
void animate();
void updateOAM();
//sound
void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency);
void playSoundB( const unsigned char* sound, int length, int frequency);
void muteSound();
void unmuteSound();
void stopSound();
void updateAI();
void drawBullets();
void fire();
void updateBullets();

void setupInterrupts();
void interruptHandler();

unsigned short scanLineCounter;
char fpsbuffer[30];

int randomSeed = 0;
int cowMovestate;
int cowHit = 0;
int vblankCounter;

// states used for farmerAniState
enum { FARMFRONT, FARMBACK, FARMRIGHT, FARMLEFT, FARMIDLE};

//enum for cow state
enum { COWBACK, COWFRONT, COWRIGHT, COWLEFT};

enum {INACTIVE, ACTIVE};




int main()
{
	//enable sprites in the REG_DISPCTL
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE | BG1_ENABLE; 
	
	//Farm Map
	REG_BG1CNT = CBB(0) | SBB(28) | BG_SIZE3 | COLOR256;

	//Farm Decor
	REG_BG0CNT = CBB(1) | SBB(24) | BG_SIZE3 | COLOR256;

        setupInterrupts();
		setupSounds();
        updateOAM();
        initialize();
      	hideSprites();

    loadPalette(splashPal);   
   	DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen /2);
   	DMANow(3, splashMap, &SCREENBLOCKBASE[28], splashMapLen /2);

	while(1)
	{

     oldButtons = buttons;
		buttons = BUTTONS;

		switch(state)
		{
			case STARTSCREEN:
                initialize();
				splash();
				break;
			case GAMESCREEN:
				game();
				break;
			case PAUSESCREEN:
				pause();
				break;
			case WINSCREEN:
				win();
				break;
			case LOSESCREEN:
				lose();
				break;
			case INSTRUCTIONS:
				instructions();
				break;
		}	
                
	}

	return 0;
}

void game(){
	//while(1){
		
		//Updates farmer's world position based on its row/col movement
		farmer.bigRow = farmer.row + vOff;
		farmer.bigCol = farmer.col + hOff;


		updateOAM();
		
		for(int i = 0; i < 24; i++){
			plants[i].row = plants[i].bigRow - vOff;
			plants[i].col = plants[i].bigCol - hOff;
		}

		//check to see if ran into poop
		for(int i = 0; i < 4; i++){

			// if(poops[i].active == 1){
			// 	poops[i].row = poops[i].bigRow - vOff;
			// 	poops[i].col = poops[i].bigCol - hOff;
			// }

			if( (farmer.col + 16 > poops[i].col) && 
				(farmer.col < poops[i].col+16) &&
				(farmer.row + 16 > poops[i].row) &&
				(farmer.row < poops[i].row + 16) && poops[i].active == 1){
				poops[i].active = 0;
				shadowOAM[32+i].attr0 = ATTR0_HIDE;
				//playSoundB(secret,SECRETLEN, SECRETFREQ);
				farmer.row = 0;
				farmer.bigRow = 0;
				farmer.col = 0;
				farmer.bigCol = 0;
				hOff = 0;
				vOff = 0;

			}
		}
		
		//Handle movement and collision logic using farmer.bigRow and farmer.bigCol
		if(BUTTON_HELD(BUTTON_UP))
		{
			//Move and check for collision
			farmer.aniState = FARMBACK;
			if(collisionmapBitmap[OFFSET(farmer.bigRow-1, farmer.bigCol+1, 256)] != 0 &&
			 	collisionmapBitmap[OFFSET(farmer.bigRow-1, farmer.bigCol + farmer.width-1, 256)] != 0){
				if(vOff > 0){
					vOff--;
					cow.row++;
					
					for(int i = 0; i < 4; i++){
						poops[i].row++;
					}
				}
				if(farmer.row > 0){
					farmer.row--;
				}
			}
		
		}
		if(BUTTON_HELD(BUTTON_DOWN))
		{
			//Move and check for collision
			farmer.aniState = FARMFRONT;
			if(collisionmapBitmap[OFFSET(farmer.bigRow+farmer.height+1, farmer.bigCol+1, 256)] != 0 &&
			 	collisionmapBitmap[OFFSET(farmer.bigRow+farmer.height+1, farmer.bigCol + farmer.width-1, 256)] != 0){
				if(vOff+160 < 256){
					vOff++;
					cow.row--;
					for(int i = 0; i < 4; i++){
						poops[i].row--;
					}
				}
				if(farmer.row + farmer.height < 160){
					farmer.row++;
				}
			}
		}
		if(BUTTON_HELD(BUTTON_LEFT))
		{
			//Move and check for collision
			farmer.aniState = FARMLEFT;
			if(collisionmapBitmap[OFFSET(farmer.bigRow+1, farmer.bigCol-1, 256)] != 0 &&
			 	collisionmapBitmap[OFFSET(farmer.bigRow+farmer.height-1, farmer.bigCol -1, 256)] != 0){
				if(hOff > 0){
					hOff--;
				}
				if(farmer.col > 0){
					farmer.col--;
				}
			}
		}
		if(BUTTON_HELD(BUTTON_RIGHT))
		{
			//Move and check for collision
			farmer.aniState = FARMRIGHT;
			if(collisionmapBitmap[OFFSET(farmer.bigRow + 1, farmer.bigCol + farmer.width - 2, 256)] != 0 &&
			 	collisionmapBitmap[OFFSET(farmer.bigRow + farmer.height-1, farmer.bigCol + farmer.width -2, 256)] != 0){
				if(hOff + 240 > 256){
					hOff++;
				}
				if(farmer.col+farmer.width < 240 ){
					farmer.col++;
				}
			}
		}
		if(BUTTON_PRESSED(BUTTON_SELECT)){
			REG_BG0HOFS = 0;
			REG_BG0VOFS = 0;
			REG_BG1HOFS = 0;
			REG_BG1VOFS = 0;
			hOff = 0;
			vOff = 0;
			


			state = PAUSESCREEN;

			muteSound();
			//hideSprites();
			updateOAM();
			loadPalette(pausePal);   
   			DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen /2);
   			DMANow(3, pauseMap, &SCREENBLOCKBASE[28], pauseMapLen /2);

   			//for hide sprites issue. try checking in update OAM if its
   			//pause or win or lose states and hide sprites if state==pause

   			return;

		}
		//Z on keyboard. press to harvest. 
		//harvest first corn to win for now
		if(BUTTON_PRESSED(BUTTON_A)){
			for(int i = 0; i < 24; i++){
				if( ((farmer.bigRow <= plants[i].bigRow) && 
					(farmer.bigCol >= plants[i].bigCol) &&
					(farmer.bigRow >= plants[i].bigRow - farmer.height + 5) &&
					(farmer.bigCol <= plants[i].bigCol + plants[i].plantSize))
					|| 
					((farmer.bigRow >= plants[i].bigRow) && 
					(farmer.bigCol <= plants[i].bigCol) &&
					(farmer.bigRow <= plants[i].bigRow + farmer.height + 5) &&
					(farmer.bigCol >= plants[i].bigCol - plants[i].plantSize+5)) ){
					//reverse < > for bottom rows
					if(!plants[i].collected){
						plants[i].collected = 1;
						NUMCOLLECTED++;
						hideSprites();
						updateOAM();
					
						playSoundB(harvest,HARVESTLEN, HARVESTFREQ);
					}

					
					if(plants[i].type == WEED){
						REG_BG0HOFS = 0;
						REG_BG0VOFS = 0;
						REG_BG1HOFS = 0;
						REG_BG1VOFS = 0;
						hOff = 0;
						vOff = 0;
						//hidesprites();
			
			
						//REG_DISPCTL = MODE0; 
						stopSound();
						loadPalette(losePal);   
   						DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen /2);
   						DMANow(3, loseMap, &SCREENBLOCKBASE[28], loseMapLen /2);
						state = LOSESCREEN;
						updateOAM();
					}
					if(NUMCOLLECTED == 24-NUMWEEDS){
						REG_BG0HOFS = 0;
						REG_BG0VOFS = 0;
						REG_BG1HOFS = 0;
						REG_BG1VOFS = 0;
						hOff = 0;
						vOff = 0;
						hideSprites();
						updateOAM();
						stopSound();

						state = WINSCREEN;
						updateOAM();
						loadPalette(winPal);   
   						DMANow(3, winTiles, &CHARBLOCKBASE[0], winTilesLen /2);
   						DMANow(3, winMap, &SCREENBLOCKBASE[28], winMapLen /2);
					}
				}
   			}
   			return;
		}

		if(BUTTON_PRESSED(BUTTON_B)){
			playSoundB(harvest,HARVESTLEN, HARVESTFREQ);
			fire();
			//return;
		}

		if(cowHit == 1){
			cow.isPooping = 0;
			for(int i = 0; i < 4; i++){
				poops[i].active = 1;
			}
			updateOAM();
		}

		if(vblankCounter/30 > 60){
			shadowOAM[31].attr0 = ATTR0_HIDE;
			REG_BG0HOFS = 0;
			REG_BG0VOFS = 0;
			REG_BG1HOFS = 0;
			REG_BG1VOFS = 0;
			hOff = 0;
			vOff = 0;
			stopSound();
			loadPalette(losePal);   
   			DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen /2);
   			DMANow(3, loseMap, &SCREENBLOCKBASE[28], loseMapLen /2);
			state = LOSESCREEN;

			updateOAM();
   			return;
		}
		
		REG_BG1HOFS = hOff;
		REG_BG1VOFS = vOff;

		REG_BG0HOFS = hOff;
		REG_BG0VOFS = vOff;
		
		animate();
		updateAI();
		updateBullets();
		drawBullets();
		updateOAM();
		
		DMANow(3, shadowOAM, OAM, 512);
		waitForVblank();
		vblankCounter++;
	//}
}

//for a timer i will count Vblanks. 
//essentially counting frames 30 frames per second

void instructions(){
		oldButtons = buttons;
		buttons = BUTTONS;

    
        if(BUTTON_PRESSED(BUTTON_START)){
            state = STARTSCREEN;
            updateOAM();
            loadPalette(splashPal);   
   			DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen /2);
   			DMANow(3, splashMap, &SCREENBLOCKBASE[28], splashMapLen /2);
           
            return;
        }
}

void win(){

    //while(1){
        oldButtons = buttons;
		buttons = BUTTONS;
		stopSound();
		//hideSprites();

        if(BUTTON_PRESSED(BUTTON_START)){
            state = STARTSCREEN;
            loadPalette(splashPal);   
   			DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen /2);
   			DMANow(3, splashMap, &SCREENBLOCKBASE[28], splashMapLen /2);
            updateOAM();
            cow.isPooping = 1;
            return;
        }

    //}
}

void lose(){

    
    //while(1){
        oldButtons = buttons;
		buttons = BUTTONS;
		//hideSprites();

        if(BUTTON_PRESSED(BUTTON_START)){
            state = STARTSCREEN;
            loadPalette(splashPal);   
   			DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen /2);
   			DMANow(3, splashMap, &SCREENBLOCKBASE[28], splashMapLen /2);
            updateOAM();
            //cow.isPooping = 1;
            return;
        }

    //}
}

void pause(){
        oldButtons = buttons;
		buttons = BUTTONS;
		

        if(BUTTON_PRESSED(BUTTON_START)){
            state = GAMESCREEN;
            updateOAM();
            unmuteSound();
            loadPalette(BG512x512Pal);   
   			DMANow(3, BG512x512Tiles, &CHARBLOCKBASE[0], BG512x512TilesLen /2);
   			DMANow(3, BG512x512Map, &SCREENBLOCKBASE[28], BG512x512MapLen /2);

   			DMANow(3, bg2Tiles, &CHARBLOCKBASE[1], bg2TilesLen /2);
   			DMANow(3, bg2Map, &SCREENBLOCKBASE[24], bg2MapLen /2);

	
			//Import the farmer7 Tileset and Palette into thier correct spaces in memory

    		DMANow(3, farmerPal, SPRITE_PALETTE, farmerPalLen / 2);
			DMANow(3, farmerTiles, &CHARBLOCKBASE[4], farmerTilesLen / 2);
            return;
        }
        if(BUTTON_PRESSED(BUTTON_SELECT)){
        	//hideSprites();
        	stopSound();
            state = STARTSCREEN;
            updateOAM();
            loadPalette(splashPal);   
   			DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen /2);
   			DMANow(3, splashMap, &SCREENBLOCKBASE[28], splashMapLen /2);
            return;
        }

    //}
}
void splash(){

    //while(1){
        oldButtons = buttons;
		buttons = BUTTONS;

        if(BUTTON_PRESSED(BUTTON_START)){
            state = GAMESCREEN;
            updateOAM();
            	//Load the Background's Palette and the Tiles/Map into the appropriate CHARBLOCK and SCREENBLOCK
    		loadPalette(BG512x512Pal);   
   			DMANow(3, BG512x512Tiles, &CHARBLOCKBASE[0], BG512x512TilesLen /2);
   			DMANow(3, BG512x512Map, &SCREENBLOCKBASE[28], BG512x512MapLen /2);

   			DMANow(3, bg2Tiles, &CHARBLOCKBASE[1], bg2TilesLen /2);
   			DMANow(3, bg2Map, &SCREENBLOCKBASE[24], bg2MapLen /2);

    		DMANow(3, farmerPal, SPRITE_PALETTE, farmerPalLen / 2);
			DMANow(3, farmerTiles, &CHARBLOCKBASE[4], farmerTilesLen / 2);


			playSoundA(HarvestMoon,HARVESTMOONLEN, HARVESTMOONFREQ);
    
            return;
        }

        if(BUTTON_PRESSED(BUTTON_SELECT)){
        	state = INSTRUCTIONS;
        	updateOAM();
 			loadPalette(instructionsPal);   
   			DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], instructionsTilesLen /2);
   			DMANow(3, instructionsMap, &SCREENBLOCKBASE[28], instructionsMapLen /2);

   			return;
        }

    //}
}

//when you call hidesprites and call update OAM
void hideSprites()
{
    //COMPLETE THIS FUNCTION
    //Loop through all the shadowOAM sprites and hide them.
    int i;
    for (i = 0; i <= 128; i++) {
    	if(i == 31){

    	}
    	else{
        	shadowOAM[i].attr0 = ATTR0_HIDE;
        }
    }
}


void initialize()
{
        
        farmer.width = 32;
        farmer.height = 32;
        farmer.rdel = 1;
        farmer.cdel = 1;
	farmer.row = 0;
	farmer.col = 0;

	cow.row = 80;
    cow.col = 150;
    cow.width = 32;
  	cow.height = 32;
    cow.rdel = 1;
    cow.cdel = 1;
    cow.isPooping = 1;
    cowHit = 0;

    NUMWEEDS = 0;
    NUMCOLLECTED = 0;
    vblankCounter = 0;

    for(int i = 0; i < 6; i++){
    //plants
    	plants[i].row = 35;
    	plants[i].bigRow = plants[i].row;
    	plants[i].bigCol = plants[i].col;
    	plants[i].col = 40 + 25*i;
    	plants[i].plantSize = 15;
    	plants[i].collected = 0;
    }

    for(int i = 0; i < 6; i++){
    	plants[i+6].row = 55;
    	plants[i+6].bigRow = plants[i+6].row;
    	plants[i+6].bigCol = plants[i+6].col;
    	plants[i+6].col = 40 + 25*i;
    	plants[i+6].plantSize = 15;
    	plants[i+6].collected = 0;
    }

    for(int i = 0; i < 6; i++){
    	plants[i+12].row = 155;
    	plants[i+12].bigRow = plants[i+12].row;
    	plants[i+12].bigCol = plants[i+12].col;
    	plants[i+12].col = 40 + 25*i;
    	plants[i+12].plantSize = 15;
    	plants[i+12].collected = 0;
    }

    for(int i = 0; i < 6; i++){
    	plants[i+18].row = 175;
    	plants[i+18].bigRow = plants[i+18].row;
    	plants[i+18].bigCol = plants[i+18].col;
    	plants[i+18].col = 40 + 25*i;
    	plants[i+18].plantSize = 15;
    	plants[i+18].collected = 0;
    }

    //decides what plants draw
    for(int i = 0; i < 24; i++){
		int randNum = rand() % 5;

		if(randNum == 0){
			plants[i].type = CORN;
		}
		if(randNum == 1){
			plants[i].type = EGGPLANT;
		}
		if(randNum == 2){
			plants[i].type = CARROT;
		}
		if(randNum == 3){
			plants[i].type = TURNIP;
		}
		if(randNum == 4){
			plants[i].type = WEED;
			NUMWEEDS++;
		}
		
	}
		


	DMANow(3, farmerTiles, &CHARBLOCKBASE[4], farmerTilesLen/2);
    DMANow(3, farmerPal, SPRITE_PALETTE, 256);

    //displays first timer
    shadowOAM[31].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_SQUARE; //change to 8
	shadowOAM[31].attr1 = (COLMASK & 200) | ATTR1_SIZE32; //change to 32
	shadowOAM[31].attr2 = SPRITEOFFSET16(16,4);


    int i;
    for(i=0; i<MAX_BULLETS; i++){
        bullets[i].active = INACTIVE;
        bullets[i].size = 16;
    }

	/*	=== Animation Variables ===
	*	aniCounter is a counter; it just means change animation 
	*	once 20 while loops (~1/3 of a second) 
	*
	*	currFrame is which frame of the animation farmer is on 
	*	there are three: standing, left foot forward, right foot forward 
	*/
	farmer.aniCounter = 0;
    farmer.currFrame = 0;

    cow.aniCounter = 0;
    cow.currFrame = 0;

	farmer.aniState = FARMFRONT; 

	cow.aniState = COWBACK; 
	cowMovestate = ACTIVE;
	cow.movecount = 0;
    cow.behaviorcount = 0;
        
    buttons = BUTTONS;
        
	hOff = 0;
	vOff = 0;

	//plants
	// top.plantSize = 15;
	// top.bedWidth = 135;
	// top.bedHeight = 40;

}

void animate()
{
        if (farmer.aniState != FARMIDLE)
		{
			farmer.prevAniState = farmer.aniState;
		}
		
        farmer.aniState = FARMIDLE;
		
        if(farmer.aniCounter%20==0) 
        {
			farmer.aniCounter = 0;
			if (farmer.currFrame == 2)
			{
				farmer.currFrame = 0;
			}
			else
			{
				farmer.currFrame++;
			}
        }

        if(BUTTON_HELD(BUTTON_UP))
		{
			farmer.aniState = FARMBACK;
		}
        if(BUTTON_HELD(BUTTON_DOWN))
		{
			farmer.aniState = FARMFRONT;
		}
        if(BUTTON_HELD(BUTTON_LEFT))
		{
			farmer.aniState = FARMLEFT;
		}
        if(BUTTON_HELD(BUTTON_RIGHT))
		{
			farmer.aniState = FARMRIGHT;
		}
		
        if(farmer.aniState == FARMIDLE)
		{
            farmer.currFrame = 0;
		}
        else
		{
            farmer.aniCounter++;
		}

}

void updateOAM()
{
	
	if(state == PAUSESCREEN || state == LOSESCREEN || state == WINSCREEN || state == STARTSCREEN || state == INSTRUCTIONS){
		hideSprites();
		REG_DISPCTL = MODE0 | BG1_ENABLE; 
	}

	// shadowOAM[0].attr0 = (ROWMASK & farmer.row) | ATTR0_4BPP | ATTR0_SQUARE; //change to 8
	// shadowOAM[0].attr1 = (COLMASK & farmer.col) | ATTR1_SIZE16; //change to 32
	// shadowOAM[0].attr2 = SPRITEOFFSET16(2 * farmer.currFrame, 2 * farmer.prevAniState);

	//256x128 for 8bpp sprite sheet
	else{
		REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE | BG1_ENABLE; 

		shadowOAM[0].attr0 = (ROWMASK & farmer.row) | ATTR0_4BPP | ATTR0_SQUARE; //change to 8
		shadowOAM[0].attr1 = (COLMASK & farmer.col) | ATTR1_SIZE32; //change to 32
		shadowOAM[0].attr2 = SPRITEOFFSET16(4 * farmer.currFrame, 4 * farmer.prevAniState);

		// shadowOBAM[1].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		// shadowOAM[1].attr1 = (COLMASK & 50) | ATTR1_SIZE16;
		// shadowOAM[1].attr2 = SPRITEOFFSET16(0,8);
		//shadowOAM[1].attr2 = SPRITEOFFSET16(26,0);

		shadowOAM[1].attr0 = (ROWMASK & cow.row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[1].attr1 = (COLMASK & cow.col) | ATTR1_SIZE32;
		//shadowOAM[1].attr2 = SPRITEOFFSET16(4 * cow.currFrame, 4 * cow.prevAniState);
		shadowOAM[1].attr2 = SPRITEOFFSET16(0 + (4 * cow.currFrame), 16 + ( 4 * cow.prevAniState));	

		for(int i = 0; i < 24; i++){
			if(plants[i].collected == 0){
				shadowOAM[i+6].attr0 = (ROWMASK & plants[i].row) | ATTR0_4BPP | ATTR0_SQUARE; 
				shadowOAM[i +6].attr1 = (COLMASK & plants[i].col) | ATTR1_SIZE32; 
				if(plants[i].type == CORN){
					shadowOAM[i+6].attr2 = SPRITEOFFSET16(12,0);
				}
				if(plants[i].type == EGGPLANT){
					shadowOAM[i +6].attr2 = SPRITEOFFSET16(16,0);
				}
				if(plants[i].type == CARROT){
					shadowOAM[i +6].attr2 = SPRITEOFFSET16(20,0);
				}
				if(plants[i].type == TURNIP){
					shadowOAM[i +6].attr2 = SPRITEOFFSET16(24,0);
				}
				if(plants[i].type == WEED){
					shadowOAM[i +6].attr2 = SPRITEOFFSET16(12,4);
				}
			}
		}

		//timer increments. 
		//cow drops poop at each timer increment
		if(vblankCounter/30 == 10 && !(vblankCounter % 300)){
			shadowOAM[31].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[31].attr1 = (COLMASK & 200) | ATTR1_SIZE32; 
			shadowOAM[31].attr2 = SPRITEOFFSET16(20,4);
			if(cow.isPooping){
				poops[0].row = cow.row;
				poops[0].col = cow.col;
				poops[0].bigRow = poops[0].row;
    			poops[0].bigCol = poops[0].col;
				poops[0].active = 1;
			}
			
		}
		if(vblankCounter/30 >= 10 && cow.isPooping && poops[0].active == 1){
			shadowOAM[32].attr0 = (ROWMASK & poops[0].row) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[32].attr1 = (COLMASK & poops[0].col ) | ATTR1_SIZE32; 
			shadowOAM[32].attr2 = SPRITEOFFSET16(12,12);
		}

		//second time increment 20 seconds
		if(vblankCounter/30 == 20){
			shadowOAM[31].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[31].attr1 = (COLMASK & 200) | ATTR1_SIZE32; 
			shadowOAM[31].attr2 = SPRITEOFFSET16(12,8);
			if(cow.isPooping){
				poops[1].row = cow.row;
				poops[1].col = cow.col;
				poops[1].bigRow = poops[1].row;
    			poops[1].bigCol = poops[1].col;
				poops[1].active = 1;
			}
		}
		if(vblankCounter/30 > 20 && cow.isPooping && poops[1].active == 1){
			shadowOAM[33].attr0 = (ROWMASK & poops[1].row) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[33].attr1 = (COLMASK & poops[1].col ) | ATTR1_SIZE32; 
			shadowOAM[33].attr2 = SPRITEOFFSET16(12,12);
		}

		//3rd time increment 35 seconds
		if(vblankCounter/30 == 35){
			shadowOAM[31].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[31].attr1 = (COLMASK & 200) | ATTR1_SIZE32; 
			shadowOAM[31].attr2 = SPRITEOFFSET16(16,8);
			if(cow.isPooping){
				poops[2].row = cow.row;
				poops[2].col = cow.col;
				poops[2].bigRow = poops[2].row;
    			poops[2].bigCol = poops[2].col;
				poops[2].active = 1;
			}
		}
		if(vblankCounter/30 > 35 && cow.isPooping && poops[2].active == 1){
			shadowOAM[34].attr0 = (ROWMASK & poops[2].row) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[34].attr1 = (COLMASK & poops[2].col ) | ATTR1_SIZE32; 
			shadowOAM[34].attr2 = SPRITEOFFSET16(12,12);
		}

		//4th time increment. 45 seconds
		if(vblankCounter/30 == 45){
			shadowOAM[31].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[31].attr1 = (COLMASK & 200) | ATTR1_SIZE32;
			shadowOAM[31].attr2 = SPRITEOFFSET16(20,8);
			if(cow.isPooping){
				poops[3].row = cow.row;
				poops[3].col = cow.col;
				poops[3].bigRow = poops[3].row;
    			poops[3].bigCol = poops[3].col;
				poops[3].active = 1;
			}
		}
		if(vblankCounter/30 > 45 && cow.isPooping && poops[3].active == 1){
			shadowOAM[35].attr0 = (ROWMASK & poops[3].row) | ATTR0_4BPP | ATTR0_SQUARE; 
			shadowOAM[35].attr1 = (COLMASK & poops[3].col ) | ATTR1_SIZE32; 
			shadowOAM[35].attr2 = SPRITEOFFSET16(12,12);
		}
	}
}

//sound
void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_TO_BOTH | 
                        DSA_TIMER0 | 
                        DSA_FIFO_RESET |
                        DSB_OUTPUT_RATIO_100 | 
                        DSB_OUTPUT_TO_BOTH | 
                        DSB_TIMER1 | 
                        DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {

        dma[1].cnt = 0;
        vbCountA = 0;
	
        int interval = 16777216/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -interval;
        REG_TM0CNT = TIMER_ON;
	
        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */
        soundA.data = sound;
    	soundA.length = length;
   		soundA.frequency = frequency;
   		soundA.isPlaying = 1;
   		soundA.loops = 1;
   		soundA.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;
   		soundA.priority = 1;
         
}


void playSoundB( const unsigned char* sound, int length, int frequency) {


        dma[2].cnt = 0;
        vbCountB = 0;

        int interval = 16777216/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -interval;
        REG_TM1CNT = TIMER_ON;
	
        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */
        soundB.data = sound;
    	soundB.length = length;
    	soundB.frequency = frequency;
   		soundB.isPlaying = 1;
   		soundB.loops = 0;
   		soundB.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;
   		soundB.priority = 2;

}

void muteSound()//turn off sound control register
{
    //ADD CODE HERE
    //sound stops coming out but sound is still looping in memory
    REG_SOUNDCNT_X = 0;

}

void unmuteSound()
{
    //ADD CODE HERE
    // should have changed place in sound
    REG_SOUNDCNT_X = SND_ENABLED;


}

void pauseSound()
{
	//ADD CODE HERE
	//stops sound where it is and plays there again upom unpausing
	//turn off timers
	REG_TM0CNT = 0;

}

void unpauseSound()
{
	//ADD CODE HERE
	REG_TM0CNT = TIMER_ON;


}

void stopSound()//turn off DMA channels 1,2
{
    //ADD CODE HERE
    //everything stops and no place is saved
    dma[1].cnt = 0;
    dma[2].cnt = 0;
}

void setupInterrupts()
{
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int)interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
                /**
                 * MODIFY THIS FUNCTION
                 * Place your code to loop and stop sounds here.
                 */
                if(soundA.isPlaying)
                {
                	vbCountA++;
                }
               	if(vbCountA >= soundA.duration){
               		playSoundA(soundA.data, soundA.length, soundA.frequency);
               	}
               	if(soundB.isPlaying)
                {
                	vbCountB++;
                }
               	if(vbCountB >= soundB.duration){
               		dma[2].cnt = 0;
               		vbCountB = 0;
               	}
                

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}


//opposite of updating big row and big col everytime to fix cow moving issue. 
//
void updateAI()
{   
    if(cowMovestate == ACTIVE)
    {
        switch(cow.aniState)
        {
            case COWLEFT: 
                cow.col -= cow.cdel;
                if (cow.col < 1)
                {
                    cow.col = 0;
                    cow.aniState = COWRIGHT;
                }
                break;

            case COWBACK: 
                cow.row -= cow.rdel;
                if (cow.row < 1)
                {
                    cow.row = 0;
                    cow.aniState = COWFRONT;
                }
                break;

            case COWRIGHT: 
                cow.col += cow.cdel;
                if (cow.col > 256 - cow.width)
                {
                    cow.col = 256 - cow.width;
                    cow.aniState = COWLEFT;
                }
                break;

            case COWFRONT: 
                cow.row += cow.rdel;
                if (cow.row > 256 - cow.height)
                {
                    cow.row = 256 - cow.height;
                    cow.aniState = COWBACK;
                }
                break;
        }
    }
    cow.prevAniState = cow.aniState;

    cow.aniCounter++;


    if(cow.aniCounter%30 == 0){
    	cow.currFrame++;
    }

    if (cow.currFrame >=2){
    	cow.currFrame = 0;
    }
    cow.movecount++;
    cow.behaviorcount++;
    if(cow.movecount == 48)
    {
        cow.aniState = rand() % 4;
        cow.movecount = 0;
    }
    
    if(cow.behaviorcount == 120)
    {
        cow.aniState = rand() % 2; //MOVESTATE OR RESTSTATE
        cow.behaviorcount = 0;
    }

 //    if(cow.aniState == COWREST)
	// 	{
 //            cow.currFrame = 0;
	// 	}
 //    else
 //   	{
 //   	    cow.aniCounter++;
	// }
}

void drawBullets(){
    int i;
    for(i=0; i<MAX_BULLETS; i++){
        if(bullets[i].active == ACTIVE){
        	shadowOAM[2+i].attr0 = (ROWMASK & bullets[i].row) | ATTR0_4BPP | ATTR0_SQUARE; //change to 8
			shadowOAM[2+i].attr1 = (COLMASK & bullets[i].col) | ATTR1_SIZE32; //change to 32
			shadowOAM[2+i].attr2 = SPRITEOFFSET16(12,0);
        }
    }
}

void updateBullets(){
    int i;
    for(i=0; i<MAX_BULLETS; i++){
        if(bullets[i].active == ACTIVE){
            bullets[i].col += bullets[i].cVel;
            bullets[i].row += bullets[i].rVel;
            if(bullets[i].row <= 0 || bullets[i].row >= 159-bullets[i].size ||
                    bullets[i].col <= 0 || bullets[i].col >= 239-bullets[i].size){
                bullets[i].active = INACTIVE;
            }
            if(bullets[i].row <= cow.row+cow.width && bullets[i].row+bullets[i].size >= cow.row &&
                   bullets[i].col <= cow.col+cow.height && bullets[i].col+bullets[i].size >= cow.col ){
                //enemy.health --;
                cowHit = 1;
            	playSoundB(secret,SECRETLEN, SECRETFREQ);
                bullets[i].active = INACTIVE;
            }
        }
    }
    
    
}

void fire(){
    int i;
    for(i=0; i<MAX_BULLETS; i++){
        if(!bullets[i].active){
             bullets[i].active = ACTIVE;
             bullets[i].row = farmer.row;
             bullets[i].col = farmer.col;
             switch(farmer.aniState){
                 case(FARMLEFT):
                     bullets[i].cVel = -BULLET_SPEED;
                     bullets[i].rVel = 0;
                     break;
                 case(FARMRIGHT):
                     bullets[i].cVel = BULLET_SPEED;
                     bullets[i].rVel = 0;
                     break;
                 case(FARMFRONT):
                     bullets[i].rVel = BULLET_SPEED;
                     bullets[i].cVel = 0;
                     break;
                 case(FARMBACK):
                     bullets[i].rVel = -BULLET_SPEED;
                     bullets[i].cVel = 0;
                     break;
             }
             return;
        }
    }
}