//
//  XBActionSheet_hollow.m
//  XBActionSheet
//
//  Created by xxb on 2019/3/1.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBActionSheet_hollow.h"

@interface XBActionSheet_hollow ()
@property (nonatomic,assign) CGFloat f_leftSpace;
@end

#define kSpaceToBorder (20)
#define KRadius (15)
#define kSpaceOfTitleAndImg (5)
#define kTitleImageWidth (20)
#define kFontOfTitle ([UIFont systemFontOfSize:16])

@implementation XBActionSheet_hollow

- (void)actionBeforeShow
{
    [self setParams];
    [super actionBeforeShow];
}

- (void)setParams
{
    self.buttonHeight = 56;
    self.backgroundColor = [UIColor clearColor];
    self.spaceColor = [UIColor clearColor];
    
    UIView *bgLayer_top = [[UIView alloc] init];
    [self addSubview:bgLayer_top];
    bgLayer_top.frame = CGRectMake(kSpaceToBorder, 0, XBActionSheetScreenW - kSpaceToBorder * 2, self.arr_model.count * self.buttonHeight);
    bgLayer_top.backgroundColor = [UIColor whiteColor];
    bgLayer_top.layer.cornerRadius = KRadius;
    [self sendSubviewToBack:bgLayer_top];
    
    if (self.hideCancelBtn == NO)
    {
        UIView *bgLayer_bottom = [[UIView alloc] init];
        [self addSubview:bgLayer_bottom];
        bgLayer_bottom.frame = CGRectMake(kSpaceToBorder, CGRectGetMaxY(bgLayer_top.frame) + self.space, XBActionSheetScreenW - kSpaceToBorder * 2,  self.buttonHeight);
        bgLayer_bottom.backgroundColor = [UIColor whiteColor];
        bgLayer_bottom.layer.cornerRadius = KRadius;
        [self sendSubviewToBack:bgLayer_bottom];
    }
    
    self.xbTbaleView.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithTitleArr:(NSArray *)titleArr actionBlock:(XBActionSheetBlock)actionBlock
{
    return [super initWithTitleArr:titleArr cancelBtnTitle:nil actionBlock:actionBlock];
}

- (instancetype)initWithModelArr:(NSArray *)modelArr actionBlock:(XBActionSheetBlock)actionBlock
{
    if (self = [super initWithDisplayView:[[UIApplication sharedApplication].delegate window]])
    {
        self.f_leftSpace = XBActionSheetScreenW * 0.5;
        for (XBActionSheetModel *model in modelArr)
        {
            UIFont *font = kFontOfTitle;
            CGFloat width = kTitleImageWidth + kSpaceOfTitleAndImg + getWidthWith_title_font(model.str_titleNormal, font);
            CGFloat left = (XBActionSheetScreenW - width) * 0.5;
            if (left < self.f_leftSpace)
            {
                self.f_leftSpace = left;
            }
        }
        self.arr_model = modelArr;
        self.bl_click = actionBlock;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XBActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.btn_content.backgroundColor = [UIColor clearColor];
    cell.destructiveButtonTextColor = self.destructiveButtonTextColor;
    cell.buttonTextColor = self.buttonTextColor;

    //添加分割线,按钮少,cell不会有复用问题
    if (indexPath.section == 0 && indexPath.row != (self.arr_model.count-1))
    {
        CALayer *line = [CALayer new];
        [cell.contentView.layer addSublayer:line];
        line.backgroundColor = [UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1].CGColor;
        line.frame = CGRectMake(kSpaceToBorder, self.buttonHeight - SINGLE_LINE_WIDTH, XBActionSheetScreenW - 2 * kSpaceToBorder, SINGLE_LINE_WIDTH);
    }
    
    XBActionSheetModel *model = self.arr_model[indexPath.row];
    if (indexPath.section == 0)
    {
        if (self.f_leftSpace > 0)
        {
            cell.btn_content.f_spaceOfContentAndBorderForAlign = self.f_leftSpace;
            cell.btn_content.f_spaceOfImageAndTitle = kSpaceOfTitleAndImg;
            cell.btn_content.size_image = CGSizeMake(kTitleImageWidth, kTitleImageWidth);
            cell.btn_content.enum_contentType = XBBtnTypeImageLeft;
            cell.btn_content.enum_contentAlign = XBBtnAlignLeft;
        }
        
        cell.btn_content.font_title = kFontOfTitle;
        cell.isDestructive = self.destructiveButtonIndex == indexPath.row;
        cell.model = model;
    }
    else
    {
        cell.model = self.cancelModel;
    }
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    CALayer *colorLayer = [CALayer new];
    [cell.selectedBackgroundView.layer addSublayer:colorLayer];
    colorLayer.backgroundColor = [[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1] CGColor];
    colorLayer.frame = CGRectMake(kSpaceToBorder, 0, XBActionSheetScreenW - kSpaceToBorder * 2,  self.buttonHeight);
    if (indexPath.section == 1)
    {
        colorLayer.cornerRadius = KRadius;
    }
    else
    {
        if (indexPath.row == 0)
        {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:colorLayer.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(KRadius,KRadius)];
            //创建 layer
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = colorLayer.bounds;
            //赋值
            maskLayer.path = maskPath.CGPath;
            colorLayer.mask = maskLayer;
        }
        else if (indexPath.row == self.arr_model.count - 1)
        {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:colorLayer.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(KRadius,KRadius)];
            //创建 layer
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = colorLayer.bounds;
            //赋值
            maskLayer.path = maskPath.CGPath;
            colorLayer.mask = maskLayer;
        }
    }
    
    return cell;
}

@end
