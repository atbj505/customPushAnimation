//
//  PresentAnimation.m
//  testWebView
//
//  Created by Robert on 16/1/30.
//  Copyright © 2016年 NationSky. All rights reserved.
//

#import "PresentAnimation.h"
#import <UIKit/UIKit.h>
#import "FromViewController.h"
#import "ToViewController.h"

@interface PresentAnimation ()

@end

@implementation PresentAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    ToViewController *toVC = (ToViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    FromViewController *fromVC = (FromViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *tempView = [fromVC.imageView snapshotViewAfterScreenUpdates:NO];
    
    tempView.frame = [fromVC.imageView convertRect:fromVC.imageView.bounds toView: containerView];
    
    fromVC.imageView.hidden = YES;
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    
    toVC.view.frame = [[UIScreen mainScreen] bounds];
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        tempView.frame = [toVC.imageView convertRect:toVC.imageView.bounds toView:containerView];
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toVC.imageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
}

@end
