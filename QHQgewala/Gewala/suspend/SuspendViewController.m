//
//  SuspendViewController.m
//  QHQgewala
//
//  Created by qianhongqiang on 16/2/19.
//  Copyright © 2016年 qianhongqiang. All rights reserved.
//

#import "SuspendViewController.h"
#import "SuspendTableViewCell.h"
#import "SuspendDetailViewController.h"
#import "SuspendAnimator.h"

@interface SuspendViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>

@end

@implementation SuspendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    self.navigationController.delegate = self;
}

-(void)setupUI {
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [SuspendTableViewCell cellWithTableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SuspendDetailViewController *detailVC = [[SuspendDetailViewController alloc] init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [SuspendAnimator new];
}
@end
