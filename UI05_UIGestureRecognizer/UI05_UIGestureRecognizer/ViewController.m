//
//  ViewController.m
//  UI05_UIGestureRecognizer
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 延展两个类

@property (nonatomic, retain) UIImageView *imageView;

@property (nonatomic, assign) BOOL isBig;// 属性默认零

@end

@implementation ViewController


-(void)dealloc{
    [_imageView release];
    [super dealloc];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    [self creatImageView];
    
    [self tap];//轻拍
    
    [self LongPress];//长按
    
    [self swip];//扫
    
    [self screenEdge];//边界
    
    [self pan];
    
    [self pinch];//捏
    
    [self rotation];//旋转
    
}

// 方法

- (void)creatImageView{
    

    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star.jpg"]];
    
    self.imageView.frame = CGRectMake(0, 0, 200,200);
    
    self.imageView.center = self.view.center;
    
    [self.view addSubview: self.imageView];
    
    [_imageView release];
    
    // 开启 imageView 用户交互

    self.imageView.userInteractionEnabled = YES;
    
 
}



#pragma mark - 知识点 1 UIGestureRecognizer


/*
 
 *UIGestureRecognizer 手势识别器类
 
 *它是抽象类,不能直接创建对象,是用他的子类创建对象.
 
 *7 个子类 ---> API : UIGestureRecognizer
 
 *第一步: initWithTarget: action: 创建对象
 
 *第二步: 设置相应的参数属性;
 
 *第三步: 将手势添加到视图上;
 
 *第四步: 实现 action 方法;
 
 */

#pragma mark - 知识点 2 : 轻拍手势

- (void)tap{

    //创建对象
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    //2.设置相关的参数属性(API) 轻拍限制几次 对象的属性
    
    
    tap.numberOfTapsRequired = 2;

    //3.添加到视图上
   
    [self.imageView addGestureRecognizer:tap];

    [tap release];

}

//4.实现 action 方法

- (void)tapAction:(UITapGestureRecognizer *) tap{
    

    // isBig 属性初始值为 0 假 所以双击变大
    

    if (self.isBig) { // 0
    // 小
        [UIView animateWithDuration:0.25 animations:^{
            //更改 frame 属性
//            self.imageView.frame = CGRectMake(0, 0, 200, 200);
//            self.imageView.center = self.view.center;
       
//            // 更改transform 属性
//            //放大
    tap.view.transform = CGAffineTransformScale(tap.view.transform,1.5, 1.5);
        
    tap.view.transform = CGAffineTransformRotate(tap.view.transform, M_PI );
            
        }];
    }else{ // 1
    
        // 放大
        [UIView animateWithDuration:0.25 animations:^{
            self.imageView.frame = CGRectMake(0, 0, 300, 300);
            self.imageView.center = self.view.center;
        }];
    }
 
    // 状态取反 属性开始 isbig 为 0 ,取反下次调用双击 isbig 是 1 进入方法 由大变小
    
    self.isBig = !self.isBig;
 
}



#pragma mark - 知识点 3 : 长按手势


- (void)LongPress {
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressAction:)];
    [self.imageView addGestureRecognizer:longP];
    [longP release];

}
 //实现方法

- (void)pressAction:(UILongPressGestureRecognizer * ) longP{
   
    // 开始状态 长按
    if (longP.state == UIGestureRecognizerStateBegan) {

        NSLog(@"dd");
    }

}


// UIMenuController

//UIMenuItems

#pragma mark - 知识点 4 : 轻扫手势

- (void)swip {

//1.创建对象
    
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    [self.view addGestureRecognizer:swip];
    [swip release];
    // 清扫
    swip.direction = UISwipeGestureRecognizerDirectionRight;
}

- (void)swipAction:(UISwipeGestureRecognizer *) swip{
    
    // 原点 origin
    if (self.view.frame.origin.x == 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.view.frame = CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
        
        // 接收向左滑动的信号,所以向所滑动会回归 (默认向左触发)
        
        swip.direction = UISwipeGestureRecognizerDirectionLeft;
        
    }else{
        
        [UIView animateWithDuration: 0.25 animations:^{
            
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);}];
        swip.direction = UISwipeGestureRecognizerDirectionRight;
    }
}


#pragma mark - 知识点 5 : 屏幕边缘拖动



- (void)screenEdge{

    UIScreenEdgePanGestureRecognizer *screen = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdegAction:)];
    
    [self.view addGestureRecognizer:screen];
    
    [screen release];

// 屏幕边缘方向设置 边缘 edges
    screen.edges = UIRectEdgeRight;

}

- (void)screenEdegAction:(UIScreenEdgePanGestureRecognizer *)screenEdeg{
   
    NSLog(@"12");

}


#pragma mark - UIView 一个重要属性: transForm

// 作用: transform 主要实现:移动, 缩放, 旋转.

// UIView 的 transForm 属性, 类型 :CGAffineTransform

// CGAffineTransform ,仿射 (几何).系统提供了方便的 API .进行仿射的计算




#pragma mark - 知识点 6 : 拖动手势 pan

// 手势

- (void)pan {

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView addGestureRecognizer:pan];
    [pan release];

}

// 拖动 + alt
- (void)panAction: (UIPanGestureRecognizer *) pan{

   NSLog(@"ddd");
    
    // 更改 self.imageView.transform == pan.view.transForm 属性
    
   CGPoint point =  [pan translationInView:pan.view];
    
    NSLog(@"%@", NSStringFromCGPoint(point));

    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, point.y);

    // 参考点归零 CGPointZero 坐标归零
    
    [pan setTranslation: CGPointZero inView:pan.view];

}


#pragma mark - 知识点 7 : 捏合手势(缩放)


- (void)pinch {
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
 
    [self.imageView addGestureRecognizer:pinch];
    
    [pinch release];

}

- (void)pinchAction:(UIPinchGestureRecognizer *)pinch{


// 修改 self.imageView 的tranform 属性
    NSLog(@"%f", pinch.scale);// 浮点型
    
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);


//  缩放因子 归一
    pinch.scale = 1;

}



#pragma mark - 知识点 8 : 旋转手势


- (void)rotation{


    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    
    [self.imageView addGestureRecognizer:rotation];
    
    [rotation release];

}

// 旋转方法

- (void) rotationAction:(UIRotationGestureRecognizer *) rotation{

//更改 self.imageView 的 transform 属性
    
rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);


//弧度归零
    
    rotation.rotation = 0;


}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
