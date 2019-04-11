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
@end
#define VIEW_WID self.view.frame.size.width
#define VIEW_HEI self.view.frame.size.height
@implementation ViewController
{
    UIView* view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.showButton];
    [self.view addSubview:self.hideButton];
}

- (UIButton *)showButton{
    if (!_showButton) {
        UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(VIEW_WID/2 - 50, VIEW_HEI - 200, 100, 30)];
        [button setTitle:@"show" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        [button addTarget:self action:@selector(showView)
         forControlEvents:UIControlEventTouchUpInside];
        _showButton = button;
    }
    return _showButton;
}

- (UIButton *)hideButton{
    if (!_hideButton) {
        UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(VIEW_WID/2 - 50, VIEW_HEI - 100, 100, 30)];
        [button setTitle:@"hide" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        [button addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        _hideButton = button;
    }
    return _hideButton;
}

- (void)showView{
    view = [[UIView alloc]initWithFrame:CGRectMake(VIEW_WID/2 - 150, 100, 300, 200)];
    view.backgroundColor = [UIColor yellowColor];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 200, 30)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"This is a label on view";
    [view addSubview:label];
    
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 240, 40)];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"this is a button on view" forState:UIControlStateNormal];
    [view addSubview:button];
    [self.view addSubview:view];
    [view HZAnimationShowDuration:0.5  Completed:^{
        NSLog(@"动画结束");
    }];
}

- (void)hideView{
    [view HZAnimationHideDuration:0.5 Completed:^{
        [self->view removeFromSuperview];
        NSLog(@"动画结束");
    }];
}

@end
