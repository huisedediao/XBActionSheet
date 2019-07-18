//
//  XBActionSheet.m
//  XBActionSheet
//
//  Created by XXB on 16/7/22.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "XBActionSheet.h"

@interface XBActionSheet ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation XBActionSheet

-(instancetype)init
{
    if (self=[super init])
    {
        self.destructiveButtonIndex = 10000;
        self.backgroundColor = [UIColor whiteColor];
        self.buttonHeight = 50;
        self.hideWhileClickContentBtn = YES;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"XBActionSheet 销毁");
}
- (instancetype)initWithTitleArr:(NSArray *)titleArr cancelBtnTitle:(NSString *)cancelBtnTitle actionBlock:(XBActionSheetBlock)actionBlock
{
    if (self = [super initWithDisplayView:[[UIApplication sharedApplication].delegate window]])
    {
        NSMutableArray *arrM = [NSMutableArray new];
        
        for (NSString *title in titleArr)
        {
            XBActionSheetModel *model = [XBActionSheetModel new];
            model.str_titleNormal = title;
            [arrM addObject:model];
        }
        self.arr_model = arrM;
        self.cancelBtnTitle = cancelBtnTitle;
        self.bl_click = actionBlock;
    }
    return self;
}

- (void)actionBeforeShow
{
    CGFloat buttonH = self.buttonHeight;
    CGFloat spaceH = self.space;
    CGFloat selfHeight = self.arr_model.count * buttonH + ([@(!self.hideCancelBtn) intValue] * (buttonH + spaceH)) + XBActionSheetBottomSpaceToScreen;
    CGFloat selfWidth = XBActionSheetScreenW - self.gapToBorder * 2;
    CGFloat selfX = self.gapToBorder;
    
    CGRect showRect = CGRectMake(selfX, XBActionSheetScreenH - selfHeight, selfWidth, selfHeight);
    CGRect hiddenRect = CGRectMake(selfX, XBActionSheetScreenH, selfWidth, selfHeight);
    
    self.showLayoutBlock = ^(XBAlertViewBase *alertView){
        alertView.frame = showRect;
    };
    self.hiddenLayoutBlock = ^(XBAlertViewBase *alertView){
        alertView.frame = hiddenRect;
    };
    
    [self.xbTbaleView reloadData];
}

#pragma mark - TableView代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.hideCancelBtn == NO)       return 2;
    else                                return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)   return self.arr_model.count;
    else                return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XBActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.destructiveButtonTextColor = self.destructiveButtonTextColor;
    cell.buttonTextColor = self.buttonTextColor;
    //添加分割线,按钮少,cell不会有复用问题
    if (indexPath.section == 0 && indexPath.row != (self.arr_model.count-1))
    {
        CALayer *line = [CALayer new];
        [cell.contentView.layer addSublayer:line];
        line.backgroundColor = [UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1].CGColor;
        line.frame = CGRectMake(XBActionSheetLineViewSpaceToBorder, self.buttonHeight - SINGLE_LINE_WIDTH, XBActionSheetScreenW - 2 * XBActionSheetLineViewSpaceToBorder, SINGLE_LINE_WIDTH);
    }
    
    XBActionSheetModel *model = self.arr_model[indexPath.row];
    if (indexPath.section == 0)
    {
        if (self.destructiveButtonIndex == indexPath.row)
        {
            cell.isDestructive = YES;
        }
        else
        {
            cell.isDestructive = NO;
        }
        cell.model = model;
    }
    else
    {
        cell.model = self.cancelModel;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.buttonHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.space);
    view.backgroundColor = self.spaceColor;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    else
    {
        return [self tableView:tableView viewForHeaderInSection:section].bounds.size.height;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        if (self.hideWhileClickContentBtn)
        {
            [self hidden];
        }
    }
    else
    {
        [self hidden];
    }
    
    
    if (indexPath.section == 0)
    {
        if ([self.delegate respondsToSelector:@selector(actionSheet:clickedAtIndex:)])
        {
            [self.delegate actionSheet:self clickedAtIndex:indexPath.row];
        }
        if (self.bl_click)
        {
            self.bl_click(self, indexPath.row);
        }
    }
}

#pragma mark - 懒加载
-(UITableView *)xbTbaleView
{
    if (_xbTbaleView == nil)
    {
        _xbTbaleView = [UITableView new];
        [self addSubview:_xbTbaleView];
        
        [_xbTbaleView registerClass:[XBActionSheetCell class] forCellReuseIdentifier:@"cell"];
        _xbTbaleView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _xbTbaleView.delegate = self;
        _xbTbaleView.dataSource = self;
        _xbTbaleView.scrollEnabled = NO;
        
        [_xbTbaleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _xbTbaleView;
}

- (CGFloat)buttonHeight
{
    if (_buttonHeight == 0)
    {
        return 44;
    }
    return _buttonHeight;
}

- (CGFloat)space
{
    if (_space == 0)
    {
        return XBActionSheetDefaultSectionHeaderH;
    }
    return _space;
}

- (UIColor *)spaceColor
{
    if (_spaceColor == nil)
    {
        return [[UIColor grayColor] colorWithAlphaComponent:0.1];
    }
    return _spaceColor;
}

- (UIColor *)buttonTextColor
{
    if (_buttonTextColor == nil)
    {
        return [[UIColor blackColor] colorWithAlphaComponent:0.8];
    }
    return _buttonTextColor;
}

- (UIColor *)destructiveButtonTextColor
{
    if (_destructiveButtonTextColor == nil)
    {
        return [UIColor redColor];
    }
    return _destructiveButtonTextColor;
}

- (XBActionSheetModel *)cancelModel
{
    if (_cancelModel == nil)
    {
        _cancelModel = [XBActionSheetModel new];
        _cancelModel.str_titleNormal = self.cancelBtnTitle;
    }
    return _cancelModel;
}

- (NSString *)cancelBtnTitle
{
    if (_cancelBtnTitle == nil)
    {
        return NSLocalizedString(@"Cancel",nil);
    }
    return _cancelBtnTitle;
}

@end
