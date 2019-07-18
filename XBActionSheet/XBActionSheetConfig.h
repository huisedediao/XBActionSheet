//
//  XBActionSheetConfig.h
//  XBActionSheet
//
//  Created by xxb on 2018/12/20.
//  Copyright © 2018年 xxb. All rights reserved.
//

#ifndef XBActionSheetConfig_h
#define XBActionSheetConfig_h

//1像素线宽
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define XBActionSheetLineViewSpaceToBorder (10)
#define XBActionSheetDefaultSectionHeaderH (5)
#define XBActionSheetScreenW [UIScreen mainScreen].bounds.size.width
#define XBActionSheetScreenH [UIScreen mainScreen].bounds.size.height
//底部安全区域高
#define XBActionSheetBottomSafeHeight ((XBActionSheetScreenH == 812 || XBActionSheetScreenH == 896 || XBActionSheetScreenW == 812 || XBActionSheetScreenW == 896) ? 34 : 0)

#define XBActionSheetBottomSpaceToScreen ([self isKindOfClass:NSClassFromString(@"XBActionSheet_hollow")]?(XBActionSheetBottomSafeHeight + 16):(XBActionSheetBottomSafeHeight))

//根据传入的文字和字体获取宽度 (CGFloat)
#define getWidthWith_title_font(title,font) ({\
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];\
label.text = title;\
label.font = font;\
[label sizeToFit];\
label.frame.size.width;\
})

#endif /* XBActionSheetConfig_h */
