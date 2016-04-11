//
//  kProvinceViewController.m
//  UITableView-省市
//
//  Created by 张坤 on 15/12/24.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "kProvinceViewController.h"
#import "kCityViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface kProvinceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_allCityArr;
}
@end

@implementation kProvinceViewController

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [super viewDidLoad];
    [self setContentView];
}
- (void)setContentView{
    self.title = @"省";
    NSString *path = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
    _allCityArr = [NSArray arrayWithContentsOfFile:path];
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
    return _allCityArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.textLabel setText:_allCityArr[indexPath.row][@"State"]];
    return cell;
}

#pragma mark-UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    kCityViewController *kCityVC = [[kCityViewController alloc]init];
    kCityVC.cityArray = _allCityArr[indexPath.row][@"Cities"];
    [self.navigationController pushViewController:kCityVC animated:YES];
}
@end
