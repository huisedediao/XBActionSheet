//
//  XBActionSheetCell.m
//  XBActionSheet
//
//  Created by xxb on 2019/3/1.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBActionSheetCell.h"
#import "Masonry.h"

@implementation XBActionSheetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    self.btn_content = ({
        XBButton *btn = [XBButton new];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        btn.userInteractionEnabled = NO;
        btn;
    });
}

- (void)setModel:(XBActionSheetModel *)model
{
    _model = model;
    
    if (self.isDestructive)
    {
        self.btn_content.str_titleNormal = model.str_titleDestructive;
        self.btn_content.img_normal = [UIImage imageNamed:model.str_imageNameDestructive];
        self.btn_content.color_titleNormal = self.destructiveButtonTextColor;
    }
    else
    {
        self.btn_content.str_titleNormal = model.str_titleNormal;
        self.btn_content.img_normal = [UIImage imageNamed:model.str_imageNameNormal];
        self.btn_content.color_titleNormal = self.buttonTextColor;
    }
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
@end
