//
//  RJSBDNavigationAnimator.m
//  RJSCore
//
//  Created by 邱弘宇 on 2018/1/11.
//  Copyright © 2018年 develop@iFilmo.com. All rights reserved.
//

#import "CTNavigationAnimator.h"

#define fromViewOffsetSX 120.f
#define fromViewOffsetSY 0.f

#define kSpringWithDamping 0.9f //弹簧震动幅度
#define kInitialSpringVelocity 0.f //弹簧

@interface CTNavigationAnimator()

@property (nonatomic, assign) int type;

@end

@implementation CTNavigationAnimator

+ (instancetype)pushAnimator{
    CTNavigationAnimator *this = [CTNavigationAnimator new];
    this.type = 0;
    this.transitionDuration = 0.7f;
    return this;
}

+ (instancetype)popAnimator{
    CTNavigationAnimator *this = [CTNavigationAnimator new];
    this.type = 1;
    this.transitionDuration = 0.6f;
    return this;
}

- (void)animateTransitionEvent {
    if (self.type == 0) {
        [self pushAnimator];
    }
    else{
        [self popAnimator];
    }
}

- (void)pushAnimator{
    
    UIView *fromView = self.fromViewController.view;
    UIView *toView = self.toViewController.view;
    UIImageView *fromImgView = [[UIImageView alloc]initWithImage:[self generateImageWithView:[UIApplication sharedApplication].keyWindow scale:[self scale] size:[UIApplication sharedApplication].keyWindow.bounds.size]];
    
    CGRect fromImageViewFrame = CGRectMake(0, 0, fromImgView.frame.size.width, fromImgView.frame.size.height);
    CGRect toViewFrame = CGRectMake(0, 0, toView.frame.size.width, toView.frame.size.height);
    fromImgView.frame = fromImageViewFrame;
    
    self.containerView.backgroundColor = [UIColor whiteColor];
    [self.containerView addSubview:fromImgView];
    [self.containerView addSubview:toView];
    
    CGAffineTransform fromTransform = CGAffineTransformMakeScale(0.8, 0.9);
    fromTransform = CGAffineTransformTranslate(fromTransform, fromViewOffsetSX, fromViewOffsetSY);
    
    CGRect fromeViewInitFrame = fromImageViewFrame;
    fromImageViewFrame.origin.x -= fromViewOffsetSX;
    
    CGRect toViewInitFrame = toViewFrame;
    toViewInitFrame.origin.x += toViewInitFrame.size.width;
    toView.frame = toViewInitFrame;
    
    [UIView animateWithDuration:self.transitionDuration-0.2
                          delay:0.2
         usingSpringWithDamping:kSpringWithDamping initialSpringVelocity:kInitialSpringVelocity options:0 animations:^{
             
             fromImgView.frame = fromImageViewFrame;
             toView.frame = toViewFrame;
             
         } completion:^(BOOL finished) {
             
             [fromImgView removeFromSuperview];
             [self.containerView addSubview:fromView];
             [self completeTransition];
             
         }];
    
}

- (void)popAnimator{
    UIView *fromView = self.fromViewController.view;
    UIView *toView = self.toViewController.view;
    UIImageView *fromImgView = [[UIImageView alloc]initWithImage:[self generateImageWithView:[UIApplication sharedApplication].keyWindow scale:[self scale] size:[UIApplication sharedApplication].keyWindow.bounds.size]];
    UIImageView *toImgView = [[UIImageView alloc]initWithImage:[self generateImageWithView:toView scale:[self scale] size:toView.bounds.size]];
    CGRect fromImageViewFrame = CGRectMake(0, 0, fromImgView.frame.size.width, fromImgView.frame.size.height);
    CGRect toImageViewFrame = CGRectMake(0, 0, toImgView.frame.size.width, toImgView.frame.size.height);
    fromImgView.frame = fromImageViewFrame;
    toImgView.frame = toImageViewFrame;
    self.containerView.backgroundColor = [UIColor blackColor];
    [self.containerView addSubview:toImgView];
    [self.containerView addSubview:fromImgView];
    
    CGAffineTransform fromTransform = CGAffineTransformMakeScale(0.8, 0.9);
    fromTransform = CGAffineTransformTranslate(fromTransform, fromViewOffsetSX, fromViewOffsetSY);
    
    CGRect toViewInitFrame = toImageViewFrame;
    toViewInitFrame.origin.x += toViewInitFrame.size.width;
    toImgView.frame = toViewInitFrame;
    
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.0f
         usingSpringWithDamping:kSpringWithDamping initialSpringVelocity:kInitialSpringVelocity options:0 animations:^{
             
             toImgView.layer.affineTransform = fromTransform;
             fromImgView.frame = toImageViewFrame;
             
         } completion:^(BOOL finished) {
             [fromImgView removeFromSuperview];
             [toImgView removeFromSuperview];
             [self.containerView addSubview:toView];
             [self completeTransition];
         }];
    
}

- (UIImage *)generateImageWithView:(UIView *)view scale:(CGFloat)scale size:(CGSize)size{
    
    UIImage *image = nil;
    
    @autoreleasepool{
        // 获取当前的context
        UIGraphicsBeginImageContextWithOptions(size, view.opaque, scale);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // 在context中绘制图像
        [view.layer renderInContext:context];
        
        // 绘制image
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        // 使当前的context出堆栈
        UIGraphicsEndImageContext();
    }
    
    return image;
    
}

- (CGFloat)scale{
    return [UIScreen mainScreen].scale;
}

@end
