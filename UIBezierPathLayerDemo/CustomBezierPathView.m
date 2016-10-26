//
//  CustomBezierPathView.m
//  UIBezierPathLayerDemo
//
//  Created by reborn on 
//  Copyright © 2016年 reborn. All rights reserved.
//

#import "CustomBezierPathView.h"
#define kDegreesToRadians(degrees)  ((M_PI * degrees)/ 180)
@implementation CustomBezierPathView

- (void)drawRect:(CGRect)rect
{
    switch (self.type) {
            
        case BezierPathTypeStraightLinePath:
            
            [self drawStraightLinePath];
            break;
            
        case BezierPathTypeTrianglePath:
            
            [self drawTrianglePath];
            break;
            
        case BezierPathTypeRectPath:
            
            [self drawRectPath];
            break;
            
        case BezierPathTypeCirclePath:
            
            [self drawCiclePath];
            break;
            
        case BezierPathTypeOvalPath:
            
            [self drawOvalPath];
            break;
            
        case BezierPathTypeRoundedRectPath:
            
            [self drawRoundedRectPath];
            break;
        
        case BezierPathTypeArcPath:
            
            [self drawArcPath];
            break;
            
        case BezierPathTypeSecondBezierPath:
            
            [self drawSecondBezierPath];
            break;
            
        case BezierPathTypeThirdBezierPath:
            
            [self drawThirdBezierPath];
            break;
            
        default:
            break;
    }
}

//直线
- (void)drawStraightLinePath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    //添加路径(起点(100,100)到终点(200,100)的线段)到path
    [path moveToPoint:CGPointMake(100 , 100)];
    [path addLineToPoint:CGPointMake(200, 100)];
    
    //设置描边宽度
    path.lineWidth = 2;
    
    //设置画笔颜色
    UIColor *strokeColor = [UIColor orangeColor];
    [strokeColor set];
    
    //将path绘制出来
    [path stroke];
}

//三角形
- (void)drawTrianglePath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - 45, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - 45, self.frame.size.height - 20)];
    
    [path closePath];
    
    //设置描边宽度
    path.lineWidth = 2;
    
    //设置填充颜色
    UIColor *fillColor = [UIColor cyanColor];
    [fillColor set];
    //填充
    [path fill];
    
    //设置画笔颜色
    UIColor *strokeColor = [UIColor orangeColor];
    [strokeColor set];
    //描边
    [path stroke];
    
}

//矩形
- (void)drawRectPath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
    
    path.lineCapStyle = kCGLineCapRound;   //线条拐角
    path.lineJoinStyle = kCGLineJoinBevel; //终点处理
    
    path.lineWidth = 2;
    
    //设置填充颜色
    UIColor *fillColor = [UIColor yellowColor];
    [fillColor set];
    //填充
    [path fill];
    
    //设置画笔颜色
    UIColor *strokeColor = [UIColor orangeColor];
    [strokeColor set];
    //描边
    [path stroke];
}

//圆形
-(void)drawCiclePath
{
    //注意需要传入正方形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(60, 60, 150, 150)];

    path.lineWidth = 2;

    //设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    //填充
    [path fill];
    
    //设置画笔颜色
    UIColor *strokeColor = [UIColor orangeColor];
    [strokeColor set];
    //描边
    [path stroke];
}

//画椭圆
- (void)drawOvalPath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 60)];
    
    path.lineWidth = 2;

    //设置填充颜色
    UIColor *fillColor = [UIColor magentaColor];
    [fillColor set];
    //填充
    [path fill];
    
    //设置画笔颜色
    UIColor *strokeColor = [UIColor orangeColor];
    [strokeColor set];
    //描边
    [path stroke];
    
}

//带圆角的矩形
- (void)drawRoundedRectPath
{
    //制定右上角为圆角
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];
    
    //四个角都是圆角
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) cornerRadius:20];
    
    //设置填充颜色
    UIColor *fillColor = [UIColor orangeColor];
    [fillColor set];
    //填充
    [path fill];
    
    //设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    //描边
    [path stroke];
    
}

//弧
- (void)drawArcPath
{
    CGPoint centerPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:100 startAngle:0 endAngle:kDegreesToRadians(135) clockwise:YES];
    
    path.lineCapStyle = kCGLineCapRound;  //线条拐角
    path.lineJoinStyle = kCGLineJoinRound;//终点处理
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}

//二次贝塞尔曲线
- (void)drawSecondBezierPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置一个起始点
    [path moveToPoint:CGPointMake(20, self.frame.size.height - 100)];
    
    //添加二次曲线 controlPoint控制点
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - 20, self.frame.size.height - 100) controlPoint:CGPointMake(self.frame.size.width / 2, 0)];
    
    path.lineCapStyle = kCGLineCapRound;   //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor purpleColor];
    [strokeColor set];
    
    [path stroke];
}

//三次贝塞尔曲线
- (void)drawThirdBezierPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置起始点
    [path moveToPoint:CGPointMake(20, 50)];
    
    //添加三次曲线 controlPoint1控制点1 controlPoint2控制点2
    [path addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 100)];
    
    path.lineCapStyle = kCGLineCapRound;   //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}

@end
