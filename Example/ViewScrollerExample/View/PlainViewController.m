//
//  PlainViewController.m
//  ViewScrollerExample
//
//  Created by Gertjan Leemans on 27/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import "PlainViewController.h"

@interface PlainViewController ()

@end

@implementation PlainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GLViewScrollerUIViewControllerDelegate

- (NSString *)identifier{
    return @"PlainViewController";
}

- (BOOL)canScrollToDirection:(GLScrollDirection)direction{
    return YES;
}

- (void)updateWithOptions:(NSDictionary *)options{
    
}

@end
