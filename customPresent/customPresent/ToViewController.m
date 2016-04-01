//
//  ToViewController.m
//  customPresent
//
//  Created by Robert on 16/4/1.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "ToViewController.h"
#import "PresentAnimation.h"
#import "DismissAnimation.h"

@interface ToViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) PresentAnimation *presentAnimation;
@property (nonatomic, strong) DismissAnimation *dismissAnimation;

@end

@implementation ToViewController

- (instancetype)init {
    if (self = [super init]) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        self.imageView.userInteractionEnabled = YES;
        [self.view addSubview:self.imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
        [self.imageView addGestureRecognizer:tap];
        
        self.presentAnimation = [[PresentAnimation alloc] init];
        self.dismissAnimation = [[DismissAnimation alloc] init];
        
        self.navigationController.delegate = self;
    }
    return self;
}

- (void)tapImage:(UITapGestureRecognizer *)tapGr {
    [self.navigationController popViewControllerAnimated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        return self.presentAnimation;
    }else {
        return self.dismissAnimation;
    }
}

@end
