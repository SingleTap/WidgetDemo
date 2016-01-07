//
//  Custom_StatusBar.m
//  WidgetDemo
//
//  Created by colorful-ios on 16/1/7.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "Custom_StatusBar.h"

@implementation Custom_StatusBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelStatusBar + 1.0f;
        self.frame = [UIApplication sharedApplication].statusBarFrame;
        self.backgroundColor = [UIColor greenColor];
        
        _statusMsgLabel = [[UILabel alloc] initWithFrame:self.frame];
        _statusMsgLabel.backgroundColor = [UIColor clearColor];
        _statusMsgLabel.textColor = [UIColor whiteColor];
        _statusMsgLabel.font = [UIFont systemFontOfSize:10.0f];
        _statusMsgLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_statusMsgLabel];
    }
    return self;
}

- (void)showStatusMessage:(NSString *)message andShowTime:(CGFloat)time
{
    self.hidden = NO;
    self.alpha = 1.0f;
    _statusMsgLabel.text = @"";
    
    CGSize totalSize = self.frame.size;
    CGSize totalSize1 = CGSizeMake(totalSize.width+1, totalSize.height);
    
    self.frame = (CGRect){ self.frame.origin, totalSize };
    //
    [UIView animateWithDuration:time animations:^{
        self.frame = (CGRect){ self.frame.origin, totalSize1};
        _statusMsgLabel.text = message;
        
        
        CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];//在这里@"transform.rotation"==@"transform.rotation.z"
        NSValue *value1 = [NSNumber numberWithFloat:0.5];
        NSValue *value2 = [NSNumber numberWithFloat:1];
        NSValue *value3 = [NSNumber numberWithFloat:0.5];
        anima.values = @[value1,value2,value3];
        anima.repeatCount = MAXFLOAT;
        anima.duration = 1;
        anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.layer addAnimation:anima forKey:@"shakeAnimation"];
        
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

- (void)hide
{
    self.alpha = 1.0f;
    
    [UIView animateWithDuration:0.5f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished){
        _statusMsgLabel.text = @"";
        self.hidden = YES;
    }];;
}
@end
