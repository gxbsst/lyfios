//
//  Ivan_UITabBar.m
//  JustForTest
//
//  Created by Ivan on 11-5-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Ivan_UITabBar.h"
//#import "UIBadgeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation Ivan_UITabBar
@synthesize currentSelectedIndex;
@synthesize buttons;
@synthesize dictBtnImg;

static BOOL FIRSTTIME =YES;


- (void)viewDidAppear:(BOOL)animated{
	if (FIRSTTIME) {
		[[NSNotificationCenter defaultCenter] removeObserver:self name:@"hideCustomTabBar" object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(hideCustomTabBar)
													 name: @"hideCustomTabBar"
												   object: nil];
		[[NSNotificationCenter defaultCenter] removeObserver:self name:@"bringCustomTabBarToFront" object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(bringCustomTabBarToFront)
													 name: @"bringCustomTabBarToFront"
												   object: nil];
//		[[NSNotificationCenter defaultCenter] removeObserver:self name:@"setBadge" object:nil];
//		[[NSNotificationCenter defaultCenter] addObserver:self
//												 selector:@selector(setBadge:)
//													 name: @"setBadge"
//												   object: nil];
		
		slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide"]];
		[self hideRealTabBar];
		[self customTabBar];
		FIRSTTIME = NO;
	}
}

- (void)hideRealTabBar{
	for(UIView *view in self.view.subviews){
		if([view isKindOfClass:[UITabBar class]]){
			view.hidden = YES;
			break;
		}
	}
}

- (void)hiddenTabBar:(BOOL)hide
{
    cusTomTabBarView.hidden = hide;
}

//设置badge
- (void)setBadge:(NSNotification *)_notification{
//	NSString *badgeValue = [_notification object];
//    
//    if (badgeViewGet!=nil) {
//        [badgeViewGet removeFromSuperview];
////        [badgeViewGet release];
//        badgeViewGet = nil;
//    }
//    
//    if (nil==badgeValue || [badgeValue isEqualToString:@""] || [badgeValue isEqualToString:@"0"]) {
//        return;
//    }
//    
//	UIButton *btn = [self.buttons lastObject];
//	badgeViewGet = [[UIBadgeView alloc] initWithFrame:CGRectMake(btn.bounds.size.width/2, 3, 30, 20)];
//	badgeViewGet.badgeString = badgeValue;
//	badgeViewGet.badgeColor = [UIColor redColor];
//	badgeViewGet.tag = self.selectedIndex;
//	badgeViewGet.delegate = self;
//	[btn addSubview:badgeViewGet];
}

//自定义tabbar
- (void)customTabBar{
	//获取tabbar的frame
	CGRect tabBarFrame = self.tabBar.frame;
	backGroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, 320, 49)];
    
    tabBarFrame.origin.y -= 15;
    tabBarFrame.size.height += 15;
	cusTomTabBarView = [[UIView alloc] initWithFrame:tabBarFrame];
	//设置tabbar背景
    
    // 阴影部分，此处注释掉了
    //    UIImageView *shadeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
    //    shadeView.image = [UIImage imageNamed:@"bg4X15"];
    //    [cusTomTabBarView addSubview:shadeView];
    //    [shadeView release];
	
	backGroundImageView.image = [UIImage imageNamed:@"bgTabbar"];
	[cusTomTabBarView addSubview:backGroundImageView];
//	[backGroundImageView release];
	//cusTomTabBarView.backgroundColor = [UIColor blackColor];
	
	//创建按钮
	int viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
	self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
	double _width = 320 / viewCount;
	double _height = self.tabBar.frame.size.height ;
	for (int i = 0; i < viewCount; i++) {
		UIViewController *v = [self.viewControllers objectAtIndex:i];
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.frame = CGRectMake(i*_width, 15, _width, _height);
		[btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchDown];
		btn.tag = i;
		[btn setImage:v.tabBarItem.image forState:UIControlStateNormal];
		[btn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        
        if (self.selectedIndex == i) {
            NSString *key = [NSString stringWithFormat:@"%d",i];
            [btn setImage:[UIImage imageNamed:[dictBtnImg objectForKey:key]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"bg4X98_"] forState:UIControlStateNormal];
        }
        
#if 1
		//添加标题
		UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _height-18, _width, _height-30)];
		titleLabel.backgroundColor = [UIColor clearColor];
		titleLabel.text = v.tabBarItem.title;
		[titleLabel setFont:[UIFont systemFontOfSize:12]];
		titleLabel.textAlignment = 1;
		titleLabel.textColor = [UIColor whiteColor];
		[btn addSubview:titleLabel];
