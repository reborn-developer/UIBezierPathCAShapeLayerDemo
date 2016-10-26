//
//  ViewController.m
//  UIBezierPathLayerDemo
//
//  Created by reborn on
//  Copyright © 2016年 reborn. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathViewController.h"
#import "CAShapeLayerCombinationUIBezierPathViewController.h"
#import "ShopCartAnimationManager.h"
#define kScreenWidth                [UIScreen mainScreen].bounds.size.width
#define kScreenHeight               [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 300, 30);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"BezierPath" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(BezierPathAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(10, 150, 300, 30);
    secondButton.backgroundColor = [UIColor blueColor];
    [secondButton setTitle:@"CAShapeLayer与UIBezierPath组合" forState:UIControlStateNormal];
    [secondButton addTarget:self action:@selector(CombinationAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secondButton];
    
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    thirdButton.frame = CGRectMake(10, 200, 300, 30);
    thirdButton.backgroundColor = [UIColor blueColor];
    [thirdButton setTitle:@"购物车动画" forState:UIControlStateNormal];
    [thirdButton addTarget:self action:@selector(shopCartAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdButton];
}

- (void)BezierPathAction:(id)sender
{
    BezierPathViewController *bezierPathVC = [[BezierPathViewController alloc] init];
    [self.navigationController pushViewController:bezierPathVC animated:YES];
}

- (void)CombinationAction:(id)sender
{
    CAShapeLayerCombinationUIBezierPathViewController *shapeLayerCombinationUIBezierPathVC = [[CAShapeLayerCombinationUIBezierPathViewController alloc] init];
    [self.navigationController pushViewController:shapeLayerCombinationUIBezierPathVC animated:YES];

}
- (void)shopCartAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [[ShopCartAnimationManager sharedInstance] startAnimationWithStartPoint:button.frame.origin endPoint:CGPointMake(kScreenWidth - 10.f - 30.f,kScreenHeight-80.f)];
}
@end
