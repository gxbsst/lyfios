#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LoginViewController.h"
//@class LoginViewController;

@interface LoginController : NSObject
{
    LoginViewController *loginViewController_;
}

+ (LoginController *) defaultController;

@property (nonatomic, retain) LoginViewController *loginViewController;

@end
