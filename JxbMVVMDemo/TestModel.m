//
//  TestModel.m
//  JxbMVVMDemo
//
//  Created by Peter on 16/8/9.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

+ (void)getModel:(void(^)(TestModel* model))block {
    //模拟网络获取model
    TestModel* model = [[TestModel alloc] init];
    model.time = @([[NSDate date] timeIntervalSince1970]);
    model.colorType = @(model.time.integerValue % 3);
    
    if (block != NULL) {
        block(model);
    }
}

@end
