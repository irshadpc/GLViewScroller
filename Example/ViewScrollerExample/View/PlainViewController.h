//
//  PlainViewController.h
//  ViewScrollerExample
//
//  Created by Gertjan Leemans on 27/12/13.
//  Copyright (c) 2013 Gertjan Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLViewScroller.h"

@interface PlainViewController : UIViewController<GLViewScrollerUIViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
