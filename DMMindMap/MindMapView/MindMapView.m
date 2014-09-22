//
//  MindMapView.m
//  DMMindMap
//
//  Created by Master on 2014/09/21.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "MindMapView.h"

@implementation MindMapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.frame = frame;
        self.layer.cornerRadius = 2.0;
        self.backgroundColor = [UIColor redColor];
        self.userInteractionEnabled = YES;
        
        [self setLongPressGesture];
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


- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    
}



- (void)setLongPressGesture
{
    UILongPressGestureRecognizer *longPressGesture =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPressGesture.minimumPressDuration = 1.0;
    longPressGesture.allowableMovement = 10.0;
    [self addGestureRecognizer:longPressGesture];
}







@end
