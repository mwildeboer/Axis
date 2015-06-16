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
@property (nonatomic, strong) UIView *fourthView;
@property (nonatomic, strong) UIView *fifthView;

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
    
    self.fourthView = [[UIView alloc] initWithFrame:CGRectZero];
    self.fourthView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.fourthView];
    
    self.fifthView = [[UIView alloc] initWithFrame:CGRectZero];
    self.fifthView.backgroundColor = [UIColor orangeColor];
    [self.fourthView addSubview:self.fifthView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self viewDidLayoutSubviews];
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
    
    [self.fourthView layout:^(AXLayoutMaker *make) {
        [make.top equalTo:self.thirdView.bottom withOffset:20];
        [make.height equalTo:@200];
        [make.width equalTo:self.view.width withOffset:-40];
        [make.centerX equalTo:self.view.centerX withOffset:0];
    }];
        
    [self.fifthView layout:^(AXLayoutMaker *make) {
        [make.centerX equalTo:self.fourthView.centerX];
        [make.centerY equalTo:self.fourthView.centerY];
        [make.height equalTo:@100];
        [make.width equalTo:@100];
    }];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
