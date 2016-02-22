//
//  TranslationTabBarViewController.m
//  QHQgewala
//
//  Created by qianhongqiang on 16/2/19.
//  Copyright © 2016年 qianhongqiang. All rights reserved.
//

#import "TranslationTabBarViewController.h"
#import "TranslationDelegate.h"
#import "GewalaTabBar.h"
#import "SuspendViewController.h"
#import <objc/runtime.h>

const char * TranslationTabBarViewControllerDelegateAssociationKey = "TranslationTabBarViewControllerDelegateAssociationKey";

@interface TranslationTabBarViewController ()<GewalaTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation TranslationTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildren];
    
    [self setupTabBar];
}

-(void)setupChildren {
    TranslationDelegate *delegate = [[TranslationDelegate alloc] init];
    self.delegate = delegate;
    objc_setAssociatedObject(self, &TranslationTabBarViewControllerDelegateAssociationKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    SuspendViewController *c1=[[SuspendViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:c1];
    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor brownColor];
    
    UIViewController *c3=[[UIViewController alloc]init];
    c3.view.backgroundColor=[UIColor yellowColor];
    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.view.backgroundColor = [UIColor redColor];
    
    GewalaTabBarItem *item1 = [[GewalaTabBarItem alloc] init];
    item1.title = @"消息";
    item1.normalImage = [UIImage imageNamed:@"star_normal"];
    item1.selectedImage = [UIImage imageNamed:@"star_selected"];
    
    GewalaTabBarItem *item2 = [[GewalaTabBarItem alloc] init];
    item2.title = @"购票";
    item2.normalImage = [UIImage imageNamed:@"film_normal"];
    item2.selectedImage = [UIImage imageNamed:@"film_selected"];
    
    GewalaTabBarItem *item3 = [[GewalaTabBarItem alloc] init];
    item3.title = @"活动";
    item3.normalImage = [UIImage imageNamed:@"gift_normal"];
    item3.selectedImage = [UIImage imageNamed:@"gift_selected"];
    
    GewalaTabBarItem *item4 = [[GewalaTabBarItem alloc] init];
    item4.title = @"购票";
    item4.normalImage = [UIImage imageNamed:@"speech_normal"];
    item4.selectedImage = [UIImage imageNamed:@"speech_selected"];
    
    self.datas = [NSMutableArray arrayWithObjects:item1,item2,item3,item4, nil];
    
    self.viewControllers=@[nav1,c2,c3,c4];
}

-(void)setupTabBar {
    self.tabBar.hidden = YES;
    
    GewalaTabBar *tabbar = [[GewalaTabBar alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 60, [UIScreen mainScreen].bounds.size.width, 60) delegate:self];
    [self.view addSubview:tabbar];
}

#pragma mark -GewalaTabBarDelegate
-(NSUInteger)numberOfTabBarItemInTabBar:(GewalaTabBar *)tabBar {
    return 4;
}

-(GewalaTabBarItem *)tabBar:(GewalaTabBar *)tabBar tabBarItemAtIndex:(NSUInteger)index {
    return self.datas[index];
}

-(void)tabBar:(GewalaTabBar *)tabBar tabBarItemClickedAtIndex:(NSUInteger)index {
    self.selectedIndex = index;
}

@end
