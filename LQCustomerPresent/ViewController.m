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
        _manger.rect = CGRectMake(100, 50, 200, 300);
    }
    return _manger;
}
@end
