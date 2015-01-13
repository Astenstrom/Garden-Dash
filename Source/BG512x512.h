
//{{BLOCK(BG512x512)

//======================================================================
//
//	BG512x512, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 3 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 192 + 2048 = 2752
//
//	Time-stamp: 2014-11-18, 16:16:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG512X512_H
#define GRIT_BG512X512_H

#define BG512x512TilesLen 192
extern const unsigned short BG512x512Tiles[96];

#define BG512x512MapLen 2048
extern const unsigned short BG512x512Map[1024];

#define BG512x512PalLen 512
extern const unsigned short BG512x512Pal[256];

#endif // GRIT_BG512X512_H

//}}BLOCK(BG512x512)
