//
//  AppDelegate.m
//  UI02_UIlabel_UITextFile_UIButten_UIImageView
//
//  Created by dllo on 15/12/15.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UITextFieldDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor grayColor];
    
    [self.window makeKeyAndVisible];
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    self.window.rootViewController = vc;
    
    
    // 函数下面写方法,
    
    [self labelview];
    
    [self labelkey];
    
    [self texFieldView];
    
    [self buttonView];
    
    
//    [self imageView];
    
    

    [_window release];
    
    [vc release];
    

    
    return YES;
}


#pragma makr - 知识点 1 : UILabel 标记


- (void)labelview{
    
    
    //1.创建对象
    
    UILabel *lableName = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 80, 40)];
    
    
    lableName.backgroundColor = [UIColor orangeColor];
    
    
    [self.window addSubview:lableName];
    
    [lableName release];
    
    
    // 常用 API
    
    
    lableName.text = @"用户名";
    
    // 文本颜色
    
    
    lableName.textColor = [UIColor blueColor];
    
    
    // 文本对齐  居中  Alignment 对齐
    
    lableName.textAlignment = NSTextAlignmentCenter;
    
    // 文本字体  UIFont 调研
    
    lableName.font = [UIFont systemFontOfSize:20];
    
    // 文本行数     0 是没有行数限制的,输入框不会限制行数
    
    lableName.numberOfLines = 3;
    
    // 文本断行和省略
    
    lableName.lineBreakMode = NSLineBreakByTruncatingHead;
    
//    UILineBreakModeWordWrap
    
    // 阴影颜色
    
    lableName.shadowColor = [UIColor redColor];
    
    
    // 阴影偏移量 (Offset) 默认 0 - 1
    
    lableName.shadowOffset = CGSizeMake(2, 2);
    
    

}


 //练习   添加个密码


- (void)labelkey{


    UILabel *labelKey = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 80,40)];
    
    labelKey.backgroundColor = [UIColor whiteColor];
    
    
    [self.window addSubview:labelKey];
    
    [labelKey release];
    
    
    
    labelKey.text = @"密码";
    
    
    labelKey.textColor = [UIColor brownColor];
    
    // 对齐中间
    
    labelKey.textAlignment = NSTextAlignmentCenter;
    



}



#pragma mark - 知识点 2 : UITextFiled

- (void)texFieldView{

//创建对象
    
    UITextField *textFieldOfName = [[UITextField alloc] initWithFrame:CGRectMake(150, 50, 160, 40)];
    
    
    [self.window addSubview:textFieldOfName];
    
    textFieldOfName.tag = 100;
    
    [textFieldOfName release];

// 2.API
    
    //边缘 圆角
     
    textFieldOfName.borderStyle = UITextBorderStyleRoundedRect;

    textFieldOfName.placeholder = @"请输入用户名";
    
    
    // 安全输入 小圆圈
    
    textFieldOfName.secureTextEntry = NO;
    
    
    // 键盘的类型 默认类型 明/亮
    
    textFieldOfName.keyboardType = UIKeyboardTypeDefault;
    
    
    // 弹出键盘的风格
    
    textFieldOfName.keyboardAppearance = UIKeyboardAppearanceDark;
    
    
    // 键盘回车按键
    
    textFieldOfName.returnKeyType = UIReturnKeyNext;
    
    /**练习: 添加密码 texField */
    
    
    
    UITextField *textFileOfkey = [[UITextField alloc] initWithFrame:CGRectMake(150, 100, 160, 40)];
    
    [self.window addSubview:textFileOfkey];
    
    textFileOfkey.tag = 200;
    
    
    [textFileOfkey release];
    
    
    textFileOfkey.borderStyle = UITextBorderStyleRoundedRect;
    
    
    textFileOfkey.placeholder = @"请输入密码";
    
    textFieldOfName.secureTextEntry = NO;
    
    textFileOfkey.secureTextEntry = YES;
    
    textFileOfkey.keyboardType = UIKeyboardTypeNumberPad;
    
    textFileOfkey.returnKeyType = UIReturnKeyNext;
    
    // 输入框后面的,清除按键
    
    textFileOfkey.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
#pragma mark *** textField delegate
    
    
    //最上面签协议
    
    textFieldOfName.delegate = self;
    
    
    textFileOfkey.delegate = self;

    
    

}



#pragma mark - textfield 协议方法 在外面实现




// textField 将要开始编辑的时候,调用此协议方法


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    NSLog(@"第1个:%s , %d", __FUNCTION__, __LINE__ ); //line 执行这一行代码, 显示所在的方法名(函数名)和行数.
    
    return YES;

}


- (void)textFieldDidBeginEditing:(UITextField *)textField{

    NSLog(@"第2个:%s , %d", __FUNCTION__, __LINE__ );
  }


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
   
    NSLog(@"第3个:%s , %d", __FUNCTION__, __LINE__ );


    return YES;

}

