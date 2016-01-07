//
//  Custom_StatusBar.h
//  WidgetDemo
//
//  Created by colorful-ios on 16/1/7.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Custom_StatusBar : UIWindow
@property (nonatomic,strong)UILabel *statusMsgLabel;
- (void)showStatusMessage:(NSString *)message andShowTime:(CGFloat)time;

- (void)hide;
@end
