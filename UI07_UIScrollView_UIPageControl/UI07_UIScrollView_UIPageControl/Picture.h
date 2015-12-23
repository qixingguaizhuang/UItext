//
//  Picture.h
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Picture : UIView

// 声明出来 Viewcontrol 能够调用

- (instancetype)initWithFrame:(CGRect)frame images: (NSArray *)images;

@end
