//
//  TestModel.h
//  JxbMVVMDemo
//
//  Created by Peter on 16/8/9.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property (nonatomic, copy  ) NSNumber   *colorType;
@property (nonatomic, copy  ) NSNumber   *time;

/**
 *  获取模型
 *
 *  @param block 
 */
+ (void)getModel:(void(^)(TestModel* model))block;
@end
