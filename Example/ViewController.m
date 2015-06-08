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
        [make.centerX equalTo:self.view.centerX];
        [make.top equalTo:@20];
        [make.width equalTo:@20];
        [make.bottom equalTo:@20];
    }];

    [self.secondView layout:^(AXLayoutMaker *make) {
        [make.left equalTo:@20];
        [make.top equalTo:self.firstView.top];
        [make.right equalTo:self.firstView.left withOffset:20];
        [make.height equalTo:self.view.height withOffset:20 andMultiplier:0.5];
    }];
    
    [self.thirdView layout:^(AXLayoutMaker *make) {
        [make.right equalTo:@20];
        [make.top equalTo:self.firstView.top];
        [make.left equalTo:self.firstView.right withOffset:20];
        [make.height equalTo:self.view.height withOffset:20 andMultiplier:0.5];
    }];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
