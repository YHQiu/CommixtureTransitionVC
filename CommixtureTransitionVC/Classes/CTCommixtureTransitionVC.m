//
//  CommixtureTransitionVC.m
//  CommixtureTransitionVC_Example
//
//  Created by 万顺叫车2018 on 2019/3/25.
//  Copyright © 2019 QiuHongyu. All rights reserved.
//
#import "CTNavigationAnimator.h"
#import "CTCommixtureTransitionVC.h"

@interface CTCommixtureTransitionVC ()<UINavigationControllerDelegate>

@end

@implementation CTCommixtureTransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        return [CTNavigationAnimator pushAnimator];
    }
    else{
        return nil;
    }
    
}


@end
