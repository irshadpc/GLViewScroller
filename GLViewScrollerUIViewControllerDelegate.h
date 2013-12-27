//
//  GLViewScrollerUIViewControllerDelegate.h
//  GLViewScroller
//
//  Created by Gertjan Leemans on 25/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLScrollDirection.h"

@protocol GLViewScrollerUIViewControllerDelegate <NSObject>

@required

- (NSString*) identifier;

- (void) updateWithOptions: (NSDictionary*) options;
- (BOOL) canScrollToDirection: (GLScrollDirection) direction;

@optional
- (void) didBecomeVisible;
- (void) didBecomeInvisible;

@end
