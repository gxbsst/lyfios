#import "SearchNavigationController.h"
#import "SearchViewController.h"
#import "AppDelegate.h"

@implementation SearchNavigationController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tabBarItem.title = @"搜索";
        self.tabBarItem.image = [UIImage imageNamed:@"search"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	if (searchViewController_)
        return;
    
    searchViewController_ = [[SearchViewController alloc] init];
    // 设置导航根视图
    [self pushViewController:searchViewController_ animated:NO];
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
//    [searchViewController_ release];
//    [super dealloc];
//}

@end
