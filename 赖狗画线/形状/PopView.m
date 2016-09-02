//
//  PopView.m
//  赖狗画线
//
//  Created by 赖天翔 on 16/8/30.
//  Copyright © 2016年 赖天翔. All rights reserved.
//

#import "PopView.h"

@implementation PopView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self popView:rect];
}

-(void)popView:(CGRect)rect{
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = rect;
    shapeLayer.path = self.path.CGPath;
    self.layer.mask = shapeLayer;
   
}
-(UIBezierPath*)path{
    if (!self.path)
    {
        CGFloat arrowWidth = 70;
        
        CGMutablePathRef path = CGPathCreateMutable();
        
        CGRect rectangle = CGRectInset(CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetWidth(self.bounds)), 10,10);
        
        CGPoint p[3] = {
            {CGRectGetMidX(self.bounds)-arrowWidth/3, CGRectGetWidth(self.bounds)-16},
            {CGRectGetMidX(self.bounds)+arrowWidth/3, CGRectGetWidth(self.bounds)-16},
            {CGRectGetMidX(self.bounds), CGRectGetHeight(self.bounds)-4}
        };
        
        CGPathAddRoundedRect(path, NULL, rectangle, 10, 10);
        CGPathAddLines(path, NULL, p, 3);
        
        CGPathCloseSubpath(path);
        
        self.path = [UIBezierPath bezierPathWithCGPath:path];
        
        CGPathRelease(path);
        

    }
    return self.path;
}
@end
