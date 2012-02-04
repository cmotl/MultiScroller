//
//  ViewController.m
//  MultiScroller
//
//  Created by Christopher Motl on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize scrollView;

#define PADDING  10

- (CGRect)frameForPagingScrollView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    frame.origin.x -= PADDING;
    return frame;
}

- (CGRect)frameForPageAtIndex:(NSUInteger)index {
    CGRect pagingScrollViewFrame = [self frameForPagingScrollView];
    
    CGRect pageFrame = pagingScrollViewFrame;
    pageFrame.size.width -= (2 * PADDING);
    pageFrame.origin.x = (pagingScrollViewFrame.size.width * index) + PADDING;
    return pageFrame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *internalScrollView1 = [[UIScrollView alloc] init];
    internalScrollView1.frame = [self frameForPageAtIndex:0];
    
    UIScrollView *internalScrollView2 = [[UIScrollView alloc] init];
    internalScrollView2.frame = [self frameForPageAtIndex:1];
    
    UIScrollView *internalScrollView3 = [[UIScrollView alloc] init];
    internalScrollView3.frame = [self frameForPageAtIndex:2];
    
    
    CGRect frame;
    frame.origin.x = 0;
    frame.origin.y = 10;
    frame.size = self.scrollView.frame.size;
    frame.size.height -= 20;
    frame.size.width = 500.0f;
    
    UIView *subview1 = [[UIView alloc] initWithFrame:frame];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = subview1.bounds;
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [subview1.layer insertSublayer:gradient atIndex:0];
    internalScrollView1.contentSize = frame.size;
    
    frame.origin.x = 0;
    frame.origin.y = 10;
    frame.size = self.scrollView.frame.size;
    frame.size.height -= 20;
    frame.size.width = 200.0f;
    
    UIView *subview2 = [[UIView alloc] initWithFrame:frame];
    gradient = [CAGradientLayer layer];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.frame = subview2.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor greenColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [subview2.layer insertSublayer:gradient atIndex:0];
    internalScrollView2.contentSize = frame.size;
    
    frame.origin.x = 0;
    frame.origin.y = 10;
    frame.size = self.scrollView.frame.size;
    frame.size.height -= 20;
    frame.size.width = 100.0f;
    
    UIView *subview3 = [[UIView alloc] initWithFrame:frame];
    gradient = [CAGradientLayer layer];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.frame = subview3.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blueColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [subview3.layer insertSublayer:gradient atIndex:0];
    internalScrollView3.contentSize = frame.size;
    
    
    [internalScrollView1 addSubview:subview1];
    [internalScrollView2 addSubview:subview2];
    [internalScrollView3 addSubview:subview3];
    
    [self.scrollView addSubview:internalScrollView1];
    [self.scrollView addSubview:internalScrollView2];
    [self.scrollView addSubview:internalScrollView3];
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
