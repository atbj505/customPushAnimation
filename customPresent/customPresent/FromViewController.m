//
//  FromViewController.m
//  customPresent
//
//  Created by Robert on 16/4/1.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "FromViewController.h"
#import "ToViewController.h"

@interface FromViewController () <UINavigationControllerDelegate>

@end

@implementation FromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.imageView.center = self.view.center;
    self.imageView.image = [UIImage imageNamed:@"03"];
    [self.view addSubview:self.imageView];
    
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    [self.imageView addGestureRecognizer:tap];
}

- (void)tapImage:(UITapGestureRecognizer *)tapGr {
    ToViewController *toVc = [[ToViewController alloc] init];
    toVc.imageView.image = [UIImage imageNamed:@"03"];
    self.navigationController.delegate = toVc;
    [self.navigationController pushViewController:toVc animated:YES];
}

@end
