//
//  EnumType.h
//  UIBezierPathLayerDemo
//
//  Created by reborn on
//  Copyright © 2016年 reborn. All rights reserved.
//

#ifndef EnumType_h
#define EnumType_h

typedef NS_ENUM(NSUInteger, BezierPathType) {
    
    BezierPathTypeStraightLinePath = 0,  //直线
    BezierPathTypeTrianglePath = 1,      // 三角形
    BezierPathTypeRectPath = 2,          // 矩形
    BezierPathTypeCirclePath = 3,        // 圆
    BezierPathTypeOvalPath = 4,          // 椭圆
    BezierPathTypeRoundedRectPath = 5,   // 带圆角矩形
    BezierPathTypeArcPath = 6,           // 圆弧
    BezierPathTypeSecondBezierPath = 7,  // 二次贝塞尔曲线
    BezierPathTypeThirdBezierPath = 8    // 三次贝塞尔曲线
};

#endif /* EnumType_h */
