//
//  UIView+NibLoading.m
//  UniStory
//
//  Created by 高 欣 on 12-4-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIView+NibLoading.h"
@implementation UIView(NibLoading)

+ (UIView*) loadInstanceFromNib { 
    UIView* result = nil;
    
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed: 
                         NSStringFromClass([self class]) owner: nil options: nil]; 
    for (id anObject in elements) { 
        if ([anObject isKindOfClass:[self class]]) { 
            result = anObject; break; 
        } 
    } 
    return result; 
}
+ (UIView*) loadInstanceFromNibForIpad {
    UIView* result = nil;
    
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:
                        [NSString stringWithFormat:@"%@_ipad",NSStringFromClass([self class])]  owner: nil options: nil];
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            result = anObject; break;
        }
    }
    return result;
}
+ (UIView*) loadInstanceFromNibWithNibName:(NSString*) nibName {
    UIView* result = nil;
    
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:
                        nibName owner: nil options: nil];
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            result = anObject; break;
        }
    }
    return result;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
