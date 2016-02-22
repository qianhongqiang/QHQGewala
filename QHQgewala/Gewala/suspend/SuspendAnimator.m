//
//  SuspendAnimator.m
//  QHQgewala
//
//  Created by qianhongqiang on 16/2/19.
//  Copyright © 2016年 qianhongqiang. All rights reserved.
//

#import "SuspendAnimator.h"
#import "SuspendDetailViewController.h"
#import "SuspendViewController.h"

@implementation SuspendAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 3.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    
    UIView *fromView;
    UIView *toView;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    BOOL isPush = ([toViewController.navigationController.viewControllers indexOfObject:toViewController] > [fromViewController.navigationController.viewControllers indexOfObject:fromViewController]);
    if (!isPush) {return;}
    
    SuspendViewController *transFromView = (SuspendViewController *)fromViewController;
    SuspendDetailViewController *transToView = (SuspendDetailViewController *)toViewController;
    
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame = [transitionContext finalFrameForViewController:toViewController];

    [containerView addSubview:toView];
    
    UIImage *fromViewSnapshot;
    __block UIImage *toViewSnapshot;
    
}


@end
