//
//  ShopCartAnimationManager.m
//  AnimationTest
//
//  Created by reborn on .
//  Copyright © 2015年 reborn. All rights reserved.
//

#import "ShopCartAnimationManager.h"
#import "AppDelegate.h"
#define kScreenWidth                [UIScreen mainScreen].bounds.size.width
#define kScreenHeight               [UIScreen mainScreen].bounds.size.height
#define APP_DELEGATE                ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface ShopCartAnimationManager ()<CAAnimationDelegate>
{
    CALayer        *layer;
    CALayer        *windowLayer;
}
@property (nonatomic,strong) UIBezierPath    *path;
@end

@implementation ShopCartAnimationManager

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = self.new;
    });
    return instance;
}

-(void)startAnimationWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    [self createAnimationPathWithStartPoint:startPoint endPoint:endPoint];
    [self startAnimation];
}

- (void)createAnimationPathWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    if (self.path == nil) {
        self.path = [UIBezierPath bezierPath];
    } else {
        [self.path removeAllPoints];
    }
    //起始点
    [_path moveToPoint:startPoint];
    
    /**
     *  画二元曲线，一般和moveToPoint配合使用
     *
     *   addPoint     曲线的终点 - 购物车按钮的坐标
     *   controlPoint 画曲线的基准点
     */
    
    float sx = startPoint.x;
    
    float sy = startPoint.y;
    
    float ex = endPoint.x;
    
    float ey = endPoint.y;
    
    float x = sx + (ex - sx) / 3;
    float y = sy + (ey - sy) * 0.5 - 200;
    
    [_path addQuadCurveToPoint:endPoint controlPoint:CGPointMake(x, y)];
}

-(void)startAnimation
{
    AppDelegate *appDelegate = APP_DELEGATE;
    if (!windowLayer) {
        windowLayer = [CALayer layer];
        windowLayer.bounds = [UIScreen mainScreen].bounds;
        [appDelegate.window.layer addSublayer:windowLayer];
    }
    if (!layer)
    {
        layer = [CALayer layer];
        layer.contents = (__bridge id)[UIImage imageNamed:@"icon_redDot.png"].CGImage;
        layer.contentsGravity = kCAGravityResizeAspectFill;
        layer.bounds = CGRectMake(100, 100, 20, 20);
        [layer setCornerRadius:CGRectGetHeight([layer bounds]) / 2];
        layer.masksToBounds = YES;
        layer.position =CGPointMake(50, 150);
        [appDelegate.window.layer addSublayer:layer];
    }
    layer.hidden = NO;
    [self groupAnimation];
}

-(void)groupAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = _path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    //放大
//    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    expandAnimation.duration = 0.25f;
//    expandAnimation.fromValue = [NSNumber numberWithFloat:1];
//    expandAnimation.toValue = [NSNumber numberWithFloat:2.0f];
//    expandAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //缩小
    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = 0.5;
    narrowAnimation.duration = 0.25f;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:2.0f];
    narrowAnimation.toValue = [NSNumber numberWithFloat:0.5f];
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
//        groups.animations = @[animation,expandAnimation,narrowAnimation];
    groups.animations = @[animation,narrowAnimation];
    groups.duration = 0.5f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    [layer addAnimation:groups forKey:@"group"];
}

#pragma mark
#pragma mark CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [layer animationForKey:@"group"])
    {
        [layer removeAllAnimations];
        layer.hidden = YES;
    }
}


@end
