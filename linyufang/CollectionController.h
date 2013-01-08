
#import <Foundation/Foundation.h>

@class CollectionNavigationController;

@interface CollectionController : NSObject
{
    CollectionNavigationController *collectNavigationController_;
}

+ (CollectionController *) defaultController;

@property (nonatomic, retain) CollectionNavigationController *collectNavigationController;

@end
