//
//  XBActionSheetModel.m
//  XBActionSheet
//
//  Created by xxb on 2019/3/1.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBActionSheetModel.h"

@implementation XBActionSheetModel

- (NSString *)str_imageNameDestructive
{
    if (_str_imageNameDestructive.length == 0)
    {
        return _str_imageNameNormal;
    }
    return _str_imageNameDestructive;
}

- (NSString *)str_titleDestructive
{
    if (_str_titleDestructive.length == 0)
    {
        return _str_titleNormal;
    }
    return _str_titleDestructive;
}

@end
