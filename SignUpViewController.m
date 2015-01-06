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

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    // 最大入力文字数
//    int maxInputLength = 12;
//    
//    // 入力済みのテキストを取得
//    NSMutableString *str1 = [userName.text mutableCopy];
//    
//    // 入力済みのテキストと入力が行われたテキストを結合
//    [str1 replaceCharactersInRange:range withString:string];
//    
//    if ([str1 length] > maxInputLength) {
//        // ※ここに文字数制限を超えたことを通知する処理を追加
//        UIAlertView *Alert3 = [[UIAlertView alloc]initWithTitle:@"登録できません。" message:@"12文字以内にしてください。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//        [Alert3 show];
//        
//        return NO;
//    }
//    // 入力済みのテキストを取得
//    NSMutableString *str2 = [pass.text mutableCopy];
//    
//    // 入力済みのテキストと入力が行われたテキストを結合
//    [str2 replaceCharactersInRange:range withString:string];
//    
//    if ([str2 length] > maxInputLength) {
//        // ※ここに文字数制限を超えたことを通知する処理を追加
//        UIAlertView *Alert4 = [[UIAlertView alloc]initWithTitle:@"登録できません。" message:@"12文字以内にしてください。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//        [Alert4 show];
//        
//        return NO;
//
//        
//        return NO;
//    }
//    return YES;
//}

//// テキストフィールドの入力値変更イベント
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *strNgWord = @"!\"\\#$%&'()@[]{}|^~=;: _?<>,/-*.";	// チェック対象の文字を複数定義
//    // 文字数チェック
//    if (12 < range.location + range.length + [string length]) {
//        // 文字数制限を超える場合は入力取り消し
//        return NO;
//    }
//    
//    // 無効な文字列が含まれていないかどうかチェック
//    for (int i=0; i<[strNgWord length]; i++) {
////        // チェック対象の文字を設定
////        NSString *strCk = [strNgWord substringWithRange:NSMakeRange(i, 1)];
//        // 入力値がNGワードと一致する場合
//        if ([string isEqual:userName.text] || [string isEqual:pass.text]) {
//            // 入力取り消し
//            return NO;
//        }
//    }
//    // 入力許可
//    return YES;
//}


-(IBAction)send{
    NSLog(@"%@",userName.text);
    NSLog(@"%@",pass.text);

    if ([userName.text length] == 0 || [pass.text length] == 0) {
        
        UIAlertView *Alert1 = [[UIAlertView alloc]initWithTitle:@"登録できません。" message:@"全ての空欄を埋めて下さい。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [Alert1 show];

        
    }else{
        
        //Signing up
        user = [PFUser user];
        user.username = userName.text;
        user.password = pass.text;
        [user signUpInBackgroundWithBlock:^(BOOL succeede, NSError *error){
            if(!error){
                
                //success
                ViewController *ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
                [self presentViewController:ViewController animated:YES completion:nil];
                
            }else{
                
                UIAlertView *Alert2 = [[UIAlertView alloc]initWithTitle:@"登録できません。" message:@"名前が重複しています。変更して下さい。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [Alert2 show];
            }
        }];
    }
}

@end
