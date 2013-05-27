//
//  ChatViewController.m
//  iPhoneXMPP
//
//  Created by 高 欣 on 13-5-27.
//
//

#import "ChatViewController.h"
#import "DDXML.h"
#import "iPhoneXMPPAppDelegate.h"

#define kDidReceiveChat @"didReceiveChat"
@interface ChatViewController (){
    iPhoneXMPPAppDelegate *_appDelegate;
}

@property (strong,nonatomic) NSMutableArray *arrayChats;
@property (strong,nonatomic) NSMutableDictionary *dicAccessoryView;
@end

@implementation ChatViewController
#pragma mark - Initialization
- (UIButton *)sendButton
{
    // Override to use a custom send button
    // The button's frame is set automatically for you
    return [UIButton defaultSendButton];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _appDelegate=(iPhoneXMPPAppDelegate*)[UIApplication sharedApplication].delegate;
    //self.arrayChats=_appDelegate.arrayChats;
    self.delegate = self;
    self.dataSource = self;
    
//    [self addObserver:self forKeyPath:@"arrayChats" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//    [_appDelegate.arrayChats addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew context:NULL];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveChat) name:kDidReceiveChat object:nil];
    
    
}

-(void) receiveChat
{
    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_appDelegate.arrayChats.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom  animated:NO];
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
       [self.tableView reloadData];
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_appDelegate.arrayChats.count-1 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom  animated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _appDelegate.arrayChats.count;
}

#pragma mark - Messages view delegate
- (void)sendPressed:(UIButton *)sender withText:(NSString *)text
{
    NSString *messageStr = text;
    
    if([messageStr length] > 0)
    {
        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
        [body setStringValue:messageStr];
        
        NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
        [message addAttributeWithName:@"type" stringValue:@"chat"];
        [message addAttributeWithName:@"to" stringValue:[self.chatUserJid full]];
        [message addChild:body];
        [_appDelegate.arrayChats addObject:message];
        [_appDelegate.xmppStream sendElement:message];
        self.inputView.textView.text=@"";
        
        [self.tableView reloadData];
        
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_appDelegate.arrayChats.count-1 inSection:0];
//        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom  animated:NO];
    }
}


- (JSBubbleMessageStyle)messageStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSXMLElement *message=[_appDelegate.arrayChats objectAtIndex:indexPath.row];
    if([[message attributeStringValueForName:@"to"] isEqualToString:[self.chatUserJid full]]){
        return JSBubbleMessageStyleOutgoingDefault;
    }else{
        return JSBubbleMessageStyleIncomingDefault;
    }
    //return (indexPath.row % 2) ? JSBubbleMessageStyleIncomingDefault : JSBubbleMessageStyleOutgoingDefault;
    //return JSBubbleMessageStyleIncomingDefault;
}

- (JSMessagesViewTimestampPolicy)timestampPolicyForMessagesView
{
    return JSMessagesViewTimestampPolicyAll;
}

- (BOOL)hasTimestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // custom implementation here, if using `JSMessagesViewTimestampPolicyCustom`
    return [self shouldHaveTimestampForRowAtIndexPath:indexPath];
}

#pragma mark - Messages view data source
- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSXMLElement *message=[_appDelegate.arrayChats objectAtIndex:indexPath.row];
    NSString *body = [[message elementForName:@"body"] stringValue];
    return body;
    //return [self.messages objectAtIndex:indexPath.row];
}
- (NSString *)photoForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *photoUrl;
    NSXMLElement *message=[_appDelegate.arrayChats objectAtIndex:indexPath.row];
    if([[message attributeStringValueForName:@"to"] isEqualToString:[self.chatUserJid full]]){
        photoUrl=@"photo0";
    }else{
        photoUrl=@"photo1";
    }
    return photoUrl;
    //    NSString *photoUrl=[NSString stringWithFormat:@"photo%d",indexPath.row%2];
    //    MDChat *chat=self.arrayChats[indexPath.row];
    //    if([chat.user.username isEqualToString:[[MDUserManager sharedInstance] getUserSession].username]){
    //        photoUrl=@"photo0";
    //    }else{
    //        photoUrl=@"photo1";
    //    }
//    MDChat *chat=self.arrayChats[indexPath.row];
//    NSString *photoUrl=chat.user.avatar?chat.user.avatar:@"";
//    return photoUrl;
    //return nil;
}

-(UIView*) accessoryViewForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *key=[NSString stringWithFormat:@"%d",indexPath.row];
//    UIView *accessoryView=[self.dicAccessoryView objectForKey:key];
//    return accessoryView;
    return nil;
}

- (NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MDChat *chat=self.arrayChats[indexPath.row];
//    return chat.createAt;
    return nil;
}
@end
