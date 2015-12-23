//
//  ThirdViewController.m
//  UI08_UINavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic, retain) UIButton *buttonBack;

@property (nonatomic, retain) UIButton *buttonBackToRoot;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"第三页";
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self creatButtonBack];
    
    [self creatButtonBackRoot];
    
    
}

//返回上一页

- (void)creatButtonBack{
    
    self.buttonBack = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.buttonBack.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    
    [self.buttonBack setTitle:@"返回上一页" forState:UIControlStateNormal];
    
    [self.view addSubview:self.buttonBack];
    
    self.buttonBack.backgroundColor = [UIColor orangeColor];
    
    [self.buttonBack addTarget:self action:@selector(BackAction:) forControlEvents:UIControlEventTouchUpInside];
    
}



- (void)BackAction:(UIButton *)buttonBack{
    
  
    [self.navigationController popViewControllerAnimated:NO];//默认状态 no 显示的

    
}

// 返回首页

- (void)creatButtonBackRoot{
    
    self.buttonBackToRoot = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.buttonBackToRoot.frame = CGRectMake(50, 140, self.view.frame.size.width - 100, 40);
    
    [self.buttonBackToRoot setTitle:@"返回首页" forState:UIControlStateNormal];
    
    [self.view addSubview:self.buttonBackToRoot];
    
    self.buttonBackToRoot.backgroundColor = [UIColor orangeColor];
    
    [self.buttonBackToRoot addTarget:self action:@selector(BackToRootAction:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)BackToRootAction:(UIButton *)buttonBack{
    
    //方法 1
    
    //  [self.navigationController popToRootViewControllerAnimated:YES];
    
    // 方法 2 从 viewControllers 数组中取出返回的 vc
    
       UIViewController *first = [self.navigationController.viewControllers firstObject];
    
      [self.navigationController popToViewController:first animated:YES];
    
    
    //方法 3 点语法
   
    //[self.navigationController popToViewController:self.navigationController.viewControllers.firstObject animated:YES];
    
    
    
    
    
}

















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
