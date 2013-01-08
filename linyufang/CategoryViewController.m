#import "CategoryViewController.h"

@implementation CategoryViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"分类列表";
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
