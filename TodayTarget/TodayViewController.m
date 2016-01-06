//
//  TodayViewController.m
//  TodayTarget
//
//  Created by colorful-ios on 16/1/6.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "TodayViewController.h"
#import "TodayCell.h"
#import <NotificationCenter/NotificationCenter.h>



@interface TodayViewController () <NCWidgetProviding,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong)NSArray *imgArray;


@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@property (weak, nonatomic) IBOutlet UIButton *btn3;




- (IBAction)girlClick:(UIButton *)sender;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.uqian.me.WidgetDemo"];
    
    self.imgArray = [shared objectForKey:@"send"];
    
    [self.collectionView registerClass:[TodayCell class] forCellWithReuseIdentifier:@"TodayCell"];



}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TodayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TodayCell" forIndexPath:indexPath];
//    cell.todayImg.image = [UIImage imageNamed:self.imgArray[indexPath.row]];
    
    UIImageView *iV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    iV.image =[UIImage imageNamed:self.imgArray[indexPath.row]];
    [cell.contentView addSubview:iV];
    
    return cell;
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return  UIEdgeInsetsZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.uqian.me.WidgetDemo"];
    [shared setObject:@{@"message":[NSString stringWithFormat:@"%ld.jpg",(indexPath.row)%4 +1]} forKey:@"callback"];
    
    [shared synchronize];
    
    [self.extensionContext openURL:[NSURL URLWithString:@"TodayTest://test=0909"] completionHandler:^(BOOL success) {
        
    }];
}

@end

