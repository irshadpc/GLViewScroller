//
//  GLContainerViewController.h
//  GLViewScroller
//
//  Created by Gertjan Leemans on 25/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLViewScrollerDataSource.h"

@interface GLViewScroller : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView* scrollView;

@property (assign, nonatomic) id<GLViewScrollerDataSource> dataSource;

- (void) updateViewControllers;

#pragma mark - View Handling

- (UIViewController<GLViewScrollerUIViewControllerDelegate> *) visibleViewController;
- (void) scrollToViewControllerAtIndex: (NSInteger) index withOptions: (NSDictionary *) options;
- (void) scrollToViewControllerWithIdentifier: (NSString*) identifier withOptions: (NSDictionary *) options;
- (void) scrollToViewController: (UIViewController<GLViewScrollerUIViewControllerDelegate> *) viewController withOptions: (NSDictionary *) options;

@end
