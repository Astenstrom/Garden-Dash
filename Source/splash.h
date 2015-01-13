
//{{BLOCK(splash)

//======================================================================
//
//	splash, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 486 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 31104 + 2048 = 33664
//
//	Time-stamp: 2014-11-30, 16:01:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASH_H
#define GRIT_SPLASH_H

#define splashTilesLen 31104
extern const unsigned short splashTiles[15552];

#define splashMapLen 2048
extern const unsigned short splashMap[1024];

#define splashPalLen 512
extern const unsigned short splashPal[256];

#endif // GRIT_SPLASH_H

//}}BLOCK(splash)
