//
//  MindMapView.m
//  DMMindMap
//
//  Created by Master on 2014/09/21.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "MindMapView.h"

@implementation MindMapView
{
    BOOL isFloated;
}


#pragma mark - View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        isFloated = NO;
        
        self.frame = frame;
        self.layer.cornerRadius = 2.0;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        
        [self setLongPressGesture];
        [self setPanGesture];
        [self setPinchGesture];
        [self setBackgroundImageView];
        
        [self addTextField];
    }
    return self;
}



- (void)setBackgroundImageView
{
    _backgroundImageView = [UIImageView new];
    _backgroundImageView.frame        = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.frame.size.width, self.frame.size.height);
    _backgroundImageView.contentMode  = UIViewContentModeScaleAspectFill;
    _backgroundImageView.image        = nil;
    _backgroundImageView.userInteractionEnabled = YES;
    [self addSubview:_backgroundImageView];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImageView.image = backgroundImage;
    [self setNeedsDisplay];
}


- (void)addTextField
{
    UITextField *insideTextField = [UITextField new];
    insideTextField.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, _backgroundImageView.frame.size.width + 20, 30);
    insideTextField.borderStyle = UITextBorderStyleNone;
    insideTextField.delegate = self;
    insideTextField.userInteractionEnabled = YES;
    insideTextField.center = _backgroundImageView.center;
    [_backgroundImageView addSubview:insideTextField];
}

#pragma mark - GestureRecognizer Delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


#pragma mark - Register Gesture

- (void)setLongPressGesture
{
    UILongPressGestureRecognizer *longPressGesture =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPressGesture.delegate             = self;
    longPressGesture.minimumPressDuration = 0.1;
    longPressGesture.allowableMovement    = 10.0;
    [self addGestureRecognizer:longPressGesture];
}

- (void)setPanGesture
{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGesture.delegate = self;
    [self addGestureRecognizer:panGesture];
}

- (void)setPinchGesture
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(hundlePinchGesture:)];
    [self addGestureRecognizer:pinch];
}

#pragma mark - Gesture Method

- (void)longPress:(UILongPressGestureRecognizer *)sender
{
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            [self floatView:sender.view];
            break;
        case UIGestureRecognizerStateChanged:
            [self moveView:sender.view];
            break;
        case UIGestureRecognizerStateEnded:
            [self didFinishMoveView:sender.view];
            break;
            
        default:
            break;
    }
}


- (void)handlePanGesture:(UIPanGestureRecognizer *)sender {
    if (isFloated == YES) {
        CGPoint point = [sender translationInView:self];
        CGPoint movedPoint = CGPointMake(self.center.x + point.x, self.center.y + point.y);
        self.center = movedPoint;
        
        //init stacked Translation value
        [sender setTranslation:CGPointZero inView:self];
    }
}


- (void)hundlePinchGesture:(UIPinchGestureRecognizer *)sender {
     NSLog(@"Pinch");
    if (sender.state == UIGestureRecognizerStateEnded
        || sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"gesture.scale = %f", sender.scale);
        
        CGFloat currentScale = self.frame.size.width / self.bounds.size.width;
        CGFloat newScale = currentScale * sender.scale;
        
        if (newScale < 0.2) {
            newScale = 0.2;
        }
        if (newScale > 2.0) {
            newScale = 2.0;
        }
        
        CGAffineTransform transform = CGAffineTransformMakeScale(newScale, newScale);
        self.transform = transform;
        sender.scale = 1;
    }
}

#pragma mark - View State

- (void)floatView:(UIView *)view
{
    if (isFloated == NO) {
        isFloated = YES;
    }
    view.frame = CGRectMake(view.frame.origin.x - 5, view.frame.origin.y - 5, view.frame.size.width, view.frame.size.height);
    view.layer.shadowOpacity = 0.8;
    view.layer.shadowOffset = CGSizeMake(5, 5);
}

- (void)moveView:(UIView *)view
{
    
}

- (void)didFinishMoveView:(UIView *)view
{
    view.frame = CGRectMake(view.frame.origin.x + 5, view.frame.origin.y + 5, view.frame.size.width, view.frame.size.height);
    view.layer.shadowOpacity = 0.0;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    
    if (isFloated == YES) {
        isFloated = NO;
    }
}


#pragma mark - TextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
