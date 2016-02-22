//
//  TranslationDelegate.m
//  QHQgewala
//
//  Created by qianhongqiang on 16/2/19.
//  Copyright © 2016年 qianhongqiang. All rights reserved.
//

#import "TranslationDelegate.h"
#import "TranslationAnimator.h"

@implementation TranslationDelegate

-(id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[TranslationAnimator alloc] init];
}

@end
