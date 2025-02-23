
//{{BLOCK(bg2)

//======================================================================
//
//	bg2, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 208 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13312 + 2048 = 15872
//
//	Time-stamp: 2014-11-18, 16:13:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG2_H
#define GRIT_BG2_H

#define bg2TilesLen 13312
extern const unsigned short bg2Tiles[6656];

#define bg2MapLen 2048
extern const unsigned short bg2Map[1024];

#define bg2PalLen 512
extern const unsigned short bg2Pal[256];

#endif // GRIT_BG2_H

//}}BLOCK(bg2)
