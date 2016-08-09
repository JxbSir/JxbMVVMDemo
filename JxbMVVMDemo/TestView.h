//
//  TestView.h
//  JxbMVVMDemo
//
//  Created by Peter on 16/8/9.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestViewModel;

@interface TestView : UIView

- (instancetype)initWithVM:(TestViewModel*)vm;
@end
