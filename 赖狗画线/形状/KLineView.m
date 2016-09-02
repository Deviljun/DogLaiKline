//
//  KLineView.m
//  赖狗画线
//
//  Created by 赖天翔 on 16/8/10.
//  Copyright © 2016年 赖天翔. All rights reserved.
//
#define rectHeight(rect)                        rect.size.height                //总高度
#define rectWidth(rect)                         rect.size.width                 //总宽度
#define margin                                  20                              //间隔
#define XLine(rect)                             (rect.size.width-2*margin)        //x轴的长度
#define YLine(rect)                             (rect.size.height-2*margin)        //y轴的长度











#import "KLineView.h"

@implementation KLineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self createXAxisRect:rect];
    [self createYAxisRect:rect];
    [self createXYLabel:rect];
    [self drawLine:rect];
}




#pragma mark -私有方法
/**
 *  创建x轴
 *
 *  @param rect 尺寸
 */
-(void)createXAxisRect:(CGRect)rect{
    [[UIColor whiteColor] set];//设置线条颜色
    UIBezierPath * xPath = [UIBezierPath bezierPath];
    xPath.lineCapStyle = kCGLineCapRound; //线条拐角
    xPath.lineJoinStyle = kCGLineCapRound; //终点处理
    xPath.lineWidth = 2.0;
    [xPath moveToPoint:CGPointMake(margin, rectHeight(rect)-margin)];
    [xPath addLineToPoint:CGPointMake(rectWidth(rect)-margin, rectHeight(rect)-margin)];
    [xPath stroke];
    
  //  [self createXAxisLabel:rect];
    
    
}
/**
 *  创建y轴
 *
 *  @param rect 尺寸
 */
-(void)createYAxisRect:(CGRect)rect{
    [[UIColor whiteColor] set];//设置线条颜色
    UIBezierPath * yPath = [UIBezierPath bezierPath];
    yPath.lineCapStyle = kCGLineCapRound; //线条拐角
    yPath.lineJoinStyle = kCGLineCapRound; //终点处理
    yPath.lineWidth = 2.0;
    [yPath moveToPoint:CGPointMake(margin, rectHeight(rect)-margin)];
    [yPath addLineToPoint:CGPointMake(margin, margin)];
    [yPath stroke];
   // [self createYAxisLabel:rect];
    
}

/**
 *  创建x轴单位
 */
-(void)createXAxisLabel:(CGRect)rect{
    
    NSArray * xArray = @[@"7.1",@"7.2",@"7.3",@"7.4",@"7.5",@"7.6",@"7.7"];
    CGFloat count = xArray.count;
    //刻度长度为总线长除以数组的数量
   
    CGFloat averageWidth = XLine(rect)/count;
     for (int i=0; i<xArray.count; i++)
    {
        NSString * xString = xArray[i];
        UILabel * xlabel = [[UILabel alloc]init];
        xlabel.text = xString;
        xlabel.textColor = [UIColor whiteColor];
        xlabel.textAlignment = NSTextAlignmentCenter;
        
        xlabel.frame = CGRectMake(i*averageWidth+margin+margin/2, rectHeight(rect)-margin, averageWidth, margin);
        
        //刻度线
            [[UIColor whiteColor] set];//设置线条颜色
            UIBezierPath * xPath = [UIBezierPath bezierPath];
            xPath.lineCapStyle = kCGLineCapRound; //线条拐角
            xPath.lineJoinStyle = kCGLineCapRound; //终点处理
            xPath.lineWidth = 1.0;
            [xPath moveToPoint:CGPointMake(xlabel.center.x,xlabel.frame.origin.y)];
            [xPath addLineToPoint:CGPointMake(xlabel.center.x, xlabel.frame.origin.y-4)];
            [xPath stroke];
        
        
        [self addSubview:xlabel];
        
        
    }
}


