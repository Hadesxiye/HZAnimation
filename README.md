# UIViewCircleAnimation
a custom view animation effect/一个简单的自定义动画，让UIView以圆形展示和消失。
## Sample gif:
[Sample](https://github.com/Hadesxiye/UIViewCircleAnimation/blob/master/gif/HZViewAnimationSampleGIF.gif)

## Usage:
- 1.将`HZAnimation`文件拖入项目
- 2.在需要使用的页面
```
#import "HZAnimation/UIView+HZAnimation.h"
```
- 3.显示：
```
[<#your UIView obj#> HZAnimationShowDuration:<#AnimationDuration#>  Completed:^{
        NSLog(@"Animation completed");
    }];
```
- 4.隐藏：
```
[<#your UIView obj#> HZAnimationHideDuration:<#AnimationDuration#> Completed:^{
        //TODO: remove view from superView
        //other thing
        NSLog(@"Animation completed");
    }];
```
