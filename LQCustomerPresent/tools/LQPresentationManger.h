//
//  LQPresentationManger.h
//  LQCustomerPresent
//
//  Created by 龙强雷 on 2019/6/22.
//  Copyright © 2019 龙强雷. All rights reserved.
//

//专门管理转场动画的管理类
#import <Foundation/Foundation.h>
#import "LQPresentationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LQPresentationManger : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>

@property(nonatomic,assign)CGRect rect;
@end

NS_ASSUME_NONNULL_END
