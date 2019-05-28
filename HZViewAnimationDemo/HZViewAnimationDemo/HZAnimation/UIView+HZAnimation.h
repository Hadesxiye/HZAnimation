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
 圆形遮罩显示动画
 */
- (void)hzCircleShowAnimationDuration:(NSTimeInterval)animationTime Completed:(HZAnimationBlock)completed;
/**
 圆形遮罩隐藏动画
 */
- (void)hzCircleHideAnimationDuration:(NSTimeInterval)animationTime Completed:(HZAnimationBlock)completed;

/**
 自定义Color展示UIView
 */
- (void)hzAnimationShowDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;
/**
 自定义Color隐藏UIView
 */
- (void)hzAnimationHideDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;

/**
 无子视图动画效果，自定义Color展示UIView
 */
- (void)hzAnimationWithoutSubviewsShowDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;

/**
 无子视图动画效果，自定义Color隐藏UIView
 */
- (void)hzAnimationWithoutSubviewsHideDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed;

@end

NS_ASSUME_NONNULL_END