//		[titleLabel release];
#endif
		
		[self.buttons addObject:btn];
        
#if 0
		//添加按钮之间的分割线,第一个位置和最后一个位置不需要添加
		if (i>0 && i<4) {
			UIImageView *splitView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"split"]];
			splitView.frame = CGRectMake(i*_width-1,0,splitView.frame.size.width,splitView.frame.size.height);
			[cusTomTabBarView addSubview:splitView];
			[splitView release];
		}
#endif
		
		[cusTomTabBarView addSubview:btn];
	}
    
	[self.view addSubview:cusTomTabBarView];
	[cusTomTabBarView addSubview:slideBg];
//	[cusTomTabBarView release];
#if 0
	[self performSelector:@selector(slideTabBg:) withObject:[self.buttons objectAtIndex:0]];
#endif
}

//切换tabbar
- (void)selectedTab:(UIButton *)button{
    
    for(int i = 0; i < [buttons count]; i++)
    {
        if (button.tag == i) {
            NSString *key = [NSString stringWithFormat:@"%d",button.tag];
            [button setBackgroundImage:[UIImage imageNamed:@"bg4X98_"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[dictBtnImg objectForKey:key]] forState:UIControlStateNormal];
            continue;
        }
        
        
        UIViewController *v = [self.viewControllers objectAtIndex:i];
        [[buttons objectAtIndex:i] setBackgroundImage:nil forState:UIControlStateNormal];
        [[buttons objectAtIndex:i] setImage:v.tabBarItem.image forState:UIControlStateNormal];
        //[[buttons objectAtIndex:i] setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        
    }
    
	if (self.currentSelectedIndex == button.tag) {
		[[self.viewControllers objectAtIndex:button.tag] popToRootViewControllerAnimated:YES];
		return;
	}
	self.currentSelectedIndex = button.tag;
	self.selectedIndex = self.currentSelectedIndex;
#if 0
	[self performSelector:@selector(slideTabBg:) withObject:button];
#endif
}

//将自定义的tabbar显示出来
- (void)bringCustomTabBarToFront{
    [self performSelector:@selector(hideRealTabBar)];
    [cusTomTabBarView setHidden:NO];
    
    CAKeyframeAnimation * animation;
	animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	animation.duration = 0.25;
	animation.delegate = self;
	animation.removedOnCompletion = YES;
	animation.fillMode = kCAFillModeForwards;
	NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
	animation.values = values;
	[cusTomTabBarView.layer addAnimation:animation forKey:nil];
}

//隐藏自定义tabbar
- (void)hideCustomTabBar{
	[self performSelector:@selector(hideRealTabBar)];
    
    CAKeyframeAnimation * animation;
	animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	animation.duration = 0.1;
	animation.delegate = self;
	animation.removedOnCompletion = YES;
	animation.fillMode = kCAFillModeForwards;
	NSMutableArray *values = [NSMutableArray array];
	[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]];
	animation.values = values;
	[cusTomTabBarView.layer addAnimation:animation forKey:nil];
}

//动画结束回调
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (anim.duration==0.1) {
        [cusTomTabBarView setHidden:YES];
    }
}

//切换滑块位置
- (void)slideTabBg:(UIButton *)btn{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.20];
	[UIView setAnimationDelegate:self];
	slideBg.frame = btn.frame;
	[UIView commitAnimations];
	CAKeyframeAnimation * animation;
	animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	animation.duration = 0.50;
	animation.delegate = self;
	animation.removedOnCompletion = YES;
	animation.fillMode = kCAFillModeForwards;
	NSMutableArray *values = [NSMutableArray array];
	[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
	[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
	[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
	[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
	animation.values = values;
	[btn.layer addAnimation:animation forKey:nil];
}


//- (void) dealloc{
//	
//	[cusTomTabBarView release];
//	[slideBg release];
//	[buttons release];
//	[backGroundImageView release];
//	[super dealloc];
//}
//

@end
