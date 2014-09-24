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
        self.minimumZoomScale = 0.2f;
        self.maximumZoomScale = 1.0f;
        self.contentOffset = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, [[UIScreen mainScreen] bounds].size.height / 2);
        
        [self makeBufferView];
    }
    return self;
}

- (void)makeBufferView
{
    _bufferView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentSize.width, self.contentSize.height)];
    [self addSubview:_bufferView];
}


#pragma mark - Touch Event Override

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.dragging) {
        [self.nextResponder touchesBegan:touches withEvent:event];
    }
    [super touchesBegan:touches withEvent:event];
}

@end
