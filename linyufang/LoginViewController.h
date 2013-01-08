#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
    UITextField *textName;
    UITextField *textPassword;
    UIButton *bindBtn;
    
    UINavigationBar *bar;
}

- (void) loginBtnAction;

@end
