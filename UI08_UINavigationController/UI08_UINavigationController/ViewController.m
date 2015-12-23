//
//  ViewController.m
//  UI08_UINavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController ()

@property (nonatomic, retain) UIButton *buttonNext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    /* 设置标题*/
    
   // self.title = @"首页";
    
    [self changeNavigationItem];
    
    
    [self creatButton];
    
}

/*<视图将要出现的时候,调用此方法>!! //viewDidLoad 将不再走这个流程*/

/*注意: 从第二页面返回到此页面时,也会调用此方法*/

- (void)viewWillAppear:(BOOL)animated{

    [self changeBar];

}


#pragma mark - UINavigationBar

- (void)changeBar{

   /*显隐属性: 导航栏显隐*/
    
    self.navigationController.navigationBarHidden = NO;
    
    
    /*导航栏样式.*/
    
    self.navigationController.navigationBar.barStyle = 1;
    
    /*背景颜色*/
    
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    
    /* 导航栏上面的 item 的颜色*/
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];


}


#pragma mark -  UINavigationItem


- (void)changeNavigationItem{

    /*中间标题部分*/
    
   // self.navigationItem.title = @"首页";
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"通话"]];
    
    self.navigationItem.titleView = seg;
    
   
    /*左边标题部分*/
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    
    
    /*右边标题部分*/
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"map"]  style:UIBarButtonItemStylePlain target:self action:@selector(dituAction:)];
    
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction:)];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];

}


/*方法*/

- (void)searchAction:(UIBarButtonItem *) barbutton{


    NSLog(@"%s", __FUNCTION__);

}


/*ditu*/


- (void)dituAction:(UIBarButtonItem *)barbutton{

  NSLog(@"%s", __FUNCTION__);


}


- (void)saveAction:(UIBarButtonItem *)bartutton{


  NSLog(@"%s", __FUNCTION__);
}






- (void)creatButton{

    self.buttonNext = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.buttonNext.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    
    [self.buttonNext setTitle:@"NEXT" forState:UIControlStateNormal];
    
    [self.view addSubview:self.buttonNext];
    
    self.buttonNext.backgroundColor = [UIColor redColor];
    
    [self.buttonNext addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];

}




- (void)nextAction:(UIButton *) button{

    // 创建第二页vc对象
    
    SecondViewController *second = [[SecondViewController alloc] init];

    // PUSH (推出)第二个页面
    
    // 离我很近的导航控制器  self.navigationController
    [self.navigationController pushViewController:second animated:YES];
    
    
    //内存管理
 
    [second release];
    
    
    

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
