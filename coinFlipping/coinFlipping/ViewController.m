//
//  ViewController.m
//  coinFlipping
//
//  Created by NowOrNever on 07/05/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "ViewController.h"
#import "DLFilpView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    DLFilpView *flipView = [[DLFilpView alloc]initWithFirstImageName:@"front" secondImageName:@"tail" timeInterval:0.6 andDirection:DLFlipDirectionX];

    [self.view addSubview:flipView];
    flipView.bounds = CGRectMake(0, 0, 200, 200);
    flipView.center = self.view.center;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
