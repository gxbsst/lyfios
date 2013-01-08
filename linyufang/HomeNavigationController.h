#import <UIKit/UIKit.h>

@class HomeViewController;

@interface HomeNavigationController : UINavigationController <UINavigationControllerDelegate>
{
    HomeViewController *homeViewController_;
}

@end
