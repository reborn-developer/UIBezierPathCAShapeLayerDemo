//
//  ShopCartAnimationManager.h
//  AnimationTest
//
//  Created by reborn on .
//  Copyright © 2015年 reborn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCartAnimationManager : NSObject

+(instancetype)sharedInstance;

-(void)startAnimationWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
@end
