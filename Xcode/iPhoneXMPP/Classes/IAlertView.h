//
//  IAlertView.h
//  iTest
//
//  Created by Wills on 2011-05-22.
//  Copyright 2011 Finalist. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IAlertView : UIAlertView


// The only initialize method!!
- (id) initWithTitle:(NSString *)title message:(NSString *)message;

- (NSInteger) addButtonWithTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback;
- (NSInteger) addCancelButtonTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback;


@end

