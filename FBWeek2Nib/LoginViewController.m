//
//  LoginViewController.m
//  FBWeek2Nib
//
//  Created by Joseph Anderson on 4/4/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (void)textFieldDidChange:(UITextField *)textField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *signupForFacebookLabel;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

- (IBAction)tapLoginButton:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
        
    }
    return self;
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration delay:0.0 options:(animationCurve << 16) animations:^{
        self.signupForFacebookLabel.frame = CGRectMake(self.view.frame.size.width/2 - self.signupForFacebookLabel.frame.size.width/2, self.view.frame.size.height - kbSize.height - self.signupForFacebookLabel.frame.size.height - 10.0f, self.signupForFacebookLabel.frame.size.width, self.signupForFacebookLabel.frame.size.height);
//        self.emailTextField.frame = CGRectMake(15, self.view.frame.size.height - kbSize.height - self.emailTextField.frame.size.height, self.emailTextField.frame.size.width, self.emailTextField.frame.size.height);
//        self.passwordTextField.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.passwordTextField.frame.size.height, self.passwordTextField.frame.size.width, self.passwordTextField.frame.size.height);
    } completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSLog(@"Hiding keyboard");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if (![[touch view] isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // *****************************************************************
    // How to just apply this to one class so I can target multiple text fields
    [self.emailTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordTextField.secureTextEntry = YES;
    
    //Activity Indicator for login
    self.indicatorView.hidden = YES;
}

- (void)textFieldDidChange:(UITextField *)textField {
    if (self.emailTextField.text.length && self.passwordTextField.text.length > 0) {
        self.loginButton.enabled = YES;
    } else {
        self.loginButton.enabled = NO;
    }
}

- (IBAction)tapLoginButton:(id)sender {
    [self.indicatorView startAnimating];
    self.indicatorView.hidden = NO;
    [self performSelector:@selector(checkPasswordSubmission) withObject:nil afterDelay:2];

}

- (void)checkPasswordSubmission {
    if ([self.passwordTextField.text isEqualToString:@"password"]) {
        NSLog(@"Correct password");
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [self.indicatorView stopAnimating];
        self.indicatorView.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
