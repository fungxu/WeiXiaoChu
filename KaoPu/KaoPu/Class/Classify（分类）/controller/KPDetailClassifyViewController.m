//
//  KPDetailClassifyViewController.m
//  KaoPu
//
//  Created by laichunhui on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPDetailClassifyViewController.h"
#import "AFNetworking.h"

@interface KPDetailClassifyViewController ()

@end

@implementation KPDetailClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tableView
    [self setUpTableView];
    
    //设置刷新控件
    [self setUpRefresh];
    
    //加载网络数据
    [self loadClassifyData];
    
}
#pragma mark - 设置tableView
- (void)setUpTableView {
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"KPDetailClassifyCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}

#pragma mark - 设置刷新控件
- (void)setUpRefresh {
    
}

#pragma mark - 加载网络数据 
- (void)loadClassifyData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = @"fb26de051cf1b25a7f0e2b3e9d542ff8";
    
    [[AFHTTPSessionManager manager] GET:@"http://apis.juhe.cn/cook/category" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [responseObject writeToFile:@"/Users/laichunhui/Desktop/plist调试/65.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

#pragma mark - Table view data source

static NSString * const reuseIdentifier = @"detail_cell";

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    // Configure the cell...
    
    return cell;
}


@end
