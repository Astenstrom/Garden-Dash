
//{{BLOCK(pause)

//======================================================================
//
//	pause, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 640 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 40960 + 2048 = 43520
//
//	Time-stamp: 2014-11-30, 14:43:39
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSE_H
#define GRIT_PAUSE_H

#define pauseTilesLen 40960
extern const unsigned short pauseTiles[20480];

#define pauseMapLen 2048
extern const unsigned short pauseMap[1024];

#define pausePalLen 512
extern const unsigned short pausePal[256];

#endif // GRIT_PAUSE_H

//}}BLOCK(pause)
