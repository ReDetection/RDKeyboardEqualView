//
//  RDViewController.m
//  RDKeyboardEqualView
//
//  Created by redetection on 01/16/2015.
//  Copyright (c) 2014 redetection. All rights reserved.
//

#import "RDViewController.h"

@interface RDViewController () <UITextFieldDelegate>

@end

@implementation RDViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:NO];
    return NO;
}

@end
