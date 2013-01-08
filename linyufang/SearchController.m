#import "SearchController.h"
#import "SearchNavigationController.h"

@implementation SearchController

@synthesize searchNavigationController = searchNavigationController_;

+ (SearchController *) defaultController
{
    static SearchController *sharedInstance = nil;
    
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
    
    searchNavigationController_ = [[SearchNavigationController alloc] init];
    
    return self;
}

//- (void) dealloc
//{
//    [searchNavigationController_ release];
//    [super dealloc];
//}

@end
