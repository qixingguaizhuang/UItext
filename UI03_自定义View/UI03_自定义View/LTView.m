//
//  LTView.m
//  UI03_自定义View
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "LTView.h"

@implementation LTView

// 属性要dealloc


- (void)dealloc{


    [_labelOfLeft dealloc];
    
    [_textFieldOfRight dealloc];
    
    [super dealloc];


}


// 因为 LTView 类在外部使用时,使用父类 initwithframe : 方法初始化,因此重写这个方法,目的:创建两个子控件.

- (instancetype)initWithFrame:(CGRect)frame {


    self = [super initWithFrame:frame];
    
    if(self){
    
    //创建子视图 相对大小
        
        self.labelOfLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/3, frame.size.height )];
        
        
        // 子视图添加父类视图上
        
        [self addSubview:self.labelOfLeft];
        
         self.labelOfLeft.backgroundColor = [UIColor cyanColor];
        
        // 文本居中
        
        self.labelOfLeft.textAlignment = NSTextAlignmentCenter;
        
        [_labelOfLeft release];
        
      
        
        self.textFieldOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width * 2 / 3, frame.size.height)];
        
        
        // 子视图添加到父类
        
        [self addSubview:self.textFieldOfRight];
        
//      self.textFieldOfRight.backgroundColor = [UIColor yellowColor];
        
        // 字体居中
        
        self.textFieldOfRight.textAlignment = NSTextAlignmentCenter;
        
        [_textFieldOfRight release];
        
        self.textFieldOfRight.borderStyle = UITextBorderStyleRoundedRect;
    
    
    
    }


    return self;

}














/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
