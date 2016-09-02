//
//  MainViewController.m
//  赖狗画线
//
//  Created by 赖天翔 on 16/8/10.
//  Copyright © 2016年 赖天翔. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    switch (indexPath.row)
    {
        case 0:
        {
            cell.textLabel.text = @"贝塞尔曲线基础";
        }
            break;
        case 1:
        {
             cell.textLabel.text = @"贝塞尔曲线进阶";
        }
            break;
        
            
        default:
            break;
    }
    
    

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row)
    {
        case 0:
        {
            BezierBaseViewController * bvc = [[BezierBaseViewController alloc]initWithNibName:@"BezierBaseViewController" bundle:nil];
            [self.navigationController pushViewController:bvc animated:true];
        }
            break;
        case 1:
        {
            BezierAdvanceViewController * avc = [[BezierAdvanceViewController alloc]initWithNibName:@"BezierAdvanceViewController" bundle:nil];
            [self.navigationController pushViewController:avc animated:true];
        }
            break;

            
        default:
            break;
    }
    
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
