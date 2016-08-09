//
//  TestViewModel.h
//  JxbMVVMDemo
//
//  Created by Peter on 16/8/9.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface TestViewModel : NSObject

@property (nonatomic, strong) RACCommand        *command;

@property (nonatomic, copy  ) NSNumber          *colorType;
@property (nonatomic, copy  ) NSNumber          *time;
@end
