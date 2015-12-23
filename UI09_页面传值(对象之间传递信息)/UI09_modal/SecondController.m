//
//  SecondController.m
//  UI09_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "SecondController.h"

@interface SecondController ()

@property (nonatomic , retain) UILabel *label;



@end

@implementation SecondController


- (void)dealloc{
    
    [_label release];
    
    [super dealloc];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    
    

    [self creatLaber];
    

}


- (void)creatLaber{
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 40)];
    
    self.label.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.label];
    
    [_label release];
    
    self.label.text = self.strReceive;


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
