//
//  SignUpViewController.h
//  arrometer
//
//  Created by Yuki.F on 2015/01/05.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ViewController.h"

PFUser *user;


@interface SignUpViewController : UIViewController<UITextFieldDelegate>{
    
    
    IBOutlet UITextField *userName;
    IBOutlet UITextField *pass;
}

-(IBAction)send;

@end
