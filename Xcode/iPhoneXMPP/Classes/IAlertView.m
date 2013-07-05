//
//  IAlertView.m
//  iTest
//
//  Created by Wills on 2011-05-22.
//  Copyright 2011 Finalist. All rights reserved.
//

#import "IAlertView.h"


@interface IAlertView () <UIAlertViewDelegate>

@property (nonatomic, readwrite, retain) NSMutableArray *callbacks;

@end


#pragma mark -

@implementation IAlertView

@synthesize callbacks = _callbacks;


- (id) initWithTitle:(NSString *)title message:(NSString *)message {
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    if (self) {
        NSMutableArray *callbacks = [[NSMutableArray alloc] init];
        self.callbacks = callbacks;
        [callbacks release];
        
        [super setDelegate:self];
    }
    return self;
}

- (void) dealloc {
    self.callbacks = nil;
    [super dealloc];
}


- (NSInteger) addButtonWithTitle:(NSString *)title {
    return [self addButtonWithTitle:title callback:nil];
}

- (NSInteger) addButtonWithTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback {
    if (!title) {
        return - 1;
    }
    
    if (!callback) {
        callback = ^(int index, NSString *title) {
        };
    }
    callback = [callback copy];
    [self.callbacks addObject:callback];
    [callback release];
    
    return [super addButtonWithTitle:title];
}

- (NSInteger) addCancelButtonTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback {
    NSInteger index = [self addButtonWithTitle:title callback:callback];
    if (index >= 0) {
        self.cancelButtonIndex = index;
    }
    return index;
}


#pragma mark -
#pragma mark override super methods

- (id) delegate {
    return nil;
}

- (void) setDelegate:(id)delegate {
}


#pragma mark -
#pragma mark UIAlertViewDelegate

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex >= 0 && buttonIndex < self.callbacks.count) {
        void (^callback)() = [self.callbacks objectAtIndex:buttonIndex];
        if (callback) {
            callback(buttonIndex, [self buttonTitleAtIndex:buttonIndex]);
        }
    }
}

- (void) alertViewCancel:(UIAlertView *)alertView {
    [self alertView:self clickedButtonAtIndex:self.cancelButtonIndex];
}


@end

