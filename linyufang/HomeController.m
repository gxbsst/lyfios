#import "HomeController.h"
#import "HomeNavigationController.h"

@implementation HomeController

@synthesize homeNavigationController = homeNavigationController_;

+ (HomeController *) defaultController
{
    static HomeController *sharedInstance = nil;
    
    if (nil == sharedInstance)
    {
        sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

- (id) init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    homeNavigationController_ = [[HomeNavigationController alloc] init];
    
    return self;
}

//- (void) dealloc
//{
//    [homeNavigationController_ release];
//    [super dealloc];
//}

@end
