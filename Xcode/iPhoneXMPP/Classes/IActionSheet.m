//
//  IActionSheet.m
//  iTest
//
//  Created by Wills on 2011-05-21.
//  Copyright 2011 Finalist. All rights reserved.
//

#import "IActionSheet.h"


@interface IActionSheet () <UIActionSheetDelegate>

@property (nonatomic, readwrite, retain) NSMutableArray *callbacks;

@end


#pragma mark -

@implementation IActionSheet

@synthesize callbacks = _callbacks;


- (id) initWithTitle:(NSString *)title {
    self = [super initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    if (self) {
        NSMutableArray *callbacks = [[NSMutableArray alloc] init];
        self.callbacks = callbacks;
        //[callbacks release];
        
        [super setDelegate:self];
    }
    return self;
}

//- (void) dealloc {
//    self.callbacks = nil;
//    [super dealloc];
//}


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
    //[callback release];
    
    return [super addButtonWithTitle:title];
}

- (NSInteger) addCancelButtonTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback {
    NSInteger index = [self addButtonWithTitle:title callback:callback];
    if (index >= 0) {
        self.cancelButtonIndex = index;
    }
    return index;
}

- (NSInteger) addDestructiveButtonTitle:(NSString *)title callback:(void (^)(int index, NSString *title))callback {
    NSInteger index = [self addButtonWithTitle:title callback:callback];
    if (index >= 0) {
        self.destructiveButtonIndex = index;
    }
    return index;
}

- (void) show {
    [self showInView:[UIApplication sharedApplication].keyWindow];
}


#pragma mark -
#pragma mark override super methods

- (id<UIActionSheetDelegate>) delegate {
    return nil;
}

- (void) setDelegate:(id<UIActionSheetDelegate>)delegate {
}


#pragma mark -
#pragma mark UIActionSheetDelegate

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex >= 0 && buttonIndex < self.callbacks.count) {
        void (^callback)(int index, NSString *title) = [self.callbacks objectAtIndex:buttonIndex];
        if (callback) {
            callback(buttonIndex, [self buttonTitleAtIndex:buttonIndex]);
        }
    }
}

- (void) actionSheetCancel:(UIActionSheet *)actionSheet {
    [self actionSheet:self clickedButtonAtIndex:self.cancelButtonIndex];
}


@end

