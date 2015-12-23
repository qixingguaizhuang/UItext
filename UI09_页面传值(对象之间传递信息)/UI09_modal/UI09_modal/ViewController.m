//
//  ViewController.m
//  UI09_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"

#import "SecondController.h"

@interface ViewController ()

@property (nonatomic, retain)UITextField *textfieldOfName;

@property (nonatomic, retain)UITextField *textfieldOfPwd;;

@property (nonatomic, retain)UIButton *button;

@end

@implementation ViewController

- (void)dealloc{

    [_textfieldOfName release];
    
    [_textfieldOfPwd release];
    
    [_button release];
    
    [super dealloc];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor grayColor];
    
    [self creatButton];
    
    [self creatLaber];
    
   // self.navigationItem.title = @"VC1";

}









- (void)creatLaber{

   
    self.textfieldOfName = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    
    self.textfieldOfName.borderStyle = 3;
    
    self.textfieldOfName.placeholder = @"请输入用户名";
    
    [self.view addSubview:self.textfieldOfName];
    
    [_textfieldOfName release];
    
    
    
    self.textfieldOfPwd = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 40)];
    
    self.textfieldOfPwd.borderStyle = 3;
    
    self.textfieldOfPwd.placeholder = @"请输入密码";
    
    [self.view addSubview:self.textfieldOfPwd];
    
    [_textfieldOfPwd release];
    


}




- (void)creatButton{

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.button.frame = CGRectMake(50, 220, self.view.frame.size.width - 100, 40);
    
    [self.button setTitle:@"确认" forState: UIControlStateNormal];
    
    self.button.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.button];

    [self.button addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];

}

/** 属性传值 */

- (void)nextAction:(UIButton *)button{
    
    /** 创建第二页面对象,注意!此时在内存中已经完成开辟空间动作 */
    
    SecondController *second = [[SecondController alloc]init];
    
    /** 找到第二页面对象, 并且对其中的一个属性进行赋值,注意,此时,内存中第二页面对象的属性值完成了赋值过程 */
    
    second.strReceive = [NSString stringWithFormat:@"%@ %@",self.textfieldOfName.text, self.textfieldOfPwd.text ];
    
    /**导航控制器将第二页面推入栈中*/
    
    [self.navigationController pushViewController:second animated:YES];
    
    
    [second release];
    
    


}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
