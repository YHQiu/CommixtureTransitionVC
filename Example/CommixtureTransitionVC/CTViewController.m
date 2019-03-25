//
//  CTViewController.m
//  CommixtureTransitionVC
//
//  Created by QiuHongyu on 03/25/2019.
//  Copyright (c) 2019 QiuHongyu. All rights reserved.
//

#import "CTViewController.h"
#import "CTWebViewController.h"

@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)next:(id)sender {
    CTWebViewController *next = [CTWebViewController new];
    self.navigationController.delegate = next;
    [self.navigationController pushViewController:next animated:YES];
}

@end
