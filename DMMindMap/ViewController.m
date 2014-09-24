//
//  ViewController.m
//  DMMindMap
//
//  Created by Master on 2014/09/21.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "ViewController.h"
#import "MindMapView.h"
#import "BackgroundScrollView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    BackgroundScrollView *bgScrollView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self makeBgScrollView];
    [self makeMindMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeBgScrollView
{
    bgScrollView = [[BackgroundScrollView alloc] init];
    bgScrollView.frame = self.view.bounds;
    bgScrollView.backgroundImageView.image = [UIImage imageNamed:@"bgImage_cyan.png"];
    [self.view addSubview:bgScrollView];
    
}

- (void)makeMindMap
{
    MindMapView *mindMapView = [[MindMapView alloc] initWithFrame:CGRectMake(bgScrollView.contentSize.width / 2 - 50, bgScrollView.contentSize.height / 2 - 50, 100, 100)];
    mindMapView.backgroundImageView.image = [UIImage imageNamed:@"cloud.png"];
    [bgScrollView addSubview:mindMapView];
    
}








@end
