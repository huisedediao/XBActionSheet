//
//  XBActionSheet.h
//  XBActionSheet
//
//  Created by XXB on 16/7/22.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBAlertViewBase.h"
#import "XBActionSheetModel.h"
#import "Masonry.h"
#import "XBActionSheetConfig.h"
#import "XBActionSheetCell.h"

@class XBActionSheet;

typedef void (^XBActionSheetBlock)(XBActionSheet *actionSheet, NSInteger index);

@protocol XBActionSheetDelegate <NSObject>

-(void)actionSheet:(XBActionSheet *)actionSheet clickedAtIndex:(NSInteger)index;

@end

@interface XBActionSheet : XBAlertViewBase
@property (nonatomic,strong) UITableView *xbTbaleView;
@property (nonatomic,strong) XBActionSheetModel *cancelModel;
/**
 *  数据源
 */
@property (nonatomic,strong) NSArray *arr_model;
/**
 *  是否隐藏取消按钮,默认NO
 */
@property (assign,nonatomic) BOOL hideCancelBtn;
/**
 *  点击取消按钮以外的按钮是否隐藏，默认是
 */
@property (assign,nonatomic) BOOL hideWhileClickContentBtn;
/**
 *  取消按钮和其他按钮的间隔,默认5
 */
@property (assign,nonatomic) CGFloat space;
/**
 *  间隔的颜色,默认灰色透明0.1
 */
@property (strong,nonatomic) UIColor *spaceColor;
/**
 *  按钮的高度,默认44
 */
@property (assign,nonatomic) CGFloat buttonHeight;
/**
 *  自身和屏幕边缘的距离,默认0
 */
@property (assign,nonatomic) CGFloat gapToBorder;
/**
 *  警告按钮的位置,默认无
 */
@property (assign,nonatomic) NSInteger destructiveButtonIndex;
/**
 *  警告按钮的颜色,默认红色
 */
@property (strong,nonatomic) UIColor *destructiveButtonTextColor;
/**
 *  按钮的文字颜色
 */
@property (strong,nonatomic) UIColor *buttonTextColor;
/**
 *  取消按钮的文字,默认:取消
 */
@property (copy,nonatomic) NSString *cancelBtnTitle;

@property (nonatomic,weak) id <XBActionSheetDelegate> delegate;

/**
 *  点击回调
 */
@property (nonatomic,copy) XBActionSheetBlock bl_click;

- (instancetype)initWithTitleArr:(NSArray *)titleArr cancelBtnTitle:(NSString *)cancelBtnTitle actionBlock:(XBActionSheetBlock)actionBlock;
@end
