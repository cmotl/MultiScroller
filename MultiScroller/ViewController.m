//
//  ViewController.m
//  MultiScroller
//
//  Created by Christopher Motl on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MultiScrollViewViewController.h"

@implementation ViewController

@synthesize scrollView;

#define PADDING  10

- (CGRect)frameForPagingScrollView {
    //CGRect frame = [[UIScreen mainScreen] bounds];
    CGRect frame = self.view.frame;
    frame.origin.x -= PADDING;
    frame.size.width += (2 * PADDING);
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
    MultiScrollViewViewController *internalScrollView1 = [[MultiScrollViewViewController alloc] init];
    internalScrollView1.view.frame = [self frameForPageAtIndex:0];
    internalScrollView1.image = [UIImage imageNamed:@"sexy_beast.png"];

    MultiScrollViewViewController *internalScrollView2 = [[MultiScrollViewViewController alloc] init];
    internalScrollView2.view.frame = [self frameForPageAtIndex:1];
    internalScrollView2.image = [UIImage imageNamed:@"nailed_it.jpg"];
    
    MultiScrollViewViewController *internalScrollView3 = [[MultiScrollViewViewController alloc] init];
    internalScrollView3.view.frame = [self frameForPageAtIndex:2];
    internalScrollView3.image = [UIImage imageNamed:@"honey_badger.jpg"];
    
    self.scrollView.frame = [self frameForPagingScrollView];
    
    [self addChildViewController:internalScrollView1];
    [self.scrollView addSubview:internalScrollView1.view];

    [self addChildViewController:internalScrollView2];
    [self.scrollView addSubview:internalScrollView2.view];
    
    [self addChildViewController:internalScrollView3];
    [self.scrollView addSubview:internalScrollView3.view];
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
    
    UIColor *backgroundPattern = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"linen.png"]];
    self.view.backgroundColor = backgroundPattern;
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
