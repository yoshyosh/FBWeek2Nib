//
//  ModalViewController.m
//  FBWeek2Nib
//
//  Created by Joseph Anderson on 4/7/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textField;

@end

@implementation ModalViewController

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
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    //Best way to reveal keyboard? Felt a little slow on touch simulator
    [self.textField becomeFirstResponder];
}

-(void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
