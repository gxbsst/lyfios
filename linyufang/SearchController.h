#import <Foundation/Foundation.h>

@class SearchNavigationController;

@interface SearchController : NSObject
{
    SearchNavigationController *searchNavigationController_;
}

+ (SearchController *) defaultController;

@property (retain, nonatomic) SearchNavigationController *searchNavigationController;

@end
