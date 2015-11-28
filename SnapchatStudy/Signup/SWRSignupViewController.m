//
//  SWRSignupViewController.m
//  SnapchatStudy
//
//  Created by Weiran Shi on 2015-11-08.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

#import "SWRSignupViewController.h"

@interface SWRSignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation SWRSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.userNameText becomeFirstResponder];
    
    [self addSignUpButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setNavigationBar];
}

- (void)setNavigationBar
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    UIButton *backButton = [[UIButton alloc] init];
    [backButton setImage:[UIImage imageNamed:@"Back_Button_black"] forState:UIControlStateNormal];
    backButton.bounds = CGRectMake(0, 0, 15, 20);
    [backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    [UINavigationBar customizedBarWithViewController:self backgroundColor:[UIColor whiteColor] textColor:tintPurpleColor title:@"注册" leftButton:leftButtonItem rightButton:nil];
    
}

- (void)clickBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addSignUpButton
{
    UIButton *signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(0, screenH * 0.4, screenW, 50)];
    signUpButton.backgroundColor = tintGreenColor;
    [signUpButton setTitle:@"注册" forState:UIControlStateNormal];
    [signUpButton addTarget:self action:@selector(clickSignUpButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpButton];
}

- (void)clickSignUpButton
{
    PFUser *user = [PFUser user];
    user.username = self.userNameText.text;
    user.password = self.passwordText.text;
    
    //do it in asynchronous way
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"signup2Conversations" sender:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            MyLog(@"signup error: %@", errorString);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"请稍后再试:-D" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
