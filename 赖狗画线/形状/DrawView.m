//
//  DrawView.m
//  赖狗画线
//
//  Created by 赖天翔 on 16/8/10.
//  Copyright © 2016年 赖天翔. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  
    UIColor *color = [UIColor blackColor];
    [color set]; //设置线条颜色
    [[UIColor orangeColor]setFill];
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 2.0;
    
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(50.0, 1.0)];
    
    // Draw the lines
//    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
//    [aPath addLineToPoint:CGPointMake(160, 140)];
//    [aPath addLineToPoint:CGPointMake(40.0, 140)];
//    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    
    
    [aPath moveToPoint:CGPointMake(50, 1.0)];
    [aPath addLineToPoint:CGPointMake(rect.size.width-50, 1)];
    [aPath addLineToPoint:CGPointMake(rect.size.width-1, 50)];
    [aPath addLineToPoint:CGPointMake(rect.size.width-1, rect.size.height-50)];
    [aPath addLineToPoint:CGPointMake(rect.size.width-50, rect.size.height-1)];
    [aPath addLineToPoint:CGPointMake(50, rect.size.height-1)];
    [aPath addLineToPoint:CGPointMake(1, rect.size.height-50)];
    [aPath addLineToPoint:CGPointMake(1, 50)];
        
    
    
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    [aPath stroke];//Draws line 根据坐标点连线
    
    [aPath fill];
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.frame = self.bounds;
    shapelayer.path = aPath.CGPath;
    self.layer.mask = shapelayer;

    
    
}


@end
