//
//  AppDelegate.m
//  UI03_自定义View
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "AppDelegate.h"


#import "LTView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc{

    [_window release];
    
    [super dealloc];


}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor grayColor];
    
    [self.window makeKeyAndVisible];
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    self.window.rootViewController = vc;
    
    [self createCustomView];
    
    
    
    
    
    [_window release];
    
    [vc release];
    

    return YES;
}


#pragma mark 知识点 1 自定义

- (void)createCustomView{

// 需求:需要一种控件(类),这个控件中有一个 lable 有一个 textfield .系统中没有此性质的类,因此需要自己创建一个类. 详见: LTView 类
    
    // 继承父类 uiview 的初始化方法
    
    //创建方法
    
    LTView *ltniew = [[LTView alloc] initWithFrame:CGRectMake(20, 80, self.window.frame.size.width - 40 , 40)];
    
    [self.window addSubview:ltniew];
    
    [ltniew release];
    
    ltniew.labelOfLeft.text = @"用户名";
    
    ltniew.textFieldOfRight.placeholder = @"请输入用户名";
    
    
    
    
    
    
    
    
    
    
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
