//
//  ViewController.m
//  LQCustomerPresent
//
//  Created by 龙强雷 on 2019/6/22.
//  Copyright © 2019 龙强雷. All rights reserved.
//

#import "ViewController.h"
#import "PrsentViewController.h"
#import "LQPresentationManger.h"

@interface ViewController ()
@property(nonatomic,strong)LQPresentationManger <UIViewControllerAnimatedTransitioning> *manger;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)customerPresnet:(UIButton *)sender {
    PrsentViewController *vc = [[PrsentViewController alloc]init];
    //自定义转场动画
    self.manger.type = 0;
    self.manger.rect = CGRectMake(100, 50, 200, 300);
    //设置代理
    vc.transitioningDelegate = self.manger;
    //设置转场动画样式
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)showWindow:(id)sender {
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    //自定义转场动画
    self.manger.type = 1;
    self.manger.rect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-300, [UIScreen mainScreen].bounds.size.width, 300);
    
    //添加遮罩
    //得到view的遮罩路径
    CGSize rsize = CGSizeMake(6,6);
    CGRect sRect = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, self.view.bounds.size.height);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:sRect byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:rsize];
    
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = sRect;
    //赋值
    maskLayer.path = maskPath.CGPath;
    vc.view.layer.mask = maskLayer;

    
    //设置代理
    vc.transitioningDelegate = self.manger;
    //设置转场动画样式
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

-(LQPresentationManger *)manger{
    if (!_manger) {
        _manger = [[LQPresentationManger alloc]init];
        //设置弹出视图的尺寸
      
    }
    return _manger;
}
@end
