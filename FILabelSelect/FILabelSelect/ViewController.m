//
//  ViewController.m
//  FILabelSelect
//
//  Created by flagadmin on 2019/11/5.
//  Copyright © 2019 flagadmin. All rights reserved.
//
#import "FILabelSelectView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FILabelSelectView *headerView = [[FILabelSelectView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 40)];
    headerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:headerView];
}


@end
