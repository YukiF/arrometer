//
//  SignUpViewController.m
//  arrometer
//
//  Created by Yuki.F on 2015/01/05.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    userName.delegate = self;
    pass.delegate = self;
    userName.textAlignment = NSTextAlignmentCenter;
    pass.textAlignment = NSTextAlignmentCenter;
    userName.placeholder = @"USER";
    pass.placeholder = @"PASSWORD";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [userName resignFirstResponder];
    [pass resignFirstResponder];
    
    return YES;
}

-(IBAction)send{
    NSLog(@"%@",userName.text);
    NSLog(@"%@",pass.text);

    
    
    
    
    //Signing up
    PFUser *user = [PFUser user];
    user.username = userName.text;
    user.password = pass.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeede, NSError *error){
        if(!error){
            
            //success
            ViewController *ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
            [self presentViewController:ViewController animated:YES completion:nil];

        }
        
    }];
    
    
    
}

@end
