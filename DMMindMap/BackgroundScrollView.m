//
//  BackgroundScrollView.m
//  DMMindMap
//
//  Created by Master on 2014/09/25.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "BackgroundScrollView.h"

@implementation BackgroundScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 2, [[UIScreen mainScreen] bounds].size.height * 2)];
        _backgroundImageView.image = nil;
        [self addSubview:_backgroundImageView];
        
        
        self.bounces = NO;
        self.contentSize = _backgroundImageView.bounds.size;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.scrollsToTop = YES;
        self.contentOffset = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, [[UIScreen mainScreen] bounds].size.height / 2);
        NSLog(@"self.contentOffset = %@", NSStringFromCGPoint(self.contentOffset));
        NSLog(@"init ScrollView");
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
