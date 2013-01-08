#import "SearchViewController.h"

@implementation SearchViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"搜索";
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
