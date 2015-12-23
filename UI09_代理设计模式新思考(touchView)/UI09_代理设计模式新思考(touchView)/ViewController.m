//
//  ViewController.m
//  UI09_代理设计模式新思考(touchView)
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"

#import "TouchView.h"

@interface ViewController () <TouchViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createtouchView];
    
    
    
}


- (void)createtouchView{

    TouchView *view = [[TouchView alloc]initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100 , 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    [view release];
    
    view.delegate = self;//self 指 vc

}

- (void)beginClick{
    
    self.view.backgroundColor = [UIColor redColor];

    NSLog(@"我知道了");

}


- (void)didClic{
    
    self.view.backgroundColor = [UIColor purpleColor];

    NSLog(@"报警了");

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
