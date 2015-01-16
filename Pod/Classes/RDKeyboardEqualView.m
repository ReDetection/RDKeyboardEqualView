//
//  RDKeyboardEqualView.m
//  RDKeyboardEqualView
//
//  Created by ReDetection on 16/01/15.
//  Copyright (c) 2015 redetection. All rights reserved.
//

#import "RDKeyboardEqualView.h"

@implementation RDKeyboardEqualView

- (void)dealloc {
    self.followsKeyboardHeight = NO;
}

- (void)setFollowsKeyboardHeight:(BOOL)followsKeyboardHeight {
    if (!_followsKeyboardHeight && followsKeyboardHeight) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
    } else if (_followsKeyboardHeight) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    _followsKeyboardHeight = followsKeyboardHeight;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification  {
    NSValue *frameValue = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    NSNumber *duration = notification.userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curveValue = notification.userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve curve = (UIViewAnimationCurve)curveValue.integerValue;
    UIViewAnimationOptions curveOptions = [self animationOptionsWithCurve:curve];
    
    CGRect windowFrame = [frameValue CGRectValue];
    CGRect localFrame = [self.superview convertRect:windowFrame fromView:nil];
    CGFloat height = self.superview.frame.size.height - localFrame.origin.y;
    height = MAX(height, 0.f);
    self.heightConstraint.constant = height;
    [self setNeedsUpdateConstraints];
    [UIView animateWithDuration:duration.floatValue delay:0.f options:UIViewAnimationOptionBeginFromCurrentState | curveOptions animations:^{
        [self.superview layoutIfNeeded];
    } completion:nil];
}

- (UIViewAnimationOptions)animationOptionsWithCurve:(UIViewAnimationCurve)curve {
    switch (curve) {
        case UIViewAnimationCurveEaseIn:
            return UIViewAnimationOptionCurveEaseIn;
        case UIViewAnimationCurveEaseOut:
            return UIViewAnimationOptionCurveEaseOut;
        case UIViewAnimationCurveLinear:
            return UIViewAnimationOptionCurveLinear;
        case UIViewAnimationCurveEaseInOut:
        default:
            return UIViewAnimationOptionCurveEaseInOut;
    }
}

@end
