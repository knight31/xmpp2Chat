//
//  MainViewController.m
//  ProductShow
//
//  Created by 高 欣 on 13-4-11.
//  Copyright (c) 2013年 com.ideal. All rights reserved.
//

#import "MainViewController.h"
#import "FilterViewController.h"
#import "SearchViewController.h"
#import "FavoriteViewController.h"
#import "MoreViewController.h"

@interface MainViewController (){
    UITabBarController *_tabBarController;
    UIButton *_maskView;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         

        //self
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"返回";
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(hideMaskView:) name:DFNotificationHideTabBarMaskView object:nil];
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.delegate = self;
    
 
    // Do any additional setup after loading the view from its nib.
    FilterViewController *filterVC=[[FilterViewController alloc] initWithNibNameForUniversal:@"FilterViewController" bundle:nil];
    filterVC.title=@"产品列表";
    SearchViewController *searchVC=[[SearchViewController alloc] initWithNibNameForUniversal:@"SearchViewController" bundle:nil];
    searchVC.title=@"搜索";
    FavoriteViewController *favoriteVC=[[FavoriteViewController alloc] initWithNibName:@"FavoriteViewController" bundle:nil];
    favoriteVC.title=@"我的收藏";
    MoreViewController *moreVC=[[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];
    moreVC.title=@"更多";

     
    
    UINavigationController *filterNav=[[UINavigationController alloc] initWithRootViewController:filterVC];
    [filterNav.navigationBar setBackgroundImage:
     [UIImage imageNamed:DefaultNavigationBackImage] forBarMetrics:UIBarMetricsDefault];
    filterNav.navigationBar.tintColor=DefaultNavigationTintColor;
    filterVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"产品列表" image:[UIImage imageNamed:@"meunItemList"] tag:0];
    UINavigationController *searchNav=[[UINavigationController alloc] initWithRootViewController:searchVC];
    [searchNav.navigationBar setBackgroundImage:
     [UIImage imageNamed:DefaultNavigationBackImage] forBarMetrics:UIBarMetricsDefault];
    searchNav.navigationBar.tintColor=DefaultNavigationTintColor;
    searchVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"搜索" image:[UIImage imageNamed:@"meunItemSearch"] tag:1];
    UINavigationController *favoriteNav=[[UINavigationController alloc] initWithRootViewController:favoriteVC];
    [favoriteNav.navigationBar setBackgroundImage:
     [UIImage imageNamed:DefaultNavigationBackImage] forBarMetrics:UIBarMetricsDefault];
    favoriteNav.navigationBar.tintColor=DefaultNavigationTintColor;
    favoriteVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"我的收藏" image:[UIImage imageNamed:@"meunItemFavorate"] tag:2];
    UINavigationController *moreNav=[[UINavigationController alloc] initWithRootViewController:moreVC];
    [moreNav.navigationBar setBackgroundImage:
     [UIImage imageNamed:DefaultNavigationBackImage] forBarMetrics:UIBarMetricsDefault];
    moreNav.navigationBar.tintColor=DefaultNavigationTintColor;
    moreVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"更多" image:[UIImage imageNamed:@"meunItemMore"] tag:3];
    NSArray *viewControllerArray = @[filterNav,searchNav,favoriteNav,moreNav];
    //NSArray *viewControllerArray = @[filterVC,searchVC,favoriteVC];

    _tabBarController.viewControllers=viewControllerArray;
    _tabBarController.selectedIndex = 0;
    
    //self.view = _tabBarController.view;
    [_tabBarController.view setFrame:self.view.frame];
    [self.view addSubview:_tabBarController.view];
    
 
}

-(void) viewWillAppear:(BOOL)animated
{
    [[AppController sharedInstance].navigationController setNavigationBarHidden:YES animated:YES];
    //[AppController sharedInstance].navigationController.navigationBarHidden=YES;
}

-(void) viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DFNotificationHideTabBarMaskView object:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) hideMaskView:(NSNotification *)note 
{
    BOOL hide=[[[note userInfo] objectForKey:@"Value"] boolValue];
    
    if(hide){
        [_maskView removeFromSuperview];
    }else{
        if(!_maskView){
            //_maskView=[[UIView alloc] initWithFrame:_tableView.frame];
            _maskView=[UIButton buttonWithType:UIButtonTypeCustom];
            _maskView.frame=_tabBarController.tabBar.bounds;
            _maskView.backgroundColor=[UIColor blackColor];
            _maskView.alpha=0.2;
            [_maskView addTarget:self action:@selector(closeAllFilter) forControlEvents:UIControlEventTouchUpInside];
        }
        [_tabBarController.tabBar addSubview:_maskView];
        
    }
}

-(void)closeAllFilter
{
    [[NSNotificationCenter defaultCenter] postNotificationName:DFNotificationCloseAllFilter object:self];
}
 
@end
