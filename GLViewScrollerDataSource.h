//
//  GLContainerViewControllerDataSource.h
//  GLViewScroller
//
//  Created by Gertjan Leemans on 25/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLViewScrollerUIViewControllerDelegate.h"

@class GLViewScroller;

@protocol GLViewScrollerDataSource <NSObject>

@required
- (NSInteger) numberOfViewControllersInGLViewScroller: (GLViewScroller*) glViewScroller;
- (UIViewController<GLViewScrollerUIViewControllerDelegate> *) glViewScroller: (GLViewScroller*) glViewScroller viewControllerAtIndex: (NSInteger) index;

@end
