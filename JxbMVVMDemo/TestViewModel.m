//
//  TestViewModel.m
//  JxbMVVMDemo
//
//  Created by Peter on 16/8/9.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import "TestViewModel.h"
#import "TestModel.h"

@implementation TestViewModel

- (void)getData {
    @weakify(self);
    [TestModel getModel:^(TestModel *model) {
        self_weak_.colorType = model.colorType;
        self_weak_.time = model.time;
    }];
}

- (RACCommand *)command {
    if(!_command) {
        @weakify(self);
        _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [self_weak_ getData];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _command;
}

@end
