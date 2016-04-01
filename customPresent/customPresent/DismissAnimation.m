//
//  DismissAnimation.m
//  testWebView
//
//  Created by Robert on 16/2/1.
//  Copyright © 2016年 NationSky. All rights reserved.
//

#import "DismissAnimation.h"
#import <UIKit/UIKit.h>
#import "FromViewController.h"
#import "ToViewController.h"

@implementation DismissAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    ToViewController *fromVC = (ToViewController *)[transitionContext     viewControllerForKey:UITransitionContextFromViewControllerKey];
    FromViewController *toVC = (FromViewController *)[transitionContext     viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIView *tempView = containerView.subviews.lastObject;
    
    toVC.imageView.hidden = YES;
    fromVC.imageView.hidden = YES;
    tempView.hidden = NO;
    
    [containerView insertSubview:toVC.view atIndex:0];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        tempView.frame = [toVC.imageView convertRect:toVC.imageView.bounds toView:containerView];
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        toVC.imageView.hidden = NO;
        [tempView removeFromSuperview];
    }];
}

@end
