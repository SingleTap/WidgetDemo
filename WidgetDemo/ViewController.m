//
//  ViewController.m
//  WidgetDemo
//
//  Created by colorful-ios on 16/1/6.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *showIMG;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadIMG:) name:@"reloadIMG" object:nil];



}
- (void)reloadIMG:(NSNotification*)message{

    NSString *imgName = message.object[@"message"];
    
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"1.jpg" ofType:nil];
    
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imgName]];
    
    self.showIMG.image = img;
    
//    CGFloat imgWidth  = img.size.width;
//    CGFloat imgHeight = img.size.height;
//
//    
//    self.wid.constant    = img.size.width;
//    self.height.constant = img.size.height;

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
