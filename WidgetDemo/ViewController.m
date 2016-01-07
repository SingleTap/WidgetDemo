//
//  ViewController.m
//  WidgetDemo
//
//  Created by colorful-ios on 16/1/6.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "ViewController.h"

#import "Custom_StatusBar.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *showIMG;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadIMG:) name:@"reloadIMG" object:nil];
    


}

- (void)reloadIMG:(NSNotification*)message{

    CGFloat time = 5.0f;
    
    UIViewController *fir = [UIViewController new];
    
    Custom_StatusBar *bar =  [[Custom_StatusBar  alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    bar.rootViewController = fir;
    [bar showStatusMessage:@"载入中..." andShowTime:time];
    
    NSString *imgName = message.object[@"message"];

    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imgName]];
    
    self.showIMG.image = img;
    self.showIMG.alpha = 0;
    
    [UIView animateWithDuration:time animations:^{
        self.showIMG.alpha = 1;

    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

