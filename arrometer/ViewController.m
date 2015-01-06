//
//  ViewController.m
//  arrometer
//
//  Created by Yuki.F on 2015/01/03.
//  Copyright (c) 2015年 Yuki Futagami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    table.delegate = self;
    table.dataSource = self;
    
    //友達の名前の配列
    friends = [[NSMutableArray alloc] init];
    NSString *ex1 = @"GAMI";
    [friends addObject:ex1];
    NSString *ex2 = @"BANNAROT";
    [friends addObject:ex2];
    NSString *ex3 = @"FABIO";
    [friends addObject:ex3];
    NSString *ex4 = @"KYSER";
    [friends addObject:ex4];
    NSString *ex5 = @"POLO";
    [friends addObject:ex5];
    NSString *ex6 = @"OZKUN";
    [friends addObject:ex6];
    NSString *ex7 = @"THIBAULT";
    [friends addObject:ex7];
    NSString *ex8 = @"DORENTINA";
    [friends addObject:ex8];
    NSString *ex9 = @"MARCO";
    [friends addObject:ex9];
    NSString *ex10 = @"JULIANA";
    [friends addObject:ex10];
    
    //画面サイズの取得
    sc = [UIScreen mainScreen];
    //ステータスバーを除いたサイズ
    rect = sc.applicationFrame;
    //境界線を消す
    table.separatorColor = [UIColor clearColor];
        
    //UIViewクラスのfilterViewを生成
    filterView = [[UIView alloc] init];
    filterView.frame = CGRectMake(0, 0, rect.size.width,1000);
    filterView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    [self.view addSubview:filterView];
    
    //circleの表示
    UIImage *circle = [UIImage imageNamed:@"circle.png"];
    UIImageView *circlePic = [[UIImageView alloc]initWithImage:circle];
    circlePic.frame = CGRectMake(0,0,rect.size.width/4*3,rect.size.width/4*3);
    circlePic.center = CGPointMake(rect.size.width/2, rect.size.height/5*3);
    [filterView addSubview:circlePic];
    
    //arrowの表示
    UIImage *arrow = [UIImage imageNamed:@"arrow.png"];
    UIImageView *arrowPic = [[UIImageView alloc]initWithImage:arrow];
    arrowPic.frame = CGRectMake(0,0,rect.size.width/6,rect.size.width/2);
    arrowPic.center = CGPointMake(rect.size.width/2, rect.size.height/5*3);
    [filterView addSubview:arrowPic];
    
    //距離を示すラベル
    UILabel *meterLabel = [[UILabel alloc] init];
    meterLabel.frame = CGRectMake(160,8,rect.size.width,rect.size.width/4);
    meterLabel.center = CGPointMake(rect.size.width/2,rect.size.width/5*2);
    meterLabel.text = @"3000m";
    meterLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:80.f];
    meterLabel.textColor = [UIColor colorWithRed:0.11373 green:0.29412 blue:0.61961 alpha:1.0];
    meterLabel.textAlignment = NSTextAlignmentCenter;
    [filterView addSubview:meterLabel];
    
    filterView.alpha = 0.0;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- テーブルビューに必要なメソッド
//セルにIDをつけるのは、どのセルを再利用して再度表示したいのかを教えるため

//セルの数を決めるメソッド
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [friends count];
}

//セルの作り方の設定と、セルの内容を決めるメソッド
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    /* -- cellに直接ラベルを載せれないので、UIViewを1クッション置く。 -- */
    //UIViewクラスのmyViewを生成
    UIView * myView = [[UIView alloc] init];
    
    //myViewの位置と大きさの指定
    myView.frame = CGRectMake(0, 0, rect.size.width, 110);
    myView.backgroundColor = [UIColor colorWithRed:0.08235 green:0.57647 blue:0.78039 alpha:1.0];
    //myViewをcellに表示
    [cell.contentView addSubview:myView];
    
    //画像を表示
    if (indexPath.row == 0) {
        UIImage *userBack = [UIImage imageNamed:@"userBack1.png"];
        UIImageView *userBackPic = [[UIImageView alloc]initWithImage:userBack];
        userBackPic.frame = CGRectMake(0,0,rect.size.width,110);
        [myView addSubview:userBackPic];
    }else if(indexPath.row == 1){
        UIImage *userBack = [UIImage imageNamed:@"userBack2.png"];
        UIImageView *userBackPic = [[UIImageView alloc]initWithImage:userBack];
        userBackPic.frame = CGRectMake(0,0,rect.size.width,110);
        [myView addSubview:userBackPic];
    }else if(indexPath.row == 2){
        UIImage *userBack = [UIImage imageNamed:@"userBack3.png"];
        UIImageView *userBackPic = [[UIImageView alloc]initWithImage:userBack];
        userBackPic.frame = CGRectMake(0,0,rect.size.width,110);
        [myView addSubview:userBackPic];
    }else if(indexPath.row == 3){
        UIImage *userBack = [UIImage imageNamed:@"userBack4.png"];
        UIImageView *userBackPic = [[UIImageView alloc]initWithImage:userBack];
        userBackPic.frame = CGRectMake(0,0,rect.size.width,110);
        [myView addSubview:userBackPic];
    }else if(indexPath.row == 4){
        UIImage *userBack = [UIImage imageNamed:@"userBack5.png"];
        UIImageView *userBackPic = [[UIImageView alloc]initWithImage:userBack];
        userBackPic.frame = CGRectMake(0,0,rect.size.width,110);
        [myView addSubview:userBackPic];
    }else if(indexPath.row == 5){
        UIImage *userBack = [UIImage imageNamed:@"userBack6.png"];
        UIImageView *userBackPic = [[UIImageView alloc]initWithImage:userBack];
        userBackPic.frame = CGRectMake(0,0,rect.size.width,110);
        [myView addSubview:userBackPic];
    }else{
        UIImage *userBack = [UIImage imageNamed:@"userBack7.png"];
        UIImageView *userBackPic = [[UIImageView alloc]initWithImage:userBack];
        userBackPic.frame = CGRectMake(0,0,rect.size.width,110);
        [myView addSubview:userBackPic];
    }
    //ラベル
    UILabel *friendLabel = [[UILabel alloc] init];
    friendLabel.frame = CGRectMake(160,8,rect.size.width,rect.size.width/4);
    friendLabel.center = CGPointMake(rect.size.width/2,55);
    friendLabel.text = [friends objectAtIndex:indexPath.row];
    friendLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:45.f];
    friendLabel.textColor = [UIColor whiteColor];
    friendLabel.textAlignment = NSTextAlignmentCenter;
    [myView addSubview:friendLabel];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"Yuki"] = @"Futagami";
//    [testObject saveInBackground];
    
    // cellがタップされた際の処理
    [UIView animateWithDuration:0.5f
                     animations:^{
                         // アニメーションをする処理
                         filterView.alpha = 1.0;
                     }];
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // タッチされたときの処理
    if (filterView.alpha == 1.0) {
        [UIView animateWithDuration:0.5f
                         animations:^{
                             // アニメーションをする処理
                             filterView.alpha = 0.0;
                         }];
    }
}

@end
