#import "SpaceViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"

@implementation SpaceViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"个人空间";
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg640X960"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

@end
