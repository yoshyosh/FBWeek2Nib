//
//  FeedViewController.m
//  FBWeek2Nib
//
//  Created by Joseph Anderson on 4/5/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *feedViewIndicator;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.feedViewIndicator startAnimating];
    
    self.navigationItem.title = @"News Feed";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftButton"] style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"requests"] style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self performSelector:@selector(showNewsfeed) withObject:nil afterDelay:2];
}

- (void)showNewsfeed {
    [self.feedViewIndicator stopAnimating];
    NSLog(@"Saying something here");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
