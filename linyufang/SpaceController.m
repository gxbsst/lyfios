//
//  SHHSpaceController.m
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by sui huan on 12-9-6.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import "SpaceController.h"
#import "SpaceNavigationController.h"

@implementation SpaceController

@synthesize spaceNavigationController = spaceNavigationController_;

+ (SpaceController *) defaultController
{
    static SpaceController *sharedInstance = nil;
    
    if (nil == sharedInstance)
    {
        sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

- (id) init
{
    if (!(self = [super init]))
        return nil;
    
    spaceNavigationController_ = [[SpaceNavigationController alloc] init];
    
    return self;
}

//- (void) dealloc
//{
//    [spaceNavigationController_ release];
//    [super dealloc];
//}

@end
