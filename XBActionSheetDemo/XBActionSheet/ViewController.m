//
//  ViewController.m
//  XBActionSheet
//
//  Created by xxb on 2018/12/20.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBActionSheet_hollow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    XBActionSheet_hollow *actionSheet = [[XBActionSheet_hollow alloc] initWithTitleArr:@[@"hehe",@"haha"] cancelBtnTitle:@"cancel" actionBlock:^(XBActionSheet *actionSheet, NSInteger index) {
//        NSLog(@"%zd",index);
//    }];
//    actionSheet.hideCancelBtn = YES;
//    [actionSheet show];
    
//    XBActionSheet_hollow *actionSheet = [[XBActionSheet_hollow alloc] initWithTitleArr:@[@"hehe",@"haha"] actionBlock:^(XBActionSheet *actionSheet, NSInteger index) {
//        NSLog(@"%zd",index);
//    }];
//    [actionSheet show];
    
    XBActionSheetModel *model1 = [XBActionSheetModel new];
    model1.str_titleNormal = @"1";
    model1.str_imageNameNormal = @"icon_bule_selected";
    model1.str_imageNameDestructive = @"icon_bule_unSelected";

    XBActionSheetModel *model2 = [XBActionSheetModel new];
    model2.str_titleNormal = @"222";
    model2.str_imageNameNormal = @"XBImage_selectIcon_nor";
    model2.str_imageNameDestructive = @"XBImage_selectIcon_sel";

    XBActionSheetModel *model3 = [XBActionSheetModel new];
    model3.str_titleNormal = @"2333333667778";
    model3.str_imageNameNormal = @"XBImage_selectIcon_nor";
    model3.str_imageNameDestructive = @"XBImage_selectIcon_sel";

    NSArray *arr = @[model1,model3,model2];

    XBActionSheet_hollow *actionSheet = [[XBActionSheet_hollow alloc] initWithModelArr:arr actionBlock:^(XBActionSheet *actionSheet, NSInteger index) {
        NSLog(@"%ld",index);
    }];
    actionSheet.destructiveButtonTextColor = [UIColor orangeColor];
    actionSheet.buttonTextColor = [UIColor purpleColor];
    actionSheet.destructiveButtonIndex = 1;
    actionSheet.hideWhileClickContentBtn = NO;//点击取消按钮以外的按钮是否隐藏
    actionSheet.hideWhileTouchOtherArea = NO;//点击屏幕上actionSheet以外的区域是否隐藏
//    actionSheet.hideCancelBtn = YES;
    [actionSheet show];
    
//    XBActionSheet_hollow *actionSheet = [[XBActionSheet_hollow alloc] initWithTitleArr:@[@"22",@"33"] actionBlock:^(XBActionSheet *actionSheet, NSInteger index) {
//
//    }];
////    actionSheet.hideCancelBtn = YES;
//    [actionSheet show];
    
//    XBActionSheet *actionSheet = [[XBActionSheet alloc] initWithTitleArr:@[@"22",@"33"] cancelBtnTitle:nil actionBlock:^(XBActionSheet *actionSheet, NSInteger index) {
//
//    }];
//    actionSheet.destructiveButtonTextColor = [UIColor orangeColor];
//    actionSheet.buttonTextColor = [UIColor purpleColor];
//    actionSheet.destructiveButtonIndex = 1;
////    actionSheet.hideCancelBtn = YES;
//    [actionSheet show];
}


@end
