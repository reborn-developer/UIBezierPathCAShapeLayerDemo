//
//  BezierPathViewController.m
//  UIBezierPathLayerDemo
//
//  Created by reborn on
//  Copyright © 2016年 reborn. All rights reserved.
//

#import "BezierPathViewController.h"
#import "CustomBezierPathView.h"
#define kScreenWidth                [UIScreen mainScreen].bounds.size.width
#define kScreenHeight               [UIScreen mainScreen].bounds.size.height

@interface BezierPathViewController ()
@property (nonatomic, strong) CustomBezierPathView *pathView;
@property (nonatomic, strong) NSTimer              *timer;
@property (nonatomic, assign) NSInteger            drawIndex;
@property (nonatomic, strong) NSArray              *bezierPathTypeArray;
@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self drawGraphics];
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//UIBezierPath绘制图形
- (void)drawGraphics
{
    CustomBezierPathView *customBezierPathView = [[CustomBezierPathView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, kScreenHeight - 64 - 100)];
    [self.view addSubview:customBezierPathView];
    customBezierPathView.backgroundColor = [UIColor whiteColor];
    
    customBezierPathView.type = BezierPathTypeStraightLinePath;
    self.drawIndex = 0;
    
    self.bezierPathTypeArray = @[@(BezierPathTypeStraightLinePath),
                                 @(BezierPathTypeTrianglePath),
                                 @(BezierPathTypeRectPath),
                                 @(BezierPathTypeCirclePath),
                                 @(BezierPathTypeOvalPath),
                                 @(BezierPathTypeRoundedRectPath),
                                 @(BezierPathTypeArcPath),
                                 @(BezierPathTypeSecondBezierPath),
                                 @(BezierPathTypeThirdBezierPath)];
    
    
    self.pathView = customBezierPathView;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateAnimationType) userInfo:nil repeats:YES];
    
}

- (void)updateAnimationType
{
    if (self.drawIndex + 1 < self.bezierPathTypeArray.count) {
        self.drawIndex ++;
    } else {
        self.drawIndex = 0;
    }
    self.pathView.type = [[self.bezierPathTypeArray objectAtIndex:self.drawIndex] intValue];
    [self.pathView setNeedsDisplay];
}


@end
