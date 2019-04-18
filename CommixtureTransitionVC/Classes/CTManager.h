//
//  CTManager.h
//  CommixtureTransitionVC_Example
//
//  Created by 万顺叫车2018 on 2019/4/18.
//  Copyright © 2019 QiuHongyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTNavigationAnimator.h"

#define CTCommixtureTransitionRegesterVC(__vcname__) \
@interface __vcname__(CTCommixtureTransitionExtension)<UINavigationControllerDelegate> \
@end \
@implementation __vcname__(CTCommixtureTransitionExtension) \
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{\
if (operation == UINavigationControllerOperationPush) {\
return [CTNavigationAnimator pushAnimator];\
}\
else{\
return nil;\
}\
}\
@end

