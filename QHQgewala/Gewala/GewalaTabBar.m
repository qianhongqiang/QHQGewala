//
//  GewalaTabBar.m
//  QHQgewala
//
//  Created by qianhongqiang on 16/2/19.
//  Copyright © 2016年 qianhongqiang. All rights reserved.
//

#import "GewalaTabBar.h"

static CGFloat kStandardButtonWidth = 60;
static CGFloat kStandardButtonHeight = 60;

@interface GewalaTabBar ()

@property (nonatomic, strong) NSMutableArray *innerButtonsArray;

@end

@implementation GewalaTabBar

-(instancetype)initWithFrame:(CGRect)frame delegate:(id<GewalaTabBarDelegate>)delegate{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = delegate;
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    self.backgroundColor = [UIColor colorWithRed:222.0f/255.0f green:222.0f/255.0f blue:222.0f/255.0f alpha:0.85f];
    
    NSUInteger count;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfTabBarItemInTabBar:)]) {
        count = [self.delegate numberOfTabBarItemInTabBar:self];
    }
    
    if (count == 0) {return;}
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:tabBarItemAtIndex:)]) {
        NSMutableArray *items = [NSMutableArray arrayWithCapacity:count];
        for (int index = 0; index < count; index ++) {
            GewalaTabBarItem *item = [self.delegate tabBar:self tabBarItemAtIndex:index];
            [items addObject:item];
        }
        _tabBarItems = items;
    }
    
    self.innerButtonsArray = [NSMutableArray array];
    [_tabBarItems enumerateObjectsUsingBlock:^(GewalaTabBarItem  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GewalaTabBarButton *btn = [[GewalaTabBarButton alloc] init];
        btn.item = obj;
        btn.frame = CGRectMake(idx * kStandardButtonWidth, 0, kStandardButtonWidth, 60);
        btn.tag = idx;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.innerButtonsArray addObject:btn];
    }];
    
    [self click:self.innerButtonsArray[0]];
}

-(void)click:(UIButton *)btn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar: tabBarItemClickedAtIndex:)]) {
        [self.delegate tabBar:self tabBarItemClickedAtIndex:btn.tag];
    }
    
    [self.innerButtonsArray enumerateObjectsUsingBlock:^(GewalaTabBarButton <GewalaTabBarDelegate>*_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj tabBar:nil tabBarItemClickedAtIndex:btn.tag];
    }];
}

@end

@implementation GewalaTabBarItem

@end

@interface GewalaTabBarButton ()<GewalaTabBarDelegate>

@property (nonatomic ,strong) UIImageView *tabbarButtonImageView;

@property (nonatomic, strong) UILabel *tabBarButtonTitleView;
@end

@implementation GewalaTabBarButton

-(instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kStandardButtonWidth, kStandardButtonHeight);
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    [self addSubview:self.tabBarButtonTitleView];
    [self addSubview:self.tabbarButtonImageView];
}

-(void)setItem:(GewalaTabBarItem *)item {
    _item = item;
    
    self.tabbarButtonImageView.image = item.normalImage;
    self.tabBarButtonTitleView.text = item.title;
}

-(UIImageView *)tabbarButtonImageView {
    if (nil == _tabbarButtonImageView) {
        _tabbarButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 44, 44)];
    }
    return _tabbarButtonImageView;
}

-(UILabel *)tabBarButtonTitleView {
    if (nil == _tabBarButtonTitleView) {
        _tabBarButtonTitleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kStandardButtonWidth, kStandardButtonHeight)];
        _tabBarButtonTitleView.textAlignment = NSTextAlignmentLeft;
        _tabBarButtonTitleView.font = [UIFont systemFontOfSize:15];
    }
    return _tabBarButtonTitleView;
}

#pragma mark - GewalaTabBarDelegate
-(void)tabBar:(GewalaTabBar *)tabBar tabBarItemClickedAtIndex:(NSUInteger)index {
    CGRect toRect;
    if (index > self.tag) {
        toRect = CGRectMake(self.tag * kStandardButtonWidth, 0, kStandardButtonWidth, kStandardButtonHeight);
    }else if(index < self.tag) {
        toRect = CGRectMake((self.tag + 1) * kStandardButtonWidth, 0, kStandardButtonWidth, kStandardButtonHeight);
    }else {
        toRect = CGRectMake(self.tag* kStandardButtonWidth, 0, kStandardButtonWidth * 2, kStandardButtonHeight);
    }
    
    [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.6 options:0 animations:^{
        self.frame = toRect;
        if (index > self.tag) {
            self.tabBarButtonTitleView.alpha = 0;
            self.tabBarButtonTitleView.frame = CGRectMake(0, 0, kStandardButtonWidth, kStandardButtonHeight);
            self.tabbarButtonImageView.image = self.item.normalImage;
        }else if(index < self.tag) {
            self.tabBarButtonTitleView.alpha = 0;
            self.tabBarButtonTitleView.frame = CGRectMake(0, 0, kStandardButtonWidth, kStandardButtonHeight);
            self.tabbarButtonImageView.image = self.item.normalImage;
        }else {
            self.tabBarButtonTitleView.alpha = 1;
            self.tabBarButtonTitleView.frame = CGRectMake(kStandardButtonWidth, 0, kStandardButtonWidth, kStandardButtonHeight);
            self.tabbarButtonImageView.image = self.item.selectedImage;
        }
        
    } completion:nil];
}

@end
