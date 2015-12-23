//
//  AppDelegate.m
//  UI01_UIWindow_UIView
//
//  Created by dllo on 15/12/14.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - 知识点1 UIWindow


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
/** 当程序对象(application)加载完成(在内存中开辟空间)后,调用此协议方法 */
  
// xcold 7 之后必须加 VC
    
/** 在此协议方法中,通常创建 UIWindow 对象, UIViewController 对象, 其他控件对象*/
    
    
/** 创建 UIWindow 对象,及相关设置.----- 应用程序 self
 *  和主屏幕([UIScreen mainScreen])等大的屏幕大小 | bounds 边界的意思
 
 */
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    //背景颜色,注意颜色是一个对象 (UIColor)
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    // window 设置为主 window 并可以见.
    
    [self.window makeKeyAndVisible];// makeKey 主屏幕,Visible 可见
    
    
    // 创建一个 viewController 对象,不添加 vc 在 xcode 7 之后会报错
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    
    // 将 vc 设置为 windows 根视图控制器
    
    self.window.rootViewController = vc;
    
#pragma mark - 知识点 3 UIView 
    
    /**
     
     * 当接触到一个新类时,首先看是否有自己的初始化方法或是(构造器方法),如果没有自己特有的初始化方法,找父类的初始化方法, 以此类推,都没有还有 init 初始化方法;
     
     *
     
     
     */
    
    //创建对象
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    // 属性
    
    view1.backgroundColor = [UIColor redColor];
    
    
    // 添加到 window 上 .addSubview 是数组,数组里有了 view
    
    
    [self.window addSubview:view1];
    
    
    //内存管理.
    
    [view1 release];
    
    
    // 查看一下 window 的子视图
    
    
    
    NSLog(@"%@",self.window.subviews);
    
    
    
    //创建 viwe2 对象
    
   UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    
    
    // view 的背景图层颜色
    
    view2.backgroundColor = [UIColor blueColor];
    
    // view2 放到window
    
    [self.window addSubview:view2];
    
    //中心点
    
    view2.center = self.window.center;
    
    //透明度 0 -- 1
    
    view2.alpha = 0.5f;

    
    // 父视图.
    
    
    NSLog(@"super:%@", view2.superview);
    
    
    //子视图
    
    NSLog(@"subview:%@", view2.superview);
    
    
    // tag 是 UIView 的一个属性,做个标记. 目的是可以通过 tag 找到对象.
    
    view2.tag = 100;
    
    // 根据标签,找到控件对象.
    
    UIView *findView = [self.window viewWithTag:100];
    
    findView.backgroundColor = [UIColor redColor];
    
    
    /**  练习  */
    
    /**
     
     练习要求:
     
    新建一个工程,创建5个视图(aView、bView、 cView、dView、eView) 1、window用addSubview:方法先后添加aView和bView。 2、window用insertSubview:atIndex:方法把cView添加到 aView和bView之间。 3、window用insertSubview:aboveSubview:方法把dView添 加到aView的上面。 4、window用insertSubview:belowSubview:方法把eView添 加到bView的下面。
     */
    
    
    
    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(100, 220, 100, 100)];
    
    aview.backgroundColor = [UIColor yellowColor];
    
    aview.tag = 1000;
    
    UIView *bview = [[UIView alloc] initWithFrame:CGRectMake(120, 240,100, 100)];
    
    
    bview.backgroundColor = [UIColor greenColor];
    

    bview.tag = 2000;
    
    UIView *cview = [[UIView alloc] initWithFrame:CGRectMake(140, 260, 100, 100)];
    
    cview.backgroundColor = [UIColor redColor];
    
    [self.window addSubview:cview];
    
    cview.tag = 3000;
    
    
    UIView *dview = [[UIView alloc] initWithFrame:CGRectMake(160, 280, 100, 100)];
    
    dview.backgroundColor = [UIColor orangeColor];
    
    [self.window addSubview:dview];
    
    dview.tag = 4000;
    
    UIView *eview = [[UIView alloc] initWithFrame:CGRectMake(180, 300, 100, 100)];
    
    eview.backgroundColor = [UIColor blackColor];
    
    [self.window addSubview:eview];
    
    eview.tag = 5000;
    
    
     [self.window addSubview:aview];
    
    
     [self.window addSubview:bview];
    
    // window用 insertSubview:aboveSubview:方法把dView添加到aView的上面。
    [self.window insertSubview: cview atIndex:4];
    
    
    
    [self.window insertSubview:dview belowSubview:aview];
    
    //window用insertSubview:belowSubview:方法把eView添 加到bView的下面
    
    [self.window insertSubview:eview belowSubview:bview];
    
    
    
#pragma  mark 知识点 4 UIButton (了解)
    
    
    //1.首先创建 button 对象
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    //大小  结构体 frame 坐标位置相对位置(父的视图坐标为 frame)[ frame 是基于它父视图的坐标系而言的
    
    button.frame = CGRectMake(250, 100, 60, 40);
    
    //  添加
    
    [self.window addSubview:button];
    
    //
    
    button.backgroundColor = [UIColor orangeColor];
    
    
    //设置 button 上面的标题
    
   [button setTitle:@"点击" forState:UIControlStateNormal];
    
    
    // button 添加点击事件, self 是指 appdelegate 对象  @selector 是 adddelegate 的方法. 控制事件,选择 touchupinside.(按下去松手后执行操作)
    
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //练习
    
    
    /**
     
     练习要求：创建一个Button，在点击方法里面，调整练习3的视图层级：
     1、window把aView移动到最前面。
     2、window把bView移动到最后面。
     3、window交换dView和eView。
     4、把cView从父视图上移除。
     
     
     
     **/
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button2.frame = CGRectMake(250, 420, 60, 40);
    
    [self.window addSubview:button2];
    
    button2.backgroundColor = [UIColor blackColor];
    
    [self.window addSubview:button2];
    
    [button2 setTitle:@"调" forState:UIControlStateNormal];
    
    [button2 addTarget:self action:@selector(changeLocation:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    [aview release];

    [bview release];
    
    [cview release];
    
    [dview release];
    
    [eview release];
    
    
    
    
#pragma mark 知识点 2 MRC 下的内存管理.
    
    
   
    [_window release];  // 属性
    
    
    [vc release];
    

    
    return YES;
}



#pragma mark -  button 点击事件 哪个对象调用了方法就写对象对应的类写进参数 在协议之后写实现方法

- (void)handleAction:(UIButton *) button{

    NSLog(@"点击");


}





- (void)changeLocation:(UIButton *) button{


    // 标签接收
    UIView *aview = [self.window viewWithTag:1000];
    
    UIView *bview = [self.window viewWithTag:2000];
    
    UIView *cview = [self.window viewWithTag:3000];
    
    
    UIView *dview = [self.window viewWithTag:4000];
    
    UIView *eview = [self.window viewWithTag:5000];
    
    
    
    //通过标签调出
    
    [self.window bringSubviewToFront:aview];
    
    
    [self.window sendSubviewToBack:bview];

    
    [self.window exchangeSubviewAtIndex:2 withSubviewAtIndex:4];
    
    
    [cview removeFromSuperview];

}





















#pragma mark - 重写 dealloc 方法

    
    - (void)dealloc{
    
    
        [_window release]; // 属性
    
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
