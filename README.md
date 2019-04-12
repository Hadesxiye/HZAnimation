# UIViewCircleAnimation
一个使用CABasicAnimation实现的动画封装。用于过渡UIView的展示隐藏。
## Sample gif:
![Sample](https://github.com/Hadesxiye/UIViewCircleAnimation/blob/master/gif/HZViewAnimationSampleGIF.gif)

## Usage:
- 1.将`HZAnimation`文件拖入项目
- 2.在需要使用的页面
```Object-C
#import "HZAnimation/UIView+HZAnimation.h"
```
- 3.显示：
```Object-C
[<#your UIView obj#> HZAnimationShowDuration:<#AnimationDuration#>  Completed:^{
        NSLog(@"Animation completed");
    }];
```
- 4.隐藏：
```Object-C
[<#your UIView obj#> HZAnimationHideDuration:<#AnimationDuration#> Completed:^{
        //TODO: remove view from superView
        //other thing
        NSLog(@"Animation completed");
    }];
```
