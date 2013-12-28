//
//  GLContainerViewController.h
//  GLViewScroller
//
//  Created by Gertjan Leemans on 25/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLViewScrollerDataSource.h"
#import "GLViewScrollerDataSource.h"
#import "GLViewScrollerUIViewControllerDelegate.h"
#import "GLScrollDirection.h"
#import "UIViewController+GLViewScroller.h"

@interface GLViewScroller : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView* scrollView;
@property (assign, nonatomic) CGFloat margin;

@property (assign, nonatomic) id<GLViewScrollerDataSource> dataSource;

- (void) updateViewControllers;

- (UIViewController<GLViewScrollerUIViewControllerDelegate> *) visibleViewController;
- (UIViewController<GLViewScrollerUIViewControllerDelegate> *) viewControllerWithIdentifier: (NSString*) identifier;

#pragma mark - View Handling

- (void) scrollToViewControllerAtIndex: (NSInteger) index withOptions: (NSDictionary *) options;
- (void) scrollToViewControllerWithIdentifier: (NSString*) identifier withOptions: (NSDictionary *) options;
- (void) scrollToViewController: (UIViewController<GLViewScrollerUIViewControllerDelegate> *) viewController withOptions: (NSDictionary *) options;

@end
