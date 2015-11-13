//
//  SWRInputBoxController.m
//  SnapchatStudy
//
//  Created by Weiran Shi on 2015-11-12.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

#import "SWRInputBoxController.h"
#import "SWRInputBox.h"

@interface SWRInputBoxController ()

@property (nonatomic, strong) SWRInputBox *inputBox;

@end

@implementation SWRInputBoxController

- (SWRInputBox *)inputBox
{
    if (_inputBox == nil){
        _inputBox = [[SWRInputBox alloc] initWithFrame:CGRectMake(0, 0, screenW, navigationbarH)];
    }
    return _inputBox;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view = self.inputBox;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)resignFirstResponder
{
    MyLog(@"resign");
    [self.view endEditing:YES];
    return [super resignFirstResponder];
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
