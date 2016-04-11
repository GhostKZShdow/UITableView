//
//  kNamesViewController.m
//  UITableView-省市
//
//  Created by 张坤 on 15/12/25.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "kNamesViewController.h"

@interface kNamesViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSDictionary *_nameDic;
    NSArray *_nameArr;
}
@end

@implementation kNamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContentView];
}
- (void)setContentView{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sortednames" ofType:@"plist"];
    _nameDic = [NSDictionary dictionaryWithContentsOfFile:path];
    _nameArr = [_nameDic allKeys];
    _nameArr = [_nameArr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",_nameArr);
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _nameArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *firWord = _nameArr[section];
    NSArray *firWordArr = _nameDic[firWord];
    return firWordArr.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _nameArr[section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *nameIdentifier = @"nameIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nameIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nameIdentifier];
    }
    [cell.textLabel setText:_nameDic[_nameArr[indexPath.section]][indexPath.row] ];
    return cell;
}
//添加索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _nameArr;
}
@end
