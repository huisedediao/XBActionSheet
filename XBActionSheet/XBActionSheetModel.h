//
//  XBActionSheetModel.h
//  XBActionSheet
//
//  Created by xxb on 2019/3/1.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBActionSheetModel : NSObject
///正常状态下的title
@property (nonatomic,copy) NSString *str_titleNormal;
///警告状态下的title
@property (nonatomic,copy) NSString *str_titleDestructive;
///正常状态下的image
@property (nonatomic,copy) NSString *str_imageNameNormal;
///警告状态下单image
@property (nonatomic,copy) NSString *str_imageNameDestructive;
@end

NS_ASSUME_NONNULL_END
