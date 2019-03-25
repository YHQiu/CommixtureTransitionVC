//
//  CTWebViewController.m
//  CommixtureTransitionVC_Example
//
//  Created by 万顺叫车2018 on 2019/3/25.
//  Copyright © 2019 QiuHongyu. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "CTWebViewController.h"

@interface CTWebViewController ()

@end

@implementation CTWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://blog.csdn.net/bsn1928/article/details/88790997"]]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
