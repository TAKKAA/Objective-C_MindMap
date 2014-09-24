//
//  MindMapView.h
//  DMMindMap
//
//  Created by Master on 2014/09/21.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MindMapView : UIView
<UIGestureRecognizerDelegate, UITextFieldDelegate>



- (void)setBackgroundImage:(UIImage *)backgroundImage;


@property(nonatomic) UIImageView *backgroundImageView;

@end
