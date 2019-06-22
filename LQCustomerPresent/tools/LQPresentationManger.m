//
//  LQPresentationManger.m
//  LQCustomerPresent
//
//  Created by 龙强雷 on 2019/6/22.
//  Copyright © 2019 龙强雷. All rights reserved.
//

#import "LQPresentationManger.h"


@interface LQPresentationManger()
@property(nonatomic,assign)BOOL isPresent;
@end


@implementation LQPresentationManger

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    LQPresentationController *p = [[LQPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    p.rect = self.rect;
    return p;
}
//返回一个负责转场如何出现的对象
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.isPresent = YES;
    return self;
}
//返回一个负责转场如何消失的对象
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.isPresent = NO;
    return self;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
//管理modal如何展现和消失，展现和消失都会调用该方法
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    if (self.isPresent) {
        [self viewPresent:transitionContext];
    }else{
        [self viewDismiss:transitionContext];
    }
}
-(void)viewPresent:(id<UIViewControllerContextTransitioning>)transitionContext{
    //添加到contenview
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    if (toView) {
        [transitionContext.containerView addSubview:toView];
        //设置锚点
        toView.layer.anchorPoint = CGPointMake(0.5, 0);
        toView.transform = CGAffineTransformMakeScale(1, 0.00001);
        [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
            toView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];//必须告诉系统动画完成
        }];
    }
}
-(void)viewDismiss:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    if (fromView) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            fromView.transform = CGAffineTransformMakeScale(1, 0.00001);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];//必须告诉系统动画完成
        }];
    }
}
@end
