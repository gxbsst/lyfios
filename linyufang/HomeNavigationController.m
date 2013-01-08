#import "HomeNavigationController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"

@implementation HomeNavigationController

- (id)init
{
    self = [super init];
    if (self)
    {
        // 设置tabbar未选中图片
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = [UIImage imageNamed:@"recomment"];
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (homeViewController_)
        return;
	
    homeViewController_ = [[HomeViewController alloc] init];
    // 设置导航根视图
    [self pushViewController:homeViewController_ animated:NO];
}

- (void) viewWillAppear:(BOOL)animated
{
    // 设置导航栏背景颜色
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgCartNavi"] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgCartNavi"]];
    }
}

//- (void) dealloc
//{
//    [homeViewController_ release];
//    [super dealloc];
//}


@end
