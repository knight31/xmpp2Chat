//
//  UIView+NibLoading.h
//  UniStory
//
//  Created by 高 欣 on 12-4-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NibLoading)
+ (UIView*) loadInstanceFromNib;
+ (UIView*) loadInstanceFromNibForIpad;
+ (UIView*) loadInstanceFromNibWithNibName:(NSString*) nibName;
@end
