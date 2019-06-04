//
//  UIView+HZAnimation.m
//  HZViewAnimationDemo
//
//  Created by 王浩祯 on 2019/4/9.
//  Copyright © 2019 Hades. All rights reserved.
//

#import "UIView+HZAnimation.h"
@implementation UIView (HZAnimation)

- (void)hzCircleShowAnimationDuration:(NSTimeInterval)animationTime Completed:(HZAnimationBlock)completed{
    
    [self hzAnimationShowDuration:animationTime CustomColor:self.backgroundColor SubviewsAnimation:YES Completed:^{
        if (completed) {
            completed();
        }
    }];
    
}

- (void)hzCircleHideAnimationDuration:(NSTimeInterval)animationTime Completed:(HZAnimationBlock)completed{
    
    [self hzAnimationHideDuration:animationTime CustomColor:self.backgroundColor SubviewsAnimation:YES Completed:^{
        if (completed) {
            completed();
        }
    }];
    
}

- (void)hzAnimationShowDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed{
    
    [self hzAnimationShowDuration:animationTime CustomColor:color SubviewsAnimation:YES Completed:^{
        if (completed) {
            completed();
        }
    }];
    
}

- (void)hzAnimationHideDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed{
    
    [self hzAnimationHideDuration:animationTime CustomColor:color SubviewsAnimation:YES Completed:^{
        if (completed) {
            completed();
        }
    }];
    
}

- (void)hzAnimationWithoutSubviewsShowDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed{
    
    [self hzAnimationShowDuration:animationTime CustomColor:color SubviewsAnimation:NO Completed:^{
        if (completed) {
            completed();
        }
    }];
    
}

- (void)hzAnimationWithoutSubviewsHideDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color Completed:(HZAnimationBlock)completed{
    
    [self hzAnimationHideDuration:animationTime CustomColor:color SubviewsAnimation:NO Completed:^{
        if (completed) {
            completed();
        }
    }];
    
}

#pragma mark -- HZAnimation detail ------ =͟͟͞͞⊂(⊂ 'ω')
- (void)hzAnimationShowDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color SubviewsAnimation:(BOOL)isSubviewsAnimation Completed:(HZAnimationBlock)completed{
    
    //记录父视图的属性
    UIColor* originalColor = self.backgroundColor;
    CGFloat originalWid = self.frame.size.width;
    CGFloat originalHei = self.frame.size.height;
    CGFloat animationViewLength;
    
    NSMutableArray* subviewsFrameArr = [NSMutableArray new];
    
    //计算动画视图圆的半径
    animationViewLength = sqrt(originalWid * originalWid + originalHei * originalHei)/2 ;
    //绘制路径
    UIBezierPath* originalCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(originalWid/2, originalHei/2, 0, 0)];
    
    
    UIBezierPath* finalCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(originalWid/2 - animationViewLength, originalHei/2 - animationViewLength, animationViewLength * 2, animationViewLength * 2)];
  
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    self.layer.mask = maskLayer;

    //创建一个关于Path的CABasicAnimation动画从originalCircle到finalCircle
    CABasicAnimation *hzAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    hzAnimation.fromValue = (__bridge id)(originalCircle.CGPath);
    hzAnimation.toValue = (__bridge id)((finalCircle.CGPath));
    hzAnimation.duration = animationTime;
    hzAnimation.delegate = self;
//    //填充效果：动画结束后，动画将保持最后的表现状态
    hzAnimation.fillMode = kCAFillModeForwards;
    hzAnimation.removedOnCompletion = NO;
    //记录子视图frame并修改
    if (isSubviewsAnimation) {

        for (UIView* viewObj in self.subviews) {

            [subviewsFrameArr addObject:[NSValue valueWithCGRect:viewObj.frame]];
            viewObj.frame = CGRectMake(originalWid/2, originalHei/2, 0, 0);
            
        }
    }
    
    self.layer.masksToBounds = YES;
    [maskLayer addAnimation:hzAnimation forKey:@"path"];
    [UIView animateWithDuration:animationTime animations:^{
        
        if (isSubviewsAnimation) {
            NSInteger subviewsNumber = 0;
            for (int i = 0; i < self.subviews.count; i ++) {
                UIView* viewObj = self.subviews[i];
              
                viewObj.frame = [subviewsFrameArr[subviewsNumber] CGRectValue];
                subviewsNumber ++;
                
            }
        }
        
        
    } completion:^(BOOL finished) {
        self.backgroundColor = originalColor;
        completed();
    }];

}

- (void)hzAnimationHideDuration:(NSTimeInterval)animationTime CustomColor:(UIColor *)color SubviewsAnimation:(BOOL)isSubviewsAnimation Completed:(HZAnimationBlock)completed{

    //记录父视图的属性
    CGFloat originalWid = self.frame.size.width;
    CGFloat originalHei = self.frame.size.height;
    CGFloat animationViewLength;

    //计算动画视图圆的半径
    animationViewLength = sqrt(originalWid * originalWid + originalHei * originalHei)/2 ;
    //绘制路径
    UIBezierPath* originalCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(originalWid/2 - animationViewLength, originalHei/2 - animationViewLength, animationViewLength * 2, animationViewLength * 2)];
    
    UIBezierPath* finalCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(originalWid/2, originalHei/2, 0, 0)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalCircle.CGPath;
    
    self.layer.mask = maskLayer;

    //记录子视图frame，在动画结束时还原
    NSMutableArray* subviewsFrameArr = [NSMutableArray new];
    if (isSubviewsAnimation) {
        
        for (UIView* viewObj in self.subviews) {
            
            [subviewsFrameArr addObject:[NSValue valueWithCGRect:viewObj.frame]];
            
        }
    }
    
    
    //创建一个关于Path的CABasicAnimation动画从originalCircle到finalCircle
    CABasicAnimation *hzAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    hzAnimation.fromValue = (__bridge id)(originalCircle.CGPath);
    hzAnimation.toValue = (__bridge id)((finalCircle.CGPath));
    hzAnimation.duration = animationTime;
    hzAnimation.delegate = self;

    self.layer.masksToBounds = YES;
    [maskLayer addAnimation:hzAnimation forKey:@"path"];

    [UIView animateWithDuration:animationTime animations:^{
        
        if (isSubviewsAnimation) {

            for (UIView* viewObj in self.subviews) {
                viewObj.frame = CGRectMake(originalWid/2, originalHei/2, 0, 0);
            }

        }
        
    } completion:^(BOOL finished) {
        
        if (isSubviewsAnimation) {
            
            for (int i = 0; i < self.subviews.count; i ++) {
                UIView* viewObj = self.subviews[i];
                NSValue* frameValue = subviewsFrameArr[i];
                viewObj.frame = frameValue.CGRectValue;
            }
        }
        completed();
    }];

    
}

#pragma mark - CABasicAnimation的Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //清除 fromVC 的 mask
    self.layer.mask = nil;
    
}

@end
