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
    NSMutableArray *mapArray;
    BackgroundScrollView *bgScrollView;
    IBOutlet UIButton *addButton;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (!mapArray) {
        mapArray = [NSMutableArray new];
    }
    
    [self makeBgScrollView];
    [self makeMindMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Make View

- (void)makeBgScrollView
{
    bgScrollView = [[BackgroundScrollView alloc] init];
    bgScrollView.frame = self.view.bounds;
    bgScrollView.backgroundImageView.image = [UIImage imageNamed:@"bgImage_cyan.png"];
    bgScrollView.delegate = self;
    [self.view addSubview:bgScrollView];
    
    [self checkAddButtonHierarchy];
}


- (void)makeMindMap
{
    MindMapView *mindMapView = [[MindMapView alloc] initWithFrame:CGRectMake(bgScrollView.contentSize.width / 2 - 50, bgScrollView.contentSize.height / 2 - 50, 100, 100)];
    mindMapView.backgroundImageView.image = [UIImage imageNamed:@"cloud.png"];
    mindMapView.tag = 1;
    mapArray[0] = mindMapView;
    [bgScrollView.bufferView addSubview:mindMapView];
}

- (void)checkAddButtonHierarchy
{
    [self.view bringSubviewToFront:addButton];
}

#pragma mark - Private Method

- (IBAction)addMaps
{
    MindMapView *mindMapView = [[MindMapView alloc] initWithFrame:CGRectMake(bgScrollView.contentSize.width / 2 - 50, bgScrollView.contentSize.height / 2 - 50, 100, 100)];
    mindMapView.backgroundImageView.image = [UIImage imageNamed:@"cloud.png"];
    mindMapView.tag = mapArray.count + 1;
    mapArray[mapArray.count] = mindMapView;
    [bgScrollView.bufferView addSubview:mindMapView];
    
    [self checkAddButtonHierarchy];
}


#pragma mark - ScrollView Delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return bgScrollView.bufferView;
}





@end
