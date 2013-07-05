//
//  MoreViewController.m
//  ProductShow
//
//  Created by 高 欣 on 13-4-15.
//  Copyright (c) 2013年 com.ideal. All rights reserved.
//

#import "MoreViewController.h"
#import "FeedbackViewController.h"
#import "AboutViewController.h"
#import "IAlertView.h"
@interface MoreViewController (){
    IBOutlet UITableView *_tableView;
}
@property (copy,nonatomic) NSArray *arrayMore;
@end

@implementation MoreViewController

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
    // Do any additional setup after loading the view from its nib.
    NSArray *arrayMoreSection0=@[@{@"image":@"settings_feedback_icon",@"title":@"意见反馈"},
                                 @{@"image":@"settings_about_icon",@"title":@"关于"},
                     ];
    NSArray *arrayMoreSection1=@[@{@"image":@"settings_signout_icon",@"title":@"注销"}];
    self.arrayMore=@[arrayMoreSection0,arrayMoreSection1];
    
    _tableView.backgroundColor=RGBColor(0xf4, 0xf4, 0xf4);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayMore.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	//获取分组
    NSArray *_arrayMoreSection=_arrayMore[section];
    return _arrayMoreSection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	//建立可重用单元标识
	static NSString *customCell = @"Cell";
	UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:customCell];
    if (cell == nil) {
        //如果没有可重用的单元，我们就从nib里面加载一个，
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customCell];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
	}
    NSArray *_arrayMoreSection=_arrayMore[indexPath.section];
	NSDictionary* dicCell=[_arrayMoreSection objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:dicCell[@"image"]];
    cell.textLabel.text=dicCell[@"title"];
	return cell;
}


 
- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath
{
    return 44;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc;
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                    vc=[[FeedbackViewController alloc] initWithNibNameForUniversal:@"FeedbackViewController" bundle:nil];
                    
                    break;
                case 1:
                    vc=[[AboutViewController alloc] initWithNibNameForUniversal:@"AboutViewController" bundle:nil];
                    break;
                    
                default:
                    break;
            }
            vc.navigationItem.title=_arrayMore[0][indexPath.row][@"title"];
            break;  
        }
        case 1:
        {
            IAlertView *alertView=[[IAlertView alloc] initWithTitle:@"温馨提示" message:@"是否要注销！"];
            [alertView addButtonWithTitle:@"确定" callback:^(int index, NSString *title) {
                [AppController sharedInstance].userInfo=nil;
                [[AFProductShowClient sharedClient] setDefaultHeader:@"Access-Token" value:@""];
                [[AppController sharedInstance].navigationController popToRootViewControllerAnimated:YES];
            }];
            [alertView addButtonWithTitle:@"取消" callback:nil];
            [alertView show];
            break;
        }
            
        default:
            break;
    }
    if(vc){
        [[AppController sharedInstance].navigationController pushViewController:vc animated:YES];
    }
}


@end
