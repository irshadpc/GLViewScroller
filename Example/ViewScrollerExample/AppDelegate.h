//
//  AppDelegate.h
//  ViewScrollerExample
//
//  Created by Gertjan Leemans on 27/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLViewScroller.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, GLViewScrollerDataSource>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GLViewScroller* viewScroller;

@end
