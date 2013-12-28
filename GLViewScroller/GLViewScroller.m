//
//  GLContainerViewController.m
//  GLViewScroller
//
//  Created by Gertjan Leemans on 25/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import "GLViewScroller.h"

@interface GLViewScroller ()

@property (strong, nonatomic) NSMutableDictionary* viewControllerCache;
@property (strong, nonatomic) NSString* visibleViewControllerIdentifier;

@end

@implementation GLViewScroller

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if(!self.scrollView){
        // If no scrollView set, create one full-screen
        self.scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview: self.scrollView];
    }
    
    if(!self.scrollView.delegate){
        // If scrollView doesn't have a delegate, set it to self
        self.scrollView.delegate = self;
        self.scrollView.pagingEnabled = YES;
    }
    
    self.viewControllerCache = [NSMutableDictionary dictionary];
    
    [self updateViewControllers];
}

- (void) updateViewControllers{
    CGFloat currentWidth = 0;
    
    NSMutableDictionary* newViewControllerCache = [NSMutableDictionary dictionary];
    
    for(int i = 0; i < [self.dataSource numberOfViewControllersInGLViewScroller: self]; i++){
        UIViewController<GLViewScrollerUIViewControllerDelegate>* viewController = [self.dataSource glViewScroller: self viewControllerAtIndex: i];
        
        BOOL isNewViewController = NO;
        
        if(!self.viewControllerCache[[viewController identifier]]){
            // New viewController
            self.viewControllerCache[[viewController identifier]] = viewController;
            isNewViewController = YES;
        }
        
        viewController.view.frame = CGRectMake(currentWidth, 0, viewController.view.frame.size.width, viewController.view.frame.size.height);
        
        if(isNewViewController){
            // New viewController, add it to the scrollView and set parent
            [viewController setGLViewScroller: self];
            [self.scrollView addSubview: viewController.view];
        }
        
        currentWidth += viewController.view.frame.size.width + self.margin;
        newViewControllerCache[[viewController identifier]] = viewController;
    }
    
    self.viewControllerCache = newViewControllerCache;
    
    self.scrollView.contentSize = CGSizeMake(currentWidth, self.scrollView.frame.size.height);
}

- (UIViewController<GLViewScrollerUIViewControllerDelegate> *)visibleViewController{
    return self.viewControllerCache[self.visibleViewControllerIdentifier];
}

- (UIViewController<GLViewScrollerUIViewControllerDelegate> *)viewControllerWithIdentifier:(NSString *)identifier{
    return self.viewControllerCache[identifier];
}

#pragma mark - View Handling

- (void)scrollToViewControllerAtIndex:(NSInteger)index withOptions:(NSDictionary *)options{
    [self scrollToViewControllerAtIndex: index withOptions: options animated: YES];
}

- (void)scrollToViewControllerWithIdentifier:(NSString *)identifier withOptions:(NSDictionary *)options{
    [self scrollToViewControllerWithIdentifier: identifier withOptions: options animated: YES];
}

- (void)scrollToViewController:(UIViewController<GLViewScrollerUIViewControllerDelegate> *)viewController withOptions:(NSDictionary *)options{
    [self scrollToViewController: viewController withOptions: options animated: YES];
}

- (void)scrollToViewControllerAtIndex:(NSInteger)index withOptions:(NSDictionary *)options animated:(BOOL)animated{
    if(index < 0){
        index = 0;
    }
    if(index >= self.viewControllerCache.count){
        index = self.viewControllerCache.count - 1;
    }
    UIViewController<GLViewScrollerUIViewControllerDelegate>* viewController = [self.dataSource glViewScroller: self viewControllerAtIndex: index];
    [self scrollToViewController: viewController withOptions: options];
}

- (void)scrollToViewControllerWithIdentifier:(NSString *)identifier withOptions:(NSDictionary *)options animated:(BOOL)animated{
    [self scrollToViewController: self.viewControllerCache[identifier] withOptions: options];
}

- (void)scrollToViewController:(UIViewController<GLViewScrollerUIViewControllerDelegate> *)viewController withOptions:(NSDictionary *)options animated:(BOOL)animated{
    [viewController updateWithOptions: options];
    CGRect frame = viewController.view.frame;
    [self.scrollView scrollRectToVisible: frame animated: animated];
    
    // Call visible/invisible on viewControllers
    for (NSString* key in self.viewControllerCache) {
        UIViewController<GLViewScrollerUIViewControllerDelegate>* viewControllerFromCache = self.viewControllerCache[key];
        
        if(viewController == viewControllerFromCache){
            // Visible
            [viewController didBecomeVisible];
        } else {
            // Invisible
            [viewController didBecomeInvisible];
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for(NSString* key in [self.viewControllerCache allKeys]){
        UIViewController<GLViewScrollerUIViewControllerDelegate>* viewController = self.viewControllerCache[key];
        
        if(viewController.view.frame.origin.x == scrollView.contentOffset.x){
            // Visible
            self.visibleViewControllerIdentifier = [viewController identifier];
            if([viewController respondsToSelector: @selector(didBecomeVisible)]){
                [viewController didBecomeVisible];
            }
        } else {
            // Invisible
            if([viewController respondsToSelector: @selector(didBecomeInvisible)]){
                [viewController didBecomeInvisible];
            }
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.x > self.visibleViewController.view.frame.origin.x && ![self.visibleViewController canScrollToDirection: GLScrollDirectionToRight]){
        scrollView.contentOffset = CGPointMake(self.visibleViewController.view.frame.origin.x, scrollView.contentOffset.y);
    }
    if(scrollView.contentOffset.x < self.visibleViewController.view.frame.origin.x && ![self.visibleViewController canScrollToDirection: GLScrollDirectionToLeft]){
        scrollView.contentOffset = CGPointMake(self.visibleViewController.view.frame.origin.x, scrollView.contentOffset.y);
    }
    if(scrollView.contentOffset.y > self.visibleViewController.view.frame.origin.y && ![self.visibleViewController canScrollToDirection: GLScrollDirectionToTop]){
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, self.visibleViewController.view.frame.origin.y);
    }
    if(scrollView.contentOffset.y < self.visibleViewController.view.frame.origin.y && ![self.visibleViewController canScrollToDirection: GLScrollDirectionToBottom]){
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, self.visibleViewController.view.frame.origin.y);
    }
}

@end
