#import "HomeViewController.h"
#import "HomeNavigationController.h"
#import "AppDelegate.h"

@implementation HomeViewController

- (id) init
{
    self = [super init];
    if (self)
    {
        self.title = @"首页";
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg640X960"]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