-(void)createYAxisLabel:(CGRect)rect{
    
    NSArray * yArray = @[@"0",@"1",@"2",@"3",@"4",@"5"];
    CGFloat count = yArray.count;
    
    CGFloat averageHeight = YLine(rect)/count;
    for (int i=0; i<yArray.count; i++)
    {
        NSString * yString = yArray[i];
        UILabel * label = [[UILabel alloc]init];
        label.textColor = [UIColor whiteColor];
        label.text = yString;
        label.frame = CGRectMake(0, YLine(rect)-averageHeight-i*averageHeight, margin, averageHeight);
        
        
       //刻度线
            [[UIColor whiteColor] set];//设置线条颜色
            UIBezierPath * xPath = [UIBezierPath bezierPath];
            xPath.lineCapStyle = kCGLineCapRound; //线条拐角
            xPath.lineJoinStyle = kCGLineCapRound; //终点处理
            xPath.lineWidth = 1.0;
            [xPath moveToPoint:CGPointMake(label.frame.origin.x+label.frame.size.width,label.center.y)];
            [xPath addLineToPoint:CGPointMake(label.frame.origin.x+label.frame.size.width+4,label.center.y)];
            [xPath stroke];
         [self addSubview:label];
    }
}

-(void)drawLine:(CGRect)rect{
    NSArray * array = @[@"3",@"4",@"3",@"1",@"2",@"5",@"1"];
    
    [[UIColor whiteColor] set];//设置线条颜色
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    path.lineWidth = 2.0;
    NSInteger F = [array[0] integerValue];
    [path moveToPoint:CGPointMake(2*margin+margin/2, YLine(rect)/6*F)];
    
    
    
    for (int i=1; i<array.count; i++)
    {
        NSInteger Y = [array[i] integerValue];
        
        [path addLineToPoint:CGPointMake((2*margin+margin/2)+XLine(rect)/7*i, YLine(rect)/6*Y)];
        
    }
    
    
    [path stroke];
    
    
    
    
    
    
    
}

-(void)createXYLabel:(CGRect)rect{
    NSArray * xArray = @[@"7.1",@"7.2",@"7.3",@"7.4",@"7.5",@"7.6",@"7.7"];
    CGFloat count = xArray.count;
    //刻度长度为总线长除以数组的数量
    
    CGFloat averageWidth = XLine(rect)/count;
    for (int i=0; i<xArray.count; i++)
    {
        NSString * xString = xArray[i];
        UILabel * xlabel = [[UILabel alloc]init];
        xlabel.text = xString;
        xlabel.textColor = [UIColor whiteColor];
        xlabel.textAlignment = NSTextAlignmentCenter;
        
        xlabel.frame = CGRectMake(i*averageWidth+margin+margin/2, rectHeight(rect)-margin, averageWidth, margin);
        
        //刻度线
        [[UIColor whiteColor] set];//设置线条颜色
        UIBezierPath * xPath = [UIBezierPath bezierPath];
        xPath.lineCapStyle = kCGLineCapRound; //线条拐角
        xPath.lineJoinStyle = kCGLineCapRound; //终点处理
        xPath.lineWidth = 1.0;
        [xPath moveToPoint:CGPointMake(xlabel.center.x,xlabel.frame.origin.y)];
        [xPath addLineToPoint:CGPointMake(xlabel.center.x, xlabel.frame.origin.y-300)];
        [xPath stroke];
        
        
        [self addSubview:xlabel];
        
        
    }
    
    
    NSArray * yArray = @[@"0",@"1",@"2",@"3",@"4",@"5"];
    CGFloat cou = yArray.count;
    
    CGFloat averageHeight = YLine(rect)/cou;
    for (int i=0; i<yArray.count; i++)
    {
        NSString * yString = yArray[i];
        UILabel * label = [[UILabel alloc]init];
        label.textColor = [UIColor whiteColor];
        label.text = yString;
        label.frame = CGRectMake(0, YLine(rect)-averageHeight-i*averageHeight, margin, averageHeight);
        
        
        //刻度线
        [[UIColor whiteColor] set];//设置线条颜色
        UIBezierPath * yPath = [UIBezierPath bezierPath];
        yPath.lineCapStyle = kCGLineCapRound; //线条拐角
        yPath.lineJoinStyle = kCGLineCapRound; //终点处理
        yPath.lineWidth = 1.0;
        [yPath moveToPoint:CGPointMake(label.frame.origin.x+label.frame.size.width,label.center.y)];
        [yPath addLineToPoint:CGPointMake(label.frame.origin.x+label.frame.size.width+4000,label.center.y)];
        [yPath stroke];
        [self addSubview:label];
    }


    
}


@end
