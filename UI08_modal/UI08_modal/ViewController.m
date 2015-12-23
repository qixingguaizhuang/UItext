//
//  ViewController.m
//  UI08_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 GH. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property (nonatomic ,retain)UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButton];
    
    self.navigationItem.title = @"登入";
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)createButton{


    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 80, self.view.frame.size.width -100, 40);
    [self.button setTitle:@"Next" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor yellowColor];
    
    [self.button addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark - 知识点1  模态推出ViewController 页面



- (void)nextAction:(UIButton *)button{
/** 创建新的页面对象 */

    SecondViewController *second = [[SecondViewController alloc] init];
    
    /*过渡效果*/
    
    second.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    
    
    /** 模态推出新界面. 模态是VC 的方法 */
    [self presentViewController:second animated:YES completion:^{
        
    }];
/** 内存问题 */
    [second release];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
