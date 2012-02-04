//
//  ViewController.h
//  MultiScroller
//
//  Created by Christopher Motl on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController {
    UIScrollView *scrollView;
}

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@end
