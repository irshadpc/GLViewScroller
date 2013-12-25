//
//  UIViewController+GLViewScroller.m
//  GLViewScroller
//
//  Created by Gertjan Leemans on 25/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import "UIViewController+GLViewScroller.h"
#import <objc/runtime.h>
#import "GLViewScroller.h"

// Trivial identifier to retrieve the GLViewScroller
static NSString *kGLViewScrollerKey = @"com.gertjanleemans.GLViewScroller.UIViewController+GLViewScroller";

@implementation UIViewController (GLViewScroller)

- (GLViewScroller*) glViewScroller{
    return objc_getAssociatedObject(self, (__bridge const void *)(kGLViewScrollerKey));
}

- (void) setGLViewScroller: (GLViewScroller*) glViewScroller{
    objc_setAssociatedObject(self, (__bridge const void *)(kGLViewScrollerKey), glViewScroller, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
