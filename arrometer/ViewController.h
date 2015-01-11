//
//  ViewController.h
//  arrometer
//
//  Created by Yuki.F on 2015/01/03.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>



@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    IBOutlet UITableView *table;
    
    //登録している友達の数
    int friendNum;
    
    //友達の名前の配列
    NSMutableArray *friends;
    

    //画面サイズの取得
    UIScreen *sc;
    
    //ステータスバーを除いたサイズ
    CGRect rect;
   
    //タップした時のフィルター
    UIView * filterView;
    
    UIButton *fukidasi;
}



@end

