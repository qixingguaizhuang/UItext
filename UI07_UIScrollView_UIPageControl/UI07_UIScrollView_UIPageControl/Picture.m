//
//  Picture.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "Picture.h"


//1. 写延展

@interface Picture () <UIScrollViewAccessibilityDelegate>

//2.两个控件属性(类里面的对象)
@property (nonatomic , retain) UIScrollView *Scroll;

@property (nonatomic, retain)  UIPageControl *page;

//3.接收数组的属性
@property (nonatomic, retain) NSMutableArray *arrImages;

@end

@implementation Picture

- (void)dealloc{
    
    [_Scroll dealloc];
    
    [_page dealloc];
    
    [_arrImages dealloc];
    
    [super dealloc];
    
}

- (instancetype)initWithFrame:(CGRect)frame images: (NSArray *)images{

    self = [super initWithFrame: frame];
    
    if (self) {
        
        //3.用到属性,写数组,上面
        self.arrImages = [NSMutableArray arrayWithArray:images];
        
        //子控件的创建
        [self creatScrollWithFrame:frame];
        
        [self CreatePageViewWithFrame:frame];

    }

    return self;

}




#pragma mark - UIScrollView

//子控件 上
- (void)creatScrollWithFrame:(CGRect)frame{
    
    //1.创建对象
    
    self.Scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    self.Scroll.backgroundColor = [UIColor blackColor];

    [self addSubview:self.Scroll];
    
    [_Scroll release];
    
    //2.设置 contentSize 滚动页面范围
    
    self.Scroll.contentSize = CGSizeMake(frame.size.width * self.arrImages.count, frame.size.height) ;
    
    //3.scrollView 上面添加照片 imageView对象;
    
    [self createImageViewWithFram:frame];
    
    //开启翻页效果.
    
    self.Scroll.pagingEnabled = YES;
    
    // 到边缘是否有回弹效果
    
    self.Scroll.bounces = YES;
    
    // 指定代理人 .. 系统自带的代理
    
    self.Scroll.delegate = self;
    
    // 设置缩放比例
    
    self.Scroll.minimumZoomScale = 0.5;
    
    self.Scroll.maximumZoomScale = 2;


}


// imageView --->> image-->>图片加到 scroll 上

- (void)createImageViewWithFram:(CGRect)frame{

    for (int i = 0; i < self.arrImages.count; i++) {
   
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arrImages[i]]];
        
        imageView.frame = CGRectMake(frame.size.width *i , 0, frame.size.width, frame.size.height);
        
        [self.Scroll addSubview: imageView];
        
        [imageView release];
    }

}


#pragma mark - UIScrollView 协议方法

// 当滑动内容视图时,调用此方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@"%s", __FUNCTION__);
    
    // 偏移量
    
    NSLog(@"%f", scrollView.contentOffset.x);

}

    // 当减速已经完成,调用此方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

   NSLog(@"%f",scrollView.contentOffset.x);
    
    //pagecontrol 的 currentPage 属性
  
    self.page.currentPage = scrollView.contentOffset.x /300;
    
    
//    if (scrollView.contentOffset.x == 0) {
//        
//        self.page.currentPage = 0;
//    
//    }else if (scrollView.contentOffset.x == 300){
//        
//        self.page.currentPage = 1;
//    
//    }else if(scrollView.contentOffset.x == 600){
//
//       self.page.currentPage = 2;
//
//}

}

// 返回一个要缩放的 view.

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return [scrollView.subviews firstObject];

}


#pragma mark - UIPageControl


- (void)CreatePageViewWithFrame:(CGRect)fram{

    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, fram.size.width / 2, 40)];

    self.page.center = CGPointMake(fram.size.width/2, fram.size.height - 20);

    [self addSubview:self.page];
    
    [_page release];
    
    //颜色
    self.page.backgroundColor = [UIColor clearColor];
    
    //API
    
    //页面数
    self.page.numberOfPages = self.arrImages.count;
    
    //添加事件
    [self.page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];

}



- (void)pageAction:(UIPageControl *)page{


    // 设置 scrollView 的偏移量  contentOffset.x 结构体只能用 结构体
    
    // self.Scroll.contentOffset = CGPointMake(page.currentPage*300, 0);
    
    // 带动画
    
    [self.Scroll setContentOffset:CGPointMake(page.currentPage * 300, 0) animated:YES];

}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
