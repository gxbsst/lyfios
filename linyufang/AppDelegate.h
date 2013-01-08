#import <UIKit/UIKit.h>

// NavigationBar增加方法，用于SDK5.0之前的导航栏背景颜色修改
@interface UINavigationBar (UiNavigationBarImage)
-(void)setBackgroundImage:(UIImage *)image;
-(void)insertSubview:(UIView *)view atIndex:(NSInteger)index;
@end

@implementation UINavigationBar (UiNavigationBarImage)
UIImageView *backgroundView;
-(void)setBackgroundImage:(UIImage *)image
{
    self.tintColor = [UIColor brownColor];
    if (image == nil) {
        [backgroundView removeFromSuperview];
    }
    else
    {
         // 这里remove的原因是，解决tab页来回切换，navagationItem.left和right按钮被背景图片遮挡
        if (backgroundView !=nil) {
            [backgroundView removeFromSuperview];
        }
        backgroundView = [[UIImageView alloc] initWithImage: image];
        backgroundView.tag = 10;
        backgroundView.frame = CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height);
        backgroundView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:backgroundView];
    }
}

-(void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
    [self sendSubviewToBack:backgroundView];
}

@end

@class Ivan_UITabBar;

@interface AppDelegate : UIApplication<UIApplicationDelegate, UITabBarControllerDelegate>
{
    // 主视图
    UIWindow *mainWindow_;
    // 根视图控制器
    UIViewController *mainViewController_;
}

@property(retain, nonatomic) UIWindow *mainWindow;
@property(retain, nonatomic) UIViewController *mainViewController;

#pragma mark - 全局对象
+(AppDelegate *) shareApplication;

#pragma mark - 模态窗口封装
// 调用模态窗口
-(void)presentMoalViewController:(UIViewController *) modalViewController animated:(BOOL) animated;
-(void)presentMoalViewController:(UIViewController *) modalViewController animated:(BOOL)animated singly:(BOOL) singly;

// 取消模态窗口显示
-(void) dismissModalViewControllerAnimated:(BOOL) animated;

#pragma mark - Tabbar操作部分
// 隐藏Tabbar
-(void) hiddenTabBar:(BOOL) hidden;

// 获取TabbarController

-(Ivan_UITabBar *) tabBarController;

// 登录成功的响应函数
-(void) loginSuccessful:(NSNotification *) notifaction;

@end
