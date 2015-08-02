//
//  KPDetailClassifyViewController.m
//  KaoPu
//
//  Created by laichunhui on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPDetailClassifyViewController.h"
#import "AFNetworking.h"
#import "KPMenu.h"
#import "MJRefresh.h"
#import "KPDetailClassifyCell.h"
#import "MJExtension.h"

@interface KPDetailClassifyViewController ()

/** menus */
@property (strong, nonatomic) NSMutableArray *menus;

@end

@implementation KPDetailClassifyViewController

- (NSMutableArray *)menus {
    if (_menus == nil) {
        _menus = [NSMutableArray array];
    }
    return _menus;
}

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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = NO;
    
    self.tableView.rowHeight = 116;
}

#pragma mark - 设置刷新控件
- (void)setUpRefresh {
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMenu)];
}

#pragma mark - 加载网络数据 
- (void)loadClassifyData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"menu"] = self.classify;
    params[@"key"] = @"fb26de051cf1b25a7f0e2b3e9d542ff8";
    
    [[AFHTTPSessionManager manager] GET:@"http://apis.juhe.cn/cook/query.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //字典 - 模型
        self.menus = [KPMenu objectArrayWithKeyValuesArray:responseObject[@"result"][@"data"]];
        
        NSLog(@"%@", self.menus);
        
        [self.tableView reloadData];
        
      
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)loadMoreMenu {
    
}

#pragma mark - Table view data source

static NSString * const reuseIdentifier = @"detail_cell";

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KPDetailClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    KPMenu *menu = self.menus[indexPath.row];
    
    cell.menu = menu;
    
    return cell;
}


@end
