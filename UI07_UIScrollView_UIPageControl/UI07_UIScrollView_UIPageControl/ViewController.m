//
//  ViewController.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"

#import "Picture.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self createPicview];
    
    
}



#pragma mark 知识点 1 UIScrollView_UIPageControl


//详见 Picture 类

- (void)createPicview{

    Picture *pic = [[Picture alloc] initWithFrame:CGRectMake(0, 0, 300, 400) images:@[@"1.jpg",@"2.jpg",@"3.jpg"]];
  
    pic.center = self.view.center;
    
    [self.view addSubview:pic];
    
    [pic release];

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
