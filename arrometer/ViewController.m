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
    NSString *ex1 = @"YUKI";
    [friends addObject:ex1];
    NSString *ex2 = @"KYABE";
    [friends addObject:ex2];
    NSString *ex3 = @"SINJI";
    [friends addObject:ex3];
    NSString *ex4 = @"ABE";
    [friends addObject:ex4];
    NSString *ex5 = @"MADO";
    [friends addObject:ex5];
    NSString *ex6 = @"HARAPPA";
    [friends addObject:ex6];
    NSString *ex7 = @"SHIMPEI";
    [friends addObject:ex7];
    NSString *ex8 = @"ONJI";
    [friends addObject:ex8];
    NSString *ex9 = @"RIORIO";
    [friends addObject:ex9];
    NSString *ex10 = @"SHIRO";
    [friends addObject:ex10];
    
    
    friendNum = [friends count];

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
    return friendNum;
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
    myView.frame = CGRectMake(0, 0, 414, 110);
    myView.backgroundColor = [UIColor orangeColor];
    
    //myViewをcellに表示
    [cell.contentView addSubview:myView];
    
    //ラベル
    UILabel *friendLabel = [[UILabel alloc] init];
    friendLabel.frame = CGRectMake(120,18,280,80);
    friendLabel.text = [friends objectAtIndex:indexPath.row];
    friendLabel.font = [UIFont fontWithName:@"AxisStd-UltraLight" size:40.0];
    friendLabel.textColor = [UIColor whiteColor];
    [myView addSubview:friendLabel];

    
    
    return cell;
}


@end
