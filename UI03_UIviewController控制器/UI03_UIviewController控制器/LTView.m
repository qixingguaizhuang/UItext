//
//  LTView.m
//  UI03_UIviewController控制器
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "LTView.h"

@implementation LTView


// 重写初始化方法


- (instancetype)initWithFrame:(CGRect)frame{


    self = [super initWithFrame: frame];
    
    if (self) {
        self.labelOFleft = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
        
        [self addSubview:self.labelOFleft];
        
        [_labelOFleft release];
        
        
        
        self.textFieldOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width * 2 / 3, frame.size.height)];
        
        [self addSubview:self.textFieldOfRight];
        
        [_textFieldOfRight release];
        
        
        self.textFieldOfRight.borderStyle = 3;//枚举 圆边
        
        
    }


    return self;
}


- (void)dealloc{
    
    [_textFieldOfRight release];
    
    [_labelOFleft release];

    [super dealloc];

}


@end
