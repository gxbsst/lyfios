#import "CategoryController.h"
#import "CategoryNavigationController.h"

@implementation CategoryController

@synthesize categoryNavigationController = categoryNavigationController_;

+ (CategoryController *) defaultController
{
    static CategoryController *sharedInstance = nil;
    
    if (nil == sharedInstance)
    {
        sharedInstance = [[self alloc] init];
    }
    
    return  sharedInstance;
}

- (id) init
{
    if (!(self = [super init]))
        return nil;
    
    categoryNavigationController_ = [[CategoryNavigationController alloc] init];
    
    return self;
}

//- (void) dealloc
//{
//    [categoryNavigationController_ release];
//    [super dealloc];
//}

@end
