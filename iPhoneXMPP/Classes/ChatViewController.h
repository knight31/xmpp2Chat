//
//  ChatViewController.h
//  iPhoneXMPP
//
//  Created by 高 欣 on 13-5-27.
//
//

#import <UIKit/UIKit.h>
#import "JSMessagesViewController.h"
#import "XMPPFramework.h"
@interface ChatViewController : JSMessagesViewController <JSMessagesViewDelegate, JSMessagesViewDataSource>
@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) NSMutableArray *timestamps;


@property (strong, nonatomic) XMPPJID *chatUserJid;
@end
