//
//  TouchView.h
//  UI09_代理设计模式新思考(touchView)
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchViewDelegate <NSObject>

- (void)beginClick;

- (void)didClic;

@end

@interface TouchView : UIView


@property (nonatomic, assign) id<TouchViewDelegate> delegate;


@end
