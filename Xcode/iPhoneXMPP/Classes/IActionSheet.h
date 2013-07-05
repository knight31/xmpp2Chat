//
//  IActionSheet.h
//  iTest
//
//  Created by Wills on 2011-05-21.
//  Copyright 2011 Finalist. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IActionSheet : UIActionSheet


// The only initialize method!!
- (id) initWithTitle:(NSString *)title;

- (NSInteger) addButtonWithTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback;
- (NSInteger) addCancelButtonTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback;
- (NSInteger) addDestructiveButtonTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback;

- (void) show;


@end