//清空时候调用的方法

- (BOOL)textFieldShouldClear:(UITextField *)textField{

    NSLog(@"%d, %s", __LINE__, __FUNCTION__);


    return YES;
}


// 内容发生改变时,调用此方法.

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    

    NSLog(@"string:%@", string);
    
    NSLog(@"%ld, %ld", range.location, range.length);
    
    //判断输入的长度
    
    if (range.location > 7) {
        return NO;
    }
    
    // 限制不能输入的内容,不显示输入内容
    
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    

    return YES;


}



- (void)textFieldDidEndEditing:(UITextField *)textField{


    NSLog(@"第4个:%s , %d", __FUNCTION__, __LINE__ );


}



// 点击按键上得 return 按键时,调用此方法

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    



    NSLog(@"第5个:%s , %d", __FUNCTION__, __LINE__ );
    
    //接收标签
    
   UITextField *txKey =  [self.window viewWithTag:200];
    

    
    //回收键盘 释放第一响应 用户名键盘回收
    
    if (textField.returnKeyType == UIReturnKeyGo) {
        
        [textField resignFirstResponder];// 响应类
        
    }else {
    
        [textField resignFirstResponder];
        
        [txKey becomeFirstResponder];
    
    
    }
    
  

    return YES;


}


#pragma mark - 知识点 3 UIButton

- (void) buttonView{

    UIButton *buttonOfComfirm = [UIButton buttonWithType:UIButtonTypeSystem ];

    buttonOfComfirm.frame = CGRectMake(80, 150, 100, 40);
    
    [self.window addSubview:buttonOfComfirm];
    
    
    //2.API
    
    
    
    [buttonOfComfirm setTitle:@"确定" forState:UIControlStateNormal];
    
    [buttonOfComfirm setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
   
    
    // 添加事件
    
    //控制事件: buttton 向上弹出时调用方法; button 向上弹出时调用的方法
    
    [buttonOfComfirm addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 按钮 事件 "播放"
    
    // 创建按钮图标对象
    
    UIButton *buttonIcon = [UIButton buttonWithType:UIButtonTypeSystem ];
    
    // 按钮位置
    
    buttonIcon.frame = CGRectMake(150, 500, 100, 100);
    
    // 将按钮放到 window
    
    [self.window addSubview:buttonIcon];
    
    // 将按钮图片 添加
    
    [buttonIcon setBackgroundImage:[UIImage imageNamed:@"run"] forState:UIControlStateNormal];
    
    // 点击方法"声明"
    
    [buttonIcon addTarget:self action:@selector(runAway:) forControlEvents:UIControlEventTouchUpInside];
 
    
   
}


#pragma mark -*** Button 的点击事件 方法

// 点击播放键 图片飘走

- (void)runAway: (UIButton *) button{
    

    
    // 创建对象
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    
    
    imageView.frame = CGRectMake(0, 0, 300, 200);
    
    imageView.center = self.window.center;
    
    [self.window addSubview:imageView];
    
    
        // animate 动画  十秒消失
    
        [UIView animateWithDuration:10 animations:^{
    
            // 图片的位置变为 point 位置
    
            imageView.center = CGPointMake(0, 0);
    
            // 透明度
    
            imageView.alpha = 0;
    
        }];
    
    [imageView release];
    
    

    
    NSLog(@"播放");



}




- (void)handleAction: (UIButton *) button{
    
    UITextField *tfUser = [self.window viewWithTag:100];
    
    UITextField *tfkey = [self.window viewWithTag:200];
    
    
//    //释放键盘 点确定的时候回收
//    
//    [tfkey resignFirstResponder];
//    
//    [tfUser resignFirstResponder];
    
    
    
    // 释放键盘
    
    // endEditing 是 uiview 的方法, 功能:释放 view 以及它的子视图的第一响应状态.
    
    [self.window endEditing:YES];
    
    
    //验证用户名和密码是否正确
    

    if ([tfUser.text isEqualToString:@"Tom"] && [tfkey.text isEqualToString:@"234567"] ) {
        
        NSLog(@"恭喜你答对了");
        
    }else{
    
        NSLog(@"别懵了,输错了");
    
    }



}


#pragma mark - 知识点 4 UIImageView // 创建

//- (void) imageView{
//
//
//    // 创建对象
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
//    
//    
//    imageView.frame = CGRectMake(0, 0, 300, 200);
//    
//    imageView.center = self.window.center;
//    
//    [self.window addSubview:imageView];
//    
//    // 一运行 图片飘向右上角
////    // animate
////    
////    [UIView animateWithDuration:10 animations:^{
////        
////        // 图片的位置变为 point 位置
////        
////        imageView.center = CGPointMake(0, 0);
////        
////        // 透明度
////        
////        imageView.alpha = 0;
////        
////    }];
//    
//    [imageView release];
//}
//
//
//
//
//


- (void) dealloc{

    [_window release];
    
    [super dealloc];


}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
