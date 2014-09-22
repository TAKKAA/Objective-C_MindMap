//
//  ViewController.m
//  DMMindMap
//
//  Created by Master on 2014/09/21.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "ViewController.h"
#import "MindMapView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self makeMindMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeMindMap
{
    MindMapView *mindMapView = [[MindMapView alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100)];
    
    [self.view addSubview:mindMapView];
    
}

- (void)longPress:(UILongPressGestureRecognizer *)sender
{
    
}






@end
