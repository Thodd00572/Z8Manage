//
//  ZMLoginViewController.m
//  Z8Management
//
//  Created by ThoDD1 on 8/6/14.
//  Copyright (c) 2014 FPT Software HoChiMinh. All rights reserved.
//

#import "ZMLoginViewController.h"
#import "ZMAPIClient.h"
#import "ZMHomeViewController.h"


@interface ZMLoginViewController () <UITextFieldDelegate>

@end

@implementation ZMLoginViewController

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
    // Do any additional setup after loading the view from its nib.
    
    // Setup view
    [self setupView];
}

- (void)setupView
{
    [_txtPassword setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Execute go button
    if (textField == _txtPassword)
    {
        [self didPressBtnLogin:_txtPassword];
    }
    
    if (textField == _txtAccount)
    {
        [_txtPassword becomeFirstResponder];
    }
    
    return YES;
}

#pragma mark - IBAction

- (IBAction)didPressBtnLogin:(id)sender {

    // 1. Validate input
    if ( [self isValidatedInput])
    {
        // 2. Process login
        [self login];
    }
}

- (IBAction)didPressBtnForgot:(id)sender {
}

#pragma mark - Validation
-(BOOL)isValidatedInput
{
    return YES;
}

#pragma mark - API Connect
- (void)login
{
    // Call login API to login into system
    
    [[ZMAPIClient sharedClient] loginWithUserName:_txtAccount.text
                                         password:_txtPassword.text
                                  completionBlock:^(NSDictionary *userInfo, NSError *error) {
       if (error)
       {
           // Show alert
       }
        else
        {
            // Continue to home screen
            ZMHomeViewController* homeVC = [[ZMHomeViewController alloc] initWithNibName:@"ZMHomeViewController" bundle:nil];
            [self presentViewController:homeVC animated:YES completion:nil];
        }
    }];
}
@end
