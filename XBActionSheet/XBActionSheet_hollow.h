//
//  XBActionSheet_hollow.h
//  XBActionSheet
//
//  Created by xxb on 2019/3/1.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "XBActionSheet.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBActionSheet_hollow : XBActionSheet
- (instancetype)initWithTitleArr:(NSArray *)titleArr actionBlock:(XBActionSheetBlock)actionBlock;
- (instancetype)initWithModelArr:(NSArray *)modelArr actionBlock:(XBActionSheetBlock)actionBlock;
@end

NS_ASSUME_NONNULL_END
