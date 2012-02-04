//
//  MultiScrollViewViewController.h
//  MultiScroller
//
//  Created by Christopher Motl on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiScrollViewViewController : UIViewController<UIScrollViewDelegate> {
    UIScrollView *scrollView;
    UIImageView *imageView;
    UIImage *image;
}

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIImage *image;

@end
