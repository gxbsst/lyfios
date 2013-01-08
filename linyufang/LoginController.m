#import "LoginController.h"
#import "LoginViewController.h"

@implementation LoginController

@synthesize loginViewController = loginViewController_;

// 登录控制器单实例
+ (LoginController *) defaultController
{
    static LoginController* sharedInstance = nil;
    
    if (nil == sharedInstance)
    {
        sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

- (id) init
{
    if (!(self = [super init]))
        return nil;
    
    loginViewController_ = [[LoginViewController alloc] init];
    
    return self;
}

//- (void) dealloc
//{
//    [loginViewController_ release];
//    [super dealloc];
//}

@end
