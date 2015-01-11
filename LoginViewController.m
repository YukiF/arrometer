//
//  LoginViewController.m
//  arrometer
//
//  Created by Yuki.F on 2015/01/08.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if( [ UIApplication sharedApplication ].isStatusBarHidden == NO ) {
        [ UIApplication sharedApplication ].statusBarHidden = YES;
    }
    
    
    //画面サイズの取得
    sc = [UIScreen mainScreen];
    //ステータスバーを除いたサイズ
    rect = sc.applicationFrame;
    
    //背景画像
    UIImage *haikei = [UIImage imageNamed:@"signUpLogin.png"];
    UIImageView *haikeiPic = [[UIImageView alloc]initWithImage:haikei];
    haikeiPic.frame = CGRectMake(0,0,rect.size.width,rect.size.height);
    [self.view addSubview:haikeiPic];
    
    userName = [[UITextField alloc] initWithFrame:CGRectMake(0,0,rect.size.width,rect.size.height/6.4)];
    pass = [[UITextField alloc] initWithFrame:CGRectMake(0,rect.size.height/6.4,rect.size.width,rect.size.height/6.4)];
    
    userName.background = [UIImage imageNamed:@"whiteEdge.png"];
    pass.background = [UIImage imageNamed:@"whiteEdge.png"];
    
    userName.delegate = self;
    pass.delegate = self;
    userName.textAlignment = NSTextAlignmentCenter;
    pass.textAlignment = NSTextAlignmentCenter;
    userName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"User Name" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor] ,}];
    pass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor] ,}];
    
    userName.font = [ UIFont fontWithName:@"AvenirNext-UltraLight" size:rect.size.height/16];
    pass.font = [ UIFont fontWithName:@"AvenirNext-UltraLight" size:rect.size.height/16];
    userName.textColor = [UIColor whiteColor];
    pass.textColor = [UIColor whiteColor];
    
    [self.view addSubview:userName];
    [self.view addSubview:pass];
    
    UIImage *img = [UIImage imageNamed:@"whiteEdge.png"];  // ボタンにする画像を生成する
    login =  [UIButton buttonWithType:UIButtonTypeCustom];
    login.frame = CGRectMake(0,rect.size.height/3.2,rect.size.width,rect.size.height/6.4);
    [login setBackgroundImage:img forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にsendメソッドを呼び出す
    [login addTarget:self
               action:@selector(toLogin:) forControlEvents:UIControlEventTouchUpInside];
    [login setTitle:@"Log In" forState:UIControlStateNormal ];
    login.titleLabel.font = [ UIFont fontWithName:@"AvenirNext-UltraLight" size:rect.size.height/16];
    [login setTitleColor:[ UIColor whiteColor ] forState:UIControlStateNormal ];
    [self.view addSubview:login];
    
    UIImage *img2 = [UIImage imageNamed:@"whiteEdge.png"];  // ボタンにする画像を生成する
    back =  [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0,rect.size.height/6.4*3,rect.size.width,rect.size.height/6.4);
    [back setBackgroundImage:img2 forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にsendメソッドを呼び出す
    [back addTarget:self
             action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [back setTitle:@"Back" forState:UIControlStateNormal ];
    back.titleLabel.font = [ UIFont fontWithName:@"AvenirNext-UltraLight" size:rect.size.height/16];
    [back setTitleColor:[ UIColor whiteColor ] forState:UIControlStateNormal ];
    [self.view addSubview:back];

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


-(void)toLogin:(UIButton*)button{
    NSLog(@"%@",userName.text);
    NSLog(@"%@",pass.text);
    
    [PFUser logInWithUsernameInBackground:userName.text password:pass.text block:^(PFUser *user, NSError *error) {
        // ログインに成功すると該当ユーザーのオブジェクトを取得することが出来る
        if (user) {
            // ログインに成功した場合
            //success
            ViewController *ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
            [self presentViewController:ViewController animated:YES completion:nil];
        } else {
            // ログインに失敗した場合
            UIAlertView *Alert2 = [[UIAlertView alloc]initWithTitle:@"ログインできません。" message:@"ユーザー名、又はパスワードが間違っています。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [Alert2 show];

        }
    }];
    
//    if ([userName.text length] == 0 || [pass.text length] == 0) {
//        
//        UIAlertView *Alert1 = [[UIAlertView alloc]initWithTitle:@"登録できません。" message:@"全ての空欄を埋めて下さい。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//        [Alert1 show];
//        
//        
//    }else{
//        
//        //Signing up
//        user = [PFUser user];
//        user.username = userName.text;
//        user.password = pass.text;
//        [user signUpInBackgroundWithBlock:^(BOOL succeede, NSError *error){
//            if(!error){
//                
//                //success
//                ViewController *ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
//                [self presentViewController:ViewController animated:YES completion:nil];
//                
//            }else{
//                
//                UIAlertView *Alert2 = [[UIAlertView alloc]initWithTitle:@"登録できません。" message:@"名前が重複しています。変更して下さい。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//                [Alert2 show];
//            }
//        }];
//    }
}


-(void)back:(UIButton*)button{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
