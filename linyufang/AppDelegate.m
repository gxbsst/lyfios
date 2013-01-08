#import "AppDelegate.h"
#import "Ivan_UITabBar.h"
#import "HomeController.h"
#import "CategoryController.h"
#import "CollectionController.h"
#import "SearchController.h"
#import "SpaceController.h"
#import "LoginController.h"

@implementation AppDelegate
@synthesize mainViewController = mainViewController_;
@synthesize mainWindow = mainWindow_;

+(AppDelegate *) shareApplication
{
    return (AppDelegate *) [UIApplication sharedApplication];
}

- (void) presentModalViewController:(UIViewController *) modalViewController
{
    [self presentMoalViewController:modalViewController animated:YES singly:YES];
}

-(void) presentMoalViewController:(UIViewController *)modalViewController animated:(BOOL)animated
{
    [self presentMoalViewController:modalViewController animated:YES singly:YES];
}

- (void) _presentModalViewControllerWithInfo:(NSDictionary *) info
{
    UIViewController *modalViewController = [info objectForKey:@"modalViewController"];
    BOOL animated = [[info objectForKey:@"animated"] boolValue];
    
    [self presentMoalViewController:modalViewController animated:animated singly:YES];
}

-(void) presentMoalViewController:(UIViewController *)modalViewController animated:(BOOL)animated singly:(BOOL)singly
{
   	if (singly && self.modalViewController) {
		[self dismissModalViewControllerAnimated:animated];
		if (animated) {
			NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:modalViewController, @"modalViewController", [NSNumber numberWithBool:animated], @"animated", nil];
			[self performSelector:@selector(_presentModalViewControllerWithInfo:) withObject:info afterDelay:0.5];
			return;
		}
	}
    
//	[mainViewController_ presentModalViewController:modalViewController animated:animated];
    [mainViewController_ presentViewController:modalViewController animated:YES completion:NULL];
}

// 取消模态窗口显示
- (void)dismissModalViewControllerAnimated:(BOOL) animated
{
    [mainViewController_ dismissViewControllerAnimated:animated completion:NULL];
}

// 获取模态窗口
- (UIViewController *) modalViewController
{
//    return mainViewController_.modalViewController;
    return mainViewController_.presentedViewController;

}

#pragma mark - 操作Tabbar
// 获取TabbarController指针
-(Ivan_UITabBar *) tabBarController
{
    if ([mainViewController_ isKindOfClass:([Ivan_UITabBar class])]) {
        return (Ivan_UITabBar *) mainViewController_;
    } else {
        return nil;
    }
}

// 隐藏Tabbar
- (void) hiddenTabBar:(BOOL)hidden
{
    Ivan_UITabBar *tabBar = [self tabBarController];
    
    if (nil != tabBar) {
        [tabBar hiddenTabBar:hidden];
    }
}


// 收到登录成功的通知，在发送登录请求的时候，可以在SHHLoginView中添加一个等待视图。
// 这里只是一个简单的demo，点击登录直接发送登录成功通知。
- (void) loginSuccessful:(NSNotification *)notification
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.6f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    UIViewAnimationTransition transition;
    transition = UIViewAnimationTransitionCurlUp;
    
    [UIView setAnimationTransition:transition forView:[[LoginController defaultController].loginViewController view].superview cache:YES];
    
    [[[LoginController defaultController].loginViewController view] removeFromSuperview];
    // 增加Tabbar,如果不需要登录界面，把下面这条代码放到didFinishLaunchingWithOptions中
    [mainWindow_ addSubview:mainViewController_.view];
    [UIView commitAnimations];
}

#pragma mark - 应用程序委托
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 增加消息通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginSuccessful:)
                                                 name:@"LoginSuccessful"
                                               object:nil];
    
    // 显示主界面
    mainWindow_ = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 底部Tabar
    Ivan_UITabBar *tabBarController = [[Ivan_UITabBar alloc] initWithNibName:nil bundle:nil];
    tabBarController.delegate = self;
    
    // 设置Tabar选中的效果图片
    NSMutableDictionary *selectImageDict = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    NSString *path = [NSString stringWithFormat:@"recomment_h"];
    NSString *key = [NSString stringWithFormat:@"0"];
    [selectImageDict setObject:path forKey:key];
    NSString *path1 = [NSString stringWithFormat:@"partition_h"];
    NSString *key1 = [NSString stringWithFormat:@"1"];
    [selectImageDict setObject:path1 forKey:key1];
    NSString *path2 = [NSString stringWithFormat:@"space_h"];
    NSString *key2 = [NSString stringWithFormat:@"2"];
    [selectImageDict setObject:path2 forKey:key2];
    NSString *path3 = [NSString stringWithFormat:@"collect_h"];
    NSString *key3 = [NSString stringWithFormat:@"3"];
    [selectImageDict setObject:path3 forKey:key3];
    NSString *path4 = [NSString stringWithFormat:@"search_h"];
    NSString *key4 = [NSString stringWithFormat:@"4"];
    [selectImageDict setObject:path4 forKey:key4];
    
    tabBarController.dictBtnImg = selectImageDict;
//    [selectImageDict release];
    
    // 设置tabBar对应的viewControllers,此处设置的导航
    NSArray *viewControllers = [[NSArray alloc] initWithObjects:
                                [HomeController defaultController].homeNavigationController,
                                [CategoryController defaultController].categoryNavigationController,
                                [SpaceController defaultController].spaceNavigationController,
                                [CollectionController defaultController].collectNavigationController,
                                [SearchController defaultController].searchNavigationController,
                                nil];
    
    tabBarController.viewControllers = viewControllers;
//    [viewControllers release];
    
    tabBarController.selectedIndex = 0;
    mainViewController_ = tabBarController;
    
    [mainWindow_ addSubview:[[LoginController defaultController].loginViewController view]];
//    [mainWindow_ addSubview:mainViewController_.view];

    
    [mainWindow_ makeKeyAndVisible];
    
    return YES;
}


@end
