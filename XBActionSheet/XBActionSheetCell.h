//
//  XBActionSheetCell.h
//  XBActionSheet
//
//  Created by xxb on 2019/3/1.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBButton.h"
#import "XBActionSheetModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBActionSheetCell : UITableViewCell
/**
 *  按钮的文字颜色
 */
@property (strong,nonatomic) UIColor *buttonTextColor;
/**
 *  警告按钮的颜色,默认红色
 */
@property (strong,nonatomic) UIColor *destructiveButtonTextColor;
@property (nonatomic,strong) XBButton *btn_content;
@property (nonatomic,assign) BOOL isDestructive;
@property (nonatomic,strong) XBActionSheetModel *model;
@end

NS_ASSUME_NONNULL_END
