//
//  BezierAdvanceViewController.m
//  赖狗画线
//
//  Created by 赖天翔 on 16/8/10.
//  Copyright © 2016年 赖天翔. All rights reserved.
//
#define ScreenRect              [UIScreen mainScreen].bounds
#define ScreenRectWidth         [UIScreen mainScreen].bounds.size.width
#define ScreenRectHeight        [UIScreen mainScreen].bounds.size.height



#import "BezierAdvanceViewController.h"
#import "KLineView.h"
#import "KLinePlusView.h"
@interface BezierAdvanceViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation BezierAdvanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(1000, 300);
    
    
    
    
//    KLineView * klineView= [[KLineView alloc]initWithFrame:CGRectMake(0, 0, 1000,300)];
//    klineView.backgroundColor = [UIColor orangeColor];
//    [self.scrollView addSubview:klineView];
    
    
    KLinePlusView * kpv = [[KLinePlusView alloc]initWithFrame:CGRectMake(0, 0, 1000, 300)];
    kpv.backgroundColor =[UIColor blackColor];
    kpv.xArray = @[@"7月1日",@"7月2日",@"7月3日",@"7月4日",@"7月5日",@"7月6日",@"7月7日",@"7月8日",@"7月9日",@"7月10日"];
    kpv.yArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    kpv.dataArray = @[@"3.3",@"4.4",@"10",@"7",@"1.4",@"4.6",@"5.5",@"1.2",@"1",@"4"];
    
    [self.scrollView addSubview:kpv];
    
    
    
       // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

@end
