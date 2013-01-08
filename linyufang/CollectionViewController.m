#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"购物车";
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
