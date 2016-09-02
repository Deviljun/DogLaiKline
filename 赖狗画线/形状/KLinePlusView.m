//
//  KLinePlusView.m
//  赖狗画线
//
//  Created by 赖天翔 on 16/8/11.
//  Copyright © 2016年 赖天翔. All rights reserved.
//
#define MarginToLeft     50             //线距离左边的距离
#define MarginToBottom   30             //线距离下边的距离
#define MarginToTop      30
#define rectHeight(rect)                        rect.size.height                //总高度
#define rectWidth(rect)                         rect.size.width                 //总宽度

#import "KLinePlusView.h"

@implementation KLinePlusView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawXLine:rect];
    [self drawYLine:rect];
    [self createXLabel:rect];
    [self createYLabel:rect];
    [self drawLine:rect];
}
/**
 *  画X轴
 *
 *  @param rect <#rect description#>
 */
-(void)drawXLine:(CGRect)rect{
    
    [[UIColor whiteColor]set];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    path.lineWidth = 2.0;
    
    [path moveToPoint:CGPointMake(MarginToLeft, rectHeight(rect)-MarginToBottom)];
    [path addLineToPoint:CGPointMake(rectWidth(rect)-30, rectHeight(rect)-MarginToBottom)];//美观，给线条多出20的距离
    [path stroke];
    
}

/**
 *  //画Y轴
 *
 *  @param rect <#rect description#>
 */
-(void)drawYLine:(CGRect)rect{
    [[UIColor whiteColor]set];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    path.lineWidth = 2.0;
    
    [path moveToPoint:CGPointMake(MarginToLeft, rectHeight(rect)-MarginToBottom)];
    [path addLineToPoint:CGPointMake(MarginToLeft, MarginToTop-20)];//美观，给线条多出20的距离
    [path stroke];

}

-(void)createXLabel:(CGRect)rect{
  
    CGFloat xWidth = rectWidth(rect)-2*MarginToLeft;//20的长度是预留的，所以，总长度还是总宽减去距2边距离;
    CGFloat xAverage = xWidth/self.xArray.count;//刻度宽
    for (int i=0; i<self.xArray.count; i++)
    {
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(MarginToLeft+xAverage*i+xAverage/2, rectHeight(rect)-MarginToBottom, xAverage, 30)];
        label.text = self.xArray[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        //刻度线 把线条画粗还可以做成柱状图，简直棒棒
        [[UIColor whiteColor]set];
        UIBezierPath * path = [UIBezierPath bezierPath];
        path.lineWidth = 1;
        [path moveToPoint:CGPointMake(label.center.x, rectHeight(rect)-MarginToBottom)];
        [path addLineToPoint:CGPointMake(label.center.x, MarginToTop)];
        [path stroke];
        [self addSubview:label];
        
    }

}

-(void)createYLabel:(CGRect)rect{
   
    CGFloat  yHeight = rectHeight(rect)-MarginToBottom-MarginToTop;
    CGFloat yAverage = yHeight/self.yArray.count;
    for (int i =0; i<self.yArray.count; i++)
    {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, rectHeight(rect)-MarginToBottom-yAverage*i-yAverage*1.5, MarginToLeft, yAverage)];
        label.text = self.yArray[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        
        //刻度线 把线条画粗还可以做成柱状图，简直棒棒
        [[UIColor whiteColor]set];
        UIBezierPath * path = [UIBezierPath bezierPath];
        path.lineWidth = 1;
        [path moveToPoint:CGPointMake(MarginToLeft, label.center.y)];
        [path addLineToPoint:CGPointMake(rectWidth(rect)-MarginToLeft, label.center.y)];
        [path stroke];
        [self addSubview:label];

    }
}


-(void)drawLine:(CGRect)rect{
    [[UIColor whiteColor]set];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 4;
    CGFloat first = [self.dataArray[0] floatValue];
    
    CGFloat xWidth = rectWidth(rect)-2*MarginToLeft;//20的长度是预留的，所以，总长度还是总宽减去距2边距离;
    CGFloat xAverage = xWidth/self.dataArray.count;//刻度宽
    
  
    CGFloat  yHeight = rectHeight(rect)-MarginToBottom-MarginToTop;
    CGFloat yAverage = yHeight/self.yArray.count;
    
    
    
    [path moveToPoint:CGPointMake(MarginToLeft+xAverage, rectHeight(rect)-MarginToBottom-first*yAverage)];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextFillRect(context, CGRectMake(MarginToLeft+xAverage-5,rectHeight(rect)-MarginToBottom-first*yAverage-5,10,10));
    
    
    
    for (int i=1; i<self.dataArray.count; i++)
    {
        CGFloat s = [self.dataArray[i] floatValue];
        [path addLineToPoint:CGPointMake(MarginToLeft+i*xAverage+xAverage, rectHeight(rect)-MarginToBottom-s*yAverage)];
         CGContextFillRect(context, CGRectMake(MarginToLeft+i*xAverage+xAverage-5,rectHeight(rect)-MarginToBottom-s*yAverage-5,10,10));
    }
    
    [path stroke];
    
}















@end
