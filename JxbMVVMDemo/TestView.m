//
//  TestView.m
//  JxbMVVMDemo
//
//  Created by Peter on 16/8/9.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import "TestView.h"
#import "TestViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface TestView()
@property (nonatomic, weak) TestViewModel   *viewModel;
@end

@implementation TestView

- (instancetype)initWithVM:(TestViewModel*)vm {
    self = [super init];
    if (self) {
        self.viewModel = vm;
        @weakify(self);
        [RACObserve(self.viewModel, colorType) subscribeNext:^(NSNumber* x) {
            switch (x.integerValue) {
                case 0:
                    self_weak_.backgroundColor = [UIColor redColor];
                    break;
                case 1:
                    self_weak_.backgroundColor = [UIColor greenColor];
                    break;
                case 2:
                    self_weak_.backgroundColor = [UIColor blueColor];
                    break;
                default:
                    self_weak_.backgroundColor = [UIColor blackColor];
                    break;
            }
        }];
        
        [RACObserve(self.viewModel, time) subscribeNext:^(NSNumber* x) {
            NSLog(@"时间点：%f",x.doubleValue);
        }];
    }
    return self;
}


@end
