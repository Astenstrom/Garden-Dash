
//{{BLOCK(farm)

//======================================================================
//
//	farm, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 658 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 42112 + 2048 = 44672
//
//	Time-stamp: 2014-11-11, 22:36:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FARM_H
#define GRIT_FARM_H

#define farmTilesLen 42112
extern const unsigned short farmTiles[21056];

#define farmMapLen 2048
extern const unsigned short farmMap[1024];

#define farmPalLen 512
extern const unsigned short farmPal[256];

#endif // GRIT_FARM_H

//}}BLOCK(farm)
