//
//  GewalaTabBar.h
//  QHQgewala
//
//  Created by qianhongqiang on 16/2/19.
//  Copyright © 2016年 qianhongqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TranslationTabBarViewController.h"
@protocol GewalaTabBarDelegate;
@class GewalaTabBarItem;

@interface GewalaTabBar : UIView

@property (nonatomic, strong, readonly) NSArray *tabBarItems;

@property (nonatomic, assign) id <GewalaTabBarDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame delegate:(id<GewalaTabBarDelegate>)delegate;

@end

@protocol GewalaTabBarDelegate <NSObject>

@required
-(void)tabBar:(GewalaTabBar *)tabBar tabBarItemClickedAtIndex:(NSUInteger)index;

@optional
-(NSUInteger)numberOfTabBarItemInTabBar:(GewalaTabBar *)tabBar;

-(GewalaTabBarItem *)tabBar:(GewalaTabBar *)tabBar tabBarItemAtIndex:(NSUInteger)index;

@end

@interface GewalaTabBarItem : NSObject;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;

@end

@interface GewalaTabBarButton : UIButton;

@property (nonatomic, strong) GewalaTabBarItem *item;

@end
