//
//  ViewController.m
//  HZViewAnimationDemo
//
//  Created by 王浩祯 on 2019/4/9.
//  Copyright © 2019 Hades. All rights reserved.
//

#import "ViewController.h"
#import "HZAnimation/UIView+HZAnimation.h"

@interface ViewController ()
@property (strong, nonatomic) UIButton* showButton;
@property (strong, nonatomic) UIButton* hideButton;
@property (assign, nonatomic) BOOL isShow;
@end
#define VIEW_WID self.view.frame.size.width
#define VIEW_HEI self.view.frame.size.height
#define colorRGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
@implementation ViewController
{
    UIView* view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = colorRGB(223, 230, 233);
    
    
    [self.view addSubview:self.showButton];
    [self.view addSubview:self.hideButton];
}

- (UIButton *)showButton{
    if (!_showButton) {
        UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(VIEW_WID/2 - 50, VIEW_HEI - 200, 100, 30)];
        [button setTitle:@"show" forState:UIControlStateNormal];
        button.backgroundColor = colorRGB(45, 52, 54);
        [button addTarget:self action:@selector(showView)
         forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = 5;
        _showButton = button;
    }
    return _showButton;
}

- (UIButton *)hideButton{
    if (!_hideButton) {
        UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(VIEW_WID/2 - 50, VIEW_HEI - 100, 100, 30)];
        [button setTitle:@"hide" forState:UIControlStateNormal];
        button.backgroundColor = colorRGB(45, 52, 54);
        [button addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = 5;
        _hideButton = button;
    }
    return _hideButton;
}

- (void)showView{
    if (_isShow) {
        return;
    }
    _isShow = !_isShow;
    view = [[UIView alloc]initWithFrame:CGRectMake(VIEW_WID/2 - 150, 100, 300, 200)];
    view.backgroundColor = colorRGB(108, 92, 231);
    view.layer.cornerRadius = 10;
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 200, 30)];
    label.backgroundColor = colorRGB(116, 185, 255);
    label.text = @"This is a label on view";
    label.layer.cornerRadius = 5;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 240, 40)];
    button.backgroundColor = colorRGB(255, 118, 117);
    [button setTitle:@"this is a button on view" forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    
    [view addSubview:button];
    [self.view addSubview:view];
    [view HZCircleShowAnimationDuration:0.5  Completed:^{
        NSLog(@"动画结束");
    }];
}

- (void)hideView{
    if (!_isShow) {
        return;
    }
    _isShow = !_isShow;
    [view HZCircleHideAnimationDuration:0.5 Completed:^{
        [self->view removeFromSuperview];
        NSLog(@"动画结束");
    }];
}

@end
