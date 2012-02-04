//
//  MultiScrollViewViewController.m
//  MultiScroller
//
//  Created by Christopher Motl on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MultiScrollViewViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MultiScrollViewViewController(private)

- (void)displayImage;
- (void)setScrollInsets;
- (void)setScrollOffsets;

@end

@implementation MultiScrollViewViewController

@synthesize scrollView;
@synthesize imageView;
@synthesize image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //add two tap gesture
    UITapGestureRecognizer *singleFingerDoubleTap = [[UITapGestureRecognizer alloc] 
                                                     initWithTarget:self action:@selector(restoreZoom)];
    singleFingerDoubleTap.numberOfTapsRequired = 2;
    [self.scrollView addGestureRecognizer:singleFingerDoubleTap];
}

-(void)viewWillAppear:(BOOL)animated {
    
    
    [self displayImage];
}

- (void)displayImage {
    
    scrollView.frame = self.view.frame;    
    printf("frame.origin.x: %f, frame.size.width: %f\n", scrollView.frame.origin.x, scrollView.frame.size.width);
    
	imageView.image = image;
	[imageView sizeToFit];
    printf("frame.origin.x: %f, frame.size.width: %f\n", self.view.frame.origin.x, self.view.frame.size.width);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:imageView.bounds];
    imageView.layer.shadowPath = path.CGPath;
        
    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(0, 0);
    imageView.layer.shadowOpacity = 0.7f;
    imageView.layer.shadowRadius = 5.0;
    
    scrollView.delegate = self;
    
    scrollView.contentSize = CGSizeMake(imageView.frame.size.width, imageView.frame.size.height);
	scrollView.maximumZoomScale = 3.0;
	scrollView.minimumZoomScale = .5f;
	scrollView.clipsToBounds = YES;    
    
    //set offsets before insets
    [self setScrollOffsets];
    [self setScrollInsets];
}

-(void)restoreZoom{
    [scrollView setZoomScale:1.0 animated:YES];
    
    //[self scrollViewDidEndZooming:scrollView withView:imageView atScale:1.0];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)setScrollInsets {
    CGSize screenSize = self.scrollView.frame.size;
    CGFloat topInset = (screenSize.height - imageView.image.size.height*scrollView.zoomScale) / 2.0;
    CGFloat bottomInset = (screenSize.height - imageView.image.size.height*scrollView.zoomScale) / 2.0;
    CGFloat leftInset = (screenSize.width - imageView.image.size.width*scrollView.zoomScale) / 2.0;
    CGFloat rightInset = (screenSize.width - imageView.image.size.width*scrollView.zoomScale) / 2.0;
    
    if (topInset < 0.0)
    {
        topInset = 5.0;
    }
    
    if (leftInset < 0.0)
    {
        leftInset = 5.0;
    }
    
    if (rightInset < 0.0)
    {
        rightInset = 5.0;
    }
    
    if(bottomInset < 0.0)
    {
        bottomInset = 5.0;
    }
    
    [scrollView setContentInset:UIEdgeInsetsMake(topInset, leftInset, bottomInset, rightInset)];
}

-(void)setScrollOffsets {
    
    CGSize screenSize = self.scrollView.frame.size;
    
    int leftOffset = 0;
    int topOffset = 0;
    
    if(imageView.image.size.height > screenSize.height - (self.navigationController.navigationBar.frame.size.height + 5))
    {
        topOffset = -(self.navigationController.navigationBar.frame.size.height + 5);
    }
    
    if(imageView.image.size.width > screenSize.width - 5)
    {
        leftOffset = -5;
    }
    
    scrollView.contentOffset = CGPointMake(leftOffset, topOffset);
}

- (void)scrollViewDidEndZooming:(UIScrollView *)theScrollView withView:(UIView *)view atScale:(float)scale{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.35f];
    
    [self setScrollInsets];    
    
    [UIView commitAnimations];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
	return imageView;
}

@end
