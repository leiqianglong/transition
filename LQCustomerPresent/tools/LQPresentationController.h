//
//  LQPresentationController.h
//  LQCustomerPresent
//
//  Created by 龙强雷 on 2019/6/22.
//  Copyright © 2019 龙强雷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LQPresentationController : UIPresentationController
@property(nonatomic,strong)UIControl *coverView;//蒙版
@property(nonatomic,assign)CGRect rect;
@end

NS_ASSUME_NONNULL_END
