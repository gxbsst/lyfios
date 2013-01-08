#import "SpaceNavigationController.h"
#import "SpaceViewController.h"
#import "AppDelegate.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface SpaceNavigationController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@end

@implementation SpaceNavigationController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.tabBarItem.title = @"个人空间";
        self.tabBarItem.image = [UIImage imageNamed:@"space"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
        //        NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        if ([mediaTypes containsObject:(NSString *) kUTTypeImage ]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.mediaTypes = [NSArray arrayWithObject:(NSString *) kUTTypeImage];
            picker.allowsEditing = YES;
            //            [self presentModalViewController:picker animated:YES];
            [self presentViewController:picker animated:YES completion:NULL];
            
        }
    }
    
    
//	if (spaceViewController_)
//        return;
//    
//    spaceViewController_ = [[SpaceViewController alloc] init];
////    [self pushViewController:spaceViewController_ animated:NO];
}

- (void) viewWillAppear:(BOOL)animated
{
    // 设置导航栏背景颜色
//    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
//    {
//        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgCartNavi"] forBarMetrics:UIBarMetricsDefault];
//    }
//    else
//    {
//        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgCartNavi"]];
//    }
}

//- (void) dealloc
//{
//    [spaceViewController_  release];
//    [super dealloc];
//}

-(void)dismissImagePicker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#define MAX_IMAGE_WIDTH 200

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image) image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = imageView.frame;
        while (frame.size.width > MAX_IMAGE_WIDTH) {
            frame.size.width /=2;
            frame.size.height /=2;
        }
        imageView.frame = frame;
        [self.view addSubview:imageView];
    }
    [self dismissImagePicker];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissImagePicker];
}


@end
