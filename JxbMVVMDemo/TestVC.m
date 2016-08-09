//
//  TestVC.m
//  JxbMVVMDemo
//
//  Created by Peter on 16/8/9.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import "TestVC.h"
#import "TestViewModel.h"
#import "TestView.h"

@interface TestVC ()
@property (nonatomic, strong) TestViewModel *viewModel;
@property (nonatomic, strong) TestView      *testView;
@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.testView];
    
    @weakify(self);
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        [self_weak_.viewModel.command execute:@"123"];
    }];
    [self.view addGestureRecognizer:tap];
    self.view.userInteractionEnabled = YES;
    
}

- (TestView*)testView {
    if (!_testView) {
        _testView = [[TestView alloc] initWithVM:self.viewModel];
        _testView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 100);
    }
    return _testView;
}

- (TestViewModel*)viewModel {
    if (!_viewModel) {
        _viewModel = [[TestViewModel alloc] init];
    }
    return _viewModel;
}

@end
