//
//  RootViewController.m
//  UI03_UIviewController控制器
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "RootViewController.h"

#import "LTView.h"

@interface RootViewController ()<UITextFieldDelegate>

// 设置属性

@property (nonatomic, retain) UIImageView *imageViewBack;

@end

@implementation RootViewController


#pragma mark - 知识点1 viewController 生命周期问题

// viewController 生命周期  内存  UI

// viewController 第一个方法,初始化方法虽然前面调用的是 init 方法, 但无论采用何种初始化,都会调用此初始化方法

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   
    if (self) {
        
        NSLog(@"%s", __FUNCTION__);
    }

    return self;
}

// 第二种 加载视图, viewController 的 view 属性,要指定一个 view 对象.( vc 会自动创建一个view) 如果系统检测 view 属性没有指向一个 view 对象,系统会自动创建一个 view 对象.

- (void)loadView{

// 一定要调用父类方法
    
    [super loadView];
    
    NSLog(@"%s", __FUNCTION__);

}









// 视图加载完成 TINAJI

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s", __FUNCTION__);
    
    // 添加背景图片
    
    self.imageViewBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq.jpg"]];
    
    self.imageViewBack.frame = self.view.frame;
    
    [self.view addSubview:self.imageViewBack];
    
    [self.imageViewBack release];
    
    
    // 用户交互
    
    self.imageViewBack.userInteractionEnabled = YES;
    
    
    // 用户名
    
    LTView *viewOfUser = [[LTView alloc] initWithFrame:CGRectMake(50, 310, self.view.frame.size.width - 100, 40)];
    
    [self.imageViewBack addSubview:viewOfUser];
    
    viewOfUser.labelOFleft.text = @"用户名";
    
    viewOfUser.textFieldOfRight.placeholder = @"请输入用户名";
    
    [viewOfUser release];
    
    // 用户密码
    
    LTView *viewOFKey = [[LTView alloc] initWithFrame:CGRectMake(50, 355, self.view.frame.size.width - 100, 40)];
    
    
    [self.imageViewBack addSubview:viewOFKey];
    
    
    viewOFKey.labelOFleft.text = @"密码";
    
    viewOFKey.textFieldOfRight.placeholder = @"请输入密码";
    
    [viewOFKey release];
    
    
    //协议
    
    
    viewOfUser.textFieldOfRight.delegate = self;
    
    viewOFKey.textFieldOfRight.delegate = self;
    
    
}

// 实现协议方法

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    //背景向上移动
    
    //动画向上
    
    [UIView animateWithDuration:1 animations:^{
        
      self.imageViewBack.frame = CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
        
    }];
    
    //

    return YES;


}


// 将要返回 //问代理如果文本框应该处理按下返回键。

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    // 弹上去之后弹回
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.imageViewBack.frame = self.view.frame;
    }];

    // 第一响应 回收键盘 /通知接收器,它被要求放弃地位第一响应者的窗口。

    [textField resignFirstResponder];
    
   // [self.view  endEditing:YES];
    
    return YES;

}













//视图将要显示 appear

- (void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"%s", __FUNCTION__);
    
}

//视图已经显示

- (void)viewDidAppear:(BOOL)animated{

    NSLog(@"%s", __FUNCTION__);

}

// 视图将要消失
- (void)viewWillDisappear:(BOOL)animated{
   
    NSLog(@"%s", __FUNCTION__);

}

// 视图已经消失


- (void)viewDidDisappear:(BOOL)animated{


    NSLog(@"%s", __FUNCTION__);

}

// ViewController 可以检测到系统内存不足的警告,在此方法中,要释放适当内存

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
