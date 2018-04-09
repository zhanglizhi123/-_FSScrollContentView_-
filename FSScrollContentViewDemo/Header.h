//
//  Header.h
//  FSScrollContentViewDemo
//
//  Created by guangjun wang on 2018/4/9.
//  Copyright © 2018年 fengshun. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "Masonry.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height


//颜色
#define RGB(r,g,b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1]

#define TEXT_RED_Price RGB(252, 117, 90)//为粉红 #FC755A

#define TEXT_BLUE_133 RGB(0, 132, 133)//为青色 #008485
#define THEME_GREEN_133 RGB(0, 132, 132)

#define TEXT_HEX_GRAY_176 RGB(176, 176, 177)  //#B0B0B1
#define TEXT_HEX_BLOCK_36 RGB(36, 36, 36)  //#242424
#define TEXT_HEX_BLOCK_66 RGB(66, 66, 64)  //#424240
#define TEXT_HEX_BLOCK_111 RGB(111, 111, 110)  //#6F6F6E

#define TEXT_HEX_GRAY_144 RGB(144, 144, 146)  //#909092
#define TEXT_HEX_GRAY_240 RGB(240, 240, 238)  //#F0F0EE
#define TEXT_HEX_GRAY_171 RGB(171, 171, 172)//灰色 #ABABAA
#define TEXT_HEX_GRAY_164 RGB(164, 165, 165)//灰色 #A4A5A5
#define TEXT_HEX_GRAY_229 RGB(229, 229, 229)//灰色 #E5E5E5
#define TEXT_HEX_BKG_250 RGB(250, 250, 250)//灰色 ##FAFAFA 比210浅一些
#define TEXT_HEX_BKG_210 RGB(210, 210, 210)//灰色 #D2D2D2
#define TEXT_HEX_BKG_243 RGB(245, 243, 243)//灰色 #F5F3F3

#define TEXT_BIG_S_FONT20 [UIFont systemFontOfSize:20]
#define TEXT_BIG_B_FONT20 [UIFont boldSystemFontOfSize:20]
#define TEXT_MIDD_S_FONT15 [UIFont systemFontOfSize:15]
#define TEXT_MIDD_B_FONT15 [UIFont boldSystemFontOfSize:15]
#define TEXT_LIT_S_FONT13 [UIFont systemFontOfSize:13]
#define TEXT_LIT_B_FONT13 [UIFont boldSystemFontOfSize:13]

#define TEXT_LIT_S_FONT12 [UIFont systemFontOfSize:12]
#define TEXT_LIT_B_FONT12 [UIFont boldSystemFontOfSize:12]


#endif /* Header_h */
