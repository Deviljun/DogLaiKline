//
//  BezierBaseViewController.m
//  赖狗画线
//
//  Created by 赖天翔 on 16/8/10.
//  Copyright © 2016年 赖天翔. All rights reserved.
//

#import "BezierBaseViewController.h"

@interface BezierBaseViewController ()

@end

@implementation BezierBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawView * dv = [[DrawView alloc]initWithFrame:CGRectMake(20, 100, 200, 200)];
    dv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:dv];
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

@end
