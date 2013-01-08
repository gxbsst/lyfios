#import "CollectionController.h"
#import "CollectionNavigationController.h"

@implementation CollectionController

@synthesize collectNavigationController = collectNavigationController_;

+ (CollectionController *) defaultController
{
    static CollectionController *sharedInsctance = nil;
    
    if (nil == sharedInsctance)
    {
        sharedInsctance = [[self alloc] init];
    }
    
    return sharedInsctance;
}

- (id) init
{
    if (!(self = [super init]))
        return nil;
    
    collectNavigationController_ = [[CollectionNavigationController alloc] init];
    
    return self;
}

//- (void) dealloc
//{
//    [collectNavigationController_ release];
//    [super dealloc];
//}

@end
