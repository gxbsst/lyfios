#import <Foundation/Foundation.h>

@class HomeNavigationController;

@interface HomeController : NSObject
{
    HomeNavigationController *homeNavigationController_;
}

+ (HomeController *) defaultController;

@property (nonatomic, retain) HomeNavigationController *homeNavigationController;

@end
