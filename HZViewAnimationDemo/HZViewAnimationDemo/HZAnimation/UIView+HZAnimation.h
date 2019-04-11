//
//  UIView+HZAnimation.h
//  HZViewAnimationDemo
//
//  Created by 王浩祯 on 2019/4/9.
//  Copyright © 2019 Hades. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HZAnimation)<CAAnimationDelegate>
typedef void (^HZAnimationBlock)(void);

/**
 根据UIView的backgroundColor展示UIView
 */
- (void)HZAnimationShowDuration:(NSTimeInterval)animationTime Completed:(HZAnimationBlock)completed;
/**
 根据UIView的backgroundColor隐藏UIView
 */
- (void)HZAnimationHideDuration:(NSTimeInterval)animationTime Completed:(HZAnimationBlock)completed;

/**
 自定义Color展示UIView
 */
- (void)HZAnimationShowDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;
/**
 自定义Color隐藏UIView
 */
- (void)HZAnimationHideDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;

/**
 无子视图动画效果，自定义Color展示UIView
 */
- (void)HZAnimationWithoutSubviewsShowDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;

/**
 无子视图动画效果，自定义Color隐藏UIView
 */
- (void)HZAnimationWithoutSubviewsHideDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;

@end

NS_ASSUME_NONNULL_END
