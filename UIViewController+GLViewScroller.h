//
//  UIViewController+GLViewScroller.h
//  GLViewScroller
//
//  Created by Gertjan Leemans on 25/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GLViewScroller;

@interface UIViewController (GLViewScroller)

- (GLViewScroller*) glViewScroller;
- (void) setGLViewScroller: (GLViewScroller*) glViewScroller;

@end
