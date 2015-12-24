//
//  SecondController.m
//  UITableView课后代码练习
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "SecondController.h"

@interface SecondController ()

@property (nonatomic, retain) UILabel *lable;
@property (nonatomic, retain) UIImageView *imageView;

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor darkGrayColor];
 
    [self creatLable2];
    
    [self creatLable];
    
    [self creatImageView];
    
    
}

- (void)creatLable{
    
    self.lable = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, self.view.frame.size.width - 200, 40)];
    
    self.lable.backgroundColor = [UIColor brownColor];
    
    self.lable.text = [self.mDic objectForKey:@"title"];
    
    self.lable.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.lable];

    [_lable release];


}


- (void)creatLable2{
    
    self.lable = [[UILabel alloc] initWithFrame:CGRectMake(100, 220, self.view.frame.size.width - 200, 40)];
    
    self.lable.backgroundColor = [UIColor brownColor];
    
    self.lable.text = [self.mDic objectForKey:@"detail"];
    
    self.lable.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.lable];
    
    [_lable release];
    
    
}




- (void)creatImageView{

    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.mDic objectForKey:@"image"]]];
    
    self.imageView.frame = CGRectMake(50, 300, self.view.frame.size.width - 100, 270);
    
    [self.view addSubview:self.imageView];
    
    [_imageView release];

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
