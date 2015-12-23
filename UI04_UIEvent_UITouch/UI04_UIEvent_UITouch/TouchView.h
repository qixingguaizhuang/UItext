//
//  TouchView.h
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import <UIKit/UIKit.h>

// 写个协议

@protocol touchViewDelegate <NSObject>

- (void)changeColor;

- (void)changeColorAgain;

@end



@interface TouchView : UIView

@property (nonatomic, retain) UITextField *text;

//设置一个代理属性
@property (nonatomic, assign) id<touchViewDelegate> delegate;

@end
