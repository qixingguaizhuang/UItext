//
//  TouchView.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView


- (void)dealloc{

    [_text release];
    
    [super dealloc];

}


// 写一个 field 重写 init 方法

- (instancetype)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.text = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2, frame.size.height)];
        
        //self.text.text = @"确定";
        
        self.text.placeholder = @"确定";
        
        // field 对齐
        
        self.text.textAlignment = 1;
        
        self.text.textColor = [UIColor purpleColor];
        
        [self addSubview:self.text];
        
        self.text.borderStyle = 3;
        
        [_text  release];
    }

    return self;
    
}


//重写 touch 相关方法

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"touchView 响应开始触摸");
    [self.delegate changeColorAgain];

}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"touchView 响应移动");
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@" touchView 响应 触摸结束");
    
    [self.delegate changeColor];
    
    
    
}















@end
