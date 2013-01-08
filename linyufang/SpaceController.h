//
//  SHHSpaceController.h
//  SHHFrameWorkWithNaviAndTabBar
//
//  Created by sui huan on 12-9-6.
//  Copyright (c) 2012年 sui huan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpaceNavigationController;

@interface SpaceController : NSObject
{
    SpaceNavigationController *spaceNavigationController_;
}

+ (SpaceController *) defaultController;

@property (nonatomic, retain) SpaceNavigationController *spaceNavigationController;

@end
