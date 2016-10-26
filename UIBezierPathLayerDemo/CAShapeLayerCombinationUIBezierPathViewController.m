//
//  CAShapeLayerCombinationUIBezierPathViewController.m
//  UIBezierPathLayerDemo
//
//  Created by reborn on
//  Copyright © 2016年 reborn. All rights reserved.
//

#import "CAShapeLayerCombinationUIBezierPathViewController.h"

@interface CAShapeLayerCombinationUIBezierPathViewController ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) NSTimer       *timer;

@end

@implementation CAShapeLayerCombinationUIBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawCircleView];
    
//    [self drawHalfCircleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 组合使用CAShapeLayer与UIBezierPath画圆
- (CAShapeLayer *)drawCircleView
{
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    
    //设置frame
    circleShapeLayer.frame = CGRectMake(0, 0, 200, 200);
    circleShapeLayer.position = self.view.center;
    
    //设置填充颜色
    circleShapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    //设置线宽
    circleShapeLayer.lineWidth = 2.0;
    
    //设置线的颜色
    circleShapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    CGRect frame = CGRectMake(0, 0, 200, 200);
    
    //使用UIBezierPath创建路径
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];
    
    //关联CAShapeLayer与UIBezierPath
    circleShapeLayer.path = circlePath.CGPath;
    
    //将CAShaperLayer添加到某个层上显示
    [self.view.layer addSublayer:circleShapeLayer];
    
    return circleShapeLayer;

}

- (void)drawHalfCircleView
{
    self.shapeLayer = [self drawCircleView];
    
    self.shapeLayer.strokeStart = 0.0;
    self.shapeLayer.strokeEnd = 0.50;
    
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateCircleProgress) userInfo:nil repeats:YES];

}

- (void)updateCircleProgress
{
    if (self.shapeLayer.strokeEnd > 1 &&self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += 0.1;
    } else if (self.shapeLayer.strokeStart == 0) {
        self.shapeLayer.strokeStart += 0.1;
    }
    
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0;
    }
    
    if (self.shapeLayer.strokeStart >= 1 && self.shapeLayer.strokeEnd >= 1) {
        self.shapeLayer.strokeStart = 0;
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
