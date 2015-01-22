//
//  ViewController.h
//  arrometer
//
//  Created by Yuki.F on 2015/01/03.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SignUpViewController.h"
#import <CoreLocation/CoreLocation.h>



@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIScrollViewDelegate,CLLocationManagerDelegate>{
    
    IBOutlet UITableView *table;
    
    //セルの数
    int cellNum;
    
    //友達の名前の配列
    NSMutableArray *friends;
    

    //画面サイズの取得
    UIScreen *sc;
    
    //ステータスバーを除いたサイズ
    CGRect rect;
   
    //タップした時のフィルター
    UIView * filterView;
    
    UIButton *fukidasi;
    
    //ユーザー追加するためのテキストフィールド
    UITextField *addUser;
    

    //GPS用
    CLLocationManager *locationManager;
    float myLatitude;
    float myLongitude;
    
    //sample東京タワーの緯度経度
    float ttLatitude;
    float ttLongitude;
    
    //距離を示すラベル
    UILabel *meterLabel;
    int intDis;
}



@end

