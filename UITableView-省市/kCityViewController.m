//
//  kCityViewController.m
//  UITableView-省市
//
//  Created by 张坤 on 15/12/24.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "kCityViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
@interface kCityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation kCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContentView];
}
- (void)setContentView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cityArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cityIdentifier = @"cityIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cityIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cityIdentifier];
    }
    [cell.textLabel setText:_cityArray[indexPath.row][@"city"]];
    return cell;
}
@end
