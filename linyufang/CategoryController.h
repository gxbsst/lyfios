#import <Foundation/Foundation.h>

@class CategoryNavigationController;

@interface CategoryController : NSObject
{
    CategoryNavigationController *categoryNavigationController_;
}

+ (CategoryController *) defaultController;

@property (nonatomic, retain) CategoryNavigationController *categoryNavigationController;

@end
