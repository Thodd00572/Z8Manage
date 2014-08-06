//
//  ZMLoginViewController.h
//  Z8Management
//
//  Created by ThoDD1 on 8/6/14.
//  Copyright (c) 2014 FPT Software HoChiMinh. All rights reserved.
//

#import "ZMBaseViewController.h"

@interface ZMLoginViewController : ZMBaseViewController

#pragma mark - IBOutlet
@property (weak, nonatomic) IBOutlet UITextField *txtAccount;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

#pragma mark - IBAction
- (IBAction)didPressBtnLogin:(id)sender;
- (IBAction)didPressBtnForgot:(id)sender;


@end
