//
//  LQPresentationController.m
//  LQCustomerPresent
//
//  Created by 龙强雷 on 2019/6/22.
//  Copyright © 2019 龙强雷. All rights reserved.
//

#import "LQPresentationController.h"

@implementation LQPresentationController

-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController{
    if (self == [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        
    }
    return self;
}
//用于布局转场弹出的控件
- (void)containerViewWillLayoutSubviews{
//    self.presentedView.frame = CGRectMake(100, 100, 200, 300);
    self.presentedView.frame = self.rect;
    //添加蒙版
    [self.containerView insertSubview:self.coverView atIndex:0];
}

-(void)dismiss{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

-(UIControl *)coverView{
    if (!_coverView) {
        _coverView = [[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [_coverView addTarget:self action:@selector(dismiss) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _coverView;
}
@end
