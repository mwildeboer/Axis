//
//  ViewController.m
//  Axis
//
//  Created by Menno Wildeboer on 19/05/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import "Axis.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIView *thirdView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.firstView = [[UIView alloc] initWithFrame:CGRectZero];
    self.firstView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.firstView];
    
    self.secondView = [[UIView alloc] initWithFrame:CGRectZero];
    self.secondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.secondView];
    
    self.thirdView = [[UIView alloc] initWithFrame:CGRectZero];
    self.thirdView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.thirdView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.firstView layout:^(AXLayoutMaker *make) {
        [make.left equalTo:@20];
        [make.top equalTo:@20];
        [make.width equalTo:@100];
        [make.height equalTo:@100];
    }];

    [self.secondView layout:^(AXLayoutMaker *make) {
        [make.left equalTo:self.firstView.right withOffset:10];
        [make.top equalTo:self.firstView.top];
        [make.width equalTo:self.firstView.width];
        [make.height equalTo:self.firstView.height];
    }];
    
    [self.thirdView layout:^(AXLayoutMaker *make) {
        [make.top equalTo:self.firstView.bottom withOffset:10];
        [make.left equalTo:self.firstView.left];
        [make.right equalTo:self.secondView.right];
        [make.height equalTo:@100];
    }];
    
    NSLog(@"firstView frame %@", NSStringFromCGRect(self.firstView.frame));
    NSLog(@"secondView frame %@", NSStringFromCGRect(self.secondView.frame));
    NSLog(@"thirdView frame %@", NSStringFromCGRect(self.thirdView.frame));
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
