//
//  RDKeyboardEqualView.h
//  RDKeyboardEqualView
//
//  Created by ReDetection on 16/01/15.
//  Copyright (c) 2015 redetection. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDKeyboardEqualView : UIView

@property (nonatomic, assign) BOOL followsKeyboardHeight;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *heightConstraint;

@end
