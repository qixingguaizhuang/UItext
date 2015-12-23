//
//  SecondViewController.m
//  UI08_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 GH. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic , retain)UIButton *button;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self creatButton];
    
    
    // Do any additional setup after loading the view.
}


- (void)creatButton{

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 80, self.view.frame.size.width -100, 40);
    [self.button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor yellowColor];
    
    [self.button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];


}


#pragma mark - 通过模态推出来得页面,如何返回

- (void)backAction:(UIButton *)button{

// 简介验证   NSLog(@"%@", self.navigationController.viewControllers);
    
[self dismissViewControllerAnimated:YES completion:^{
    
}];

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
