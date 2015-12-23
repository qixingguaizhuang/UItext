//
//  ViewController.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"

#import "TouchView.h"

#import "MoveView.h"


// 宏定义

#define WIDTH self.view.frame.size.width

#define HEIGHT self.view.frame.size.height

#define WHITE [UIColor whiteColor]

@interface ViewController () <touchViewDelegate> // 代理

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   self.view.backgroundColor = WHITE;
    
    // 触摸事件 调入方法
   
    [self touchEvent];
    [self moveView];
    
    
}



#pragma mark --  知识点 1 事件 (UIEvent)

/*
 *UIEvent 有三种事件: 触摸 (UITouch), 摇晃, 远程控制.
 
 *本节课重点是 触摸事件

 */

#pragma mark --- 知识点 2 触摸


- (void)touchEvent{


/*
 
 * 触摸,就是硬件能感应到 手指 触摸屏幕.
 
 * 重点是:触摸之后的操作.(重写 Touch 相关的方法) [开始触摸. 触摸移动. 触摸结束]
 
 */

    //创建一个自定义 View 对象(TouchView)
    
    TouchView *viewTouch = [[TouchView alloc]initWithFrame:CGRectMake(50,  50, WIDTH - 100, 50)];
    
    viewTouch.backgroundColor = [UIColor redColor];

    [self.view addSubview:viewTouch];
    
    [viewTouch release];
    
    viewTouch.delegate = self;
    
    // vc 成了 touchview 的代理人; touchView 的代理人是 vc
    
    // touchView 中本身有的方法功能声明,自己不想实现,而 vc 正需要这个功能,所以通过touchview 的代理现在让 vc 去实现, vc可以进行 touchview 的方法,例如 touchview 中有一个变换颜色的代理,现在, vc 想要点击更换 颜色,那么 vc 就签订协议,实现了变红的方法,前提要签协议,指定协议人(当前对象)

}


// 点击红色区域换颜色

- (void)changeColor{

    self.view.backgroundColor = [UIColor grayColor];

}

// 点击红色区域

- (void)changeColorAgain{

    self.view.backgroundColor = [UIColor yellowColor];

}


#pragma mark - 点击空白区域,回收键盘 触摸结束

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@" controller 响应触摸结束");
    
     // 解除 view 上得所有第一响应
    
    [self.view endEditing:YES];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@" controller 响应开始触摸");

}



#pragma mark -- 知识点 3 控件随着手指移动

//创建一个 move 对象

- (void)moveView{


    MoveView *viewMove = [[MoveView alloc]initWithFrame:CGRectMake(50, 120, 50, 50)];
    
    viewMove.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:viewMove];
    
    [viewMove release];

    
    viewMove.tag = 100;

}

//vc 触发移动

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@" controller 响应移动 ");
    
    // 从参数 touches里面获取 UITouch 的对象(手指);
    UITouch *t = [touches anyObject]; // NSSet<UITouch *>  是个集合,从中取出手指对象
    
    // 获取 touch 对象在 view 上得坐标 cg 结构体,相当于 int 不需要 *
    
    CGPoint point = [t locationInView:self.view];
    
    NSLog(@"%f , %f", point.x, point.y);
    
    
    // 使 moveView 的中心点和手指的坐标点一样
    
    
    // 拖动了
    
    MoveView *view = [self.view viewWithTag:100];// vc 上找到 tag 这张图
    
  //  view.center = point; 坐标点赋值给 vc 上得 view , moveView 由于作用域的问问难题,所以用 tag 标记一下,现在 vc 上得 view 是 "view" == moveView
    
    //判断 位置 碰到它后才会移动,点到 view 上才会移动
    
    
    if (t.view == view) {
        
       view.center = point;

    }

}


#pragma mark -- 知识点 4 响应者链

// UIResponder 类 (响应者类)

// UIResponder 是个抽象类;不能用抽象类直接创建对象,需要用它的子类创建对象.

// UIApplication, UIView, UIViewController 等都是他的子类

// 响应者链就是由 UIResponder 子类对象,组成的图层关系,最重要作用是判断谁来响应




















#pragma mark -- 知识点

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
