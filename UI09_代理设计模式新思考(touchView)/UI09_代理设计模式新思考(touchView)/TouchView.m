//
//  TouchView.m
//  UI09_代理设计模式新思考(touchView)
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
        [self.delegate beginClick];

}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if ([self.delegate respondsToSelector:@selector(didClic)]) {
        [self.delegate didClic];
    }

    //[self.delegate didClic]; 上面这句话这样判断避免报错

}




@end
