//
//  ViewController.m
//  UITableView-省市
//
//  Created by 张坤 on 15/12/24.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "ViewController.h"
#import "kProvinceViewController.h"
#import "kNamesViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContentView];
}
- (void)setContentView{
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    CGPoint point = self.view.center;
    point.x -= 80;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 100, 30)];
    leftButton.center = point;
    [leftButton setBackgroundColor:[UIColor whiteColor]];
    [leftButton setTitle:@"中国省市" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton.layer setCornerRadius:5.0];
    [leftButton.layer setMasksToBounds:YES];
    [leftButton addTarget:self action:@selector(leftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
    point.x += 160;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 100, 30)];
    rightButton.center = point;
    [rightButton setBackgroundColor:[UIColor whiteColor]];
    [rightButton setTitle:@"英文名字" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton.layer setCornerRadius:5.0];
    [rightButton.layer setMasksToBounds:YES];
    [rightButton addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
    
}
- (void)leftButtonClicked{
    kProvinceViewController *kProviceVC = [[kProvinceViewController alloc]init];
    [self.navigationController pushViewController:kProviceVC animated:YES];
}
- (void)rightButtonClicked{
    kNamesViewController *kNameVC = [[kNamesViewController alloc]init];
    [self.navigationController pushViewController:kNameVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
