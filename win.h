
//{{BLOCK(win)

//======================================================================
//
//	win, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 665 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 42560 + 2048 = 45120
//
//	Time-stamp: 2014-11-30, 14:44:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WIN_H
#define GRIT_WIN_H

#define winTilesLen 42560
extern const unsigned short winTiles[21280];

#define winMapLen 2048
extern const unsigned short winMap[1024];

#define winPalLen 512
extern const unsigned short winPal[256];

#endif // GRIT_WIN_H

//}}BLOCK(win)
