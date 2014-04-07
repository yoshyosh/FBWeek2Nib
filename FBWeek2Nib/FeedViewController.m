//
//  FeedViewController.m
//  FBWeek2Nib
//
//  Created by Joseph Anderson on 4/5/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "FeedViewController.h"
#import "ModalViewController.h"
#import "ProfileViewController.h"

@interface FeedViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *feedViewIndicator;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
- (IBAction)pushStatusButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *statusButton;
@property (strong, nonatomic) IBOutlet UIImageView *feedImage;

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
    self.scrollView.contentSize = self.contentView.bounds.size;
    self.scrollView.hidden = YES;
    self.statusButton.hidden = YES;
    
    self.navigationItem.title = @"News Feed";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftButton"] style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"requests"] style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self performSelector:@selector(showNewsfeed) withObject:nil afterDelay:2];
    
    //TapGesture Recognizer vs touchesBegan
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapPushProfile:)];
    self.feedImage.userInteractionEnabled = YES;
    [self.feedImage addGestureRecognizer:tap];
}

- (void)showNewsfeed {
    [self.feedViewIndicator stopAnimating];
    self.scrollView.hidden = NO;
    self.statusButton.hidden = NO;
}

- (void)onTapPushProfile:(id)sender {
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushStatusButton:(id)sender {
    UIViewController *modalView = [[ModalViewController alloc] init];
    UINavigationController *modalNavigationController = [[UINavigationController alloc] initWithRootViewController:modalView];
    modalNavigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:modalNavigationController animated:YES completion:nil];
}

@end
