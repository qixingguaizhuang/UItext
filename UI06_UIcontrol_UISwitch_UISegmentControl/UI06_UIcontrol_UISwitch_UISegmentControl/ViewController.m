//
//  ViewController.m
//  UI06_UIcontrol_UISwitch_UISegmentControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic , retain) UISwitch *sw;

@property (nonatomic, retain)UIImageView *imageViewZombie;

@end

@implementation ViewController

- (void)dealloc{

    [_imageViewZombie release];
    
    [_sw release];

    
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    [self creatImageView];
    
    [self createSwitch];
    
    [self creatSlider];
    
    [self createSegment];

    [self switchL];
    
    

}


// 加个label 开关

- (void)switchL{

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(65,50,50, 30)];
    
    label.text = @"开关";
    
    label.backgroundColor = [UIColor orangeColor];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [UIColor redColor];
  
    [self.view addSubview:label];
    
    [label release];

}


// 创建 imageView 对象

- (void)creatImageView{

    self.imageViewZombie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BZombie1.tiff"]];
    
    self.imageViewZombie.frame = CGRectMake(0, 0, 320, 350);
    
    self.imageViewZombie.center = self.view.center;
    
    [self.view addSubview:self.imageViewZombie];
    
    [_imageViewZombie release];
    
    //动画
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 1; i < 26; i++) {
        
        NSString *name = [NSString stringWithFormat:@"BZombie%d.tiff", i];
        
        UIImage *image = [UIImage imageNamed:name];
        
        [arr addObject:image];
    }
    
    self.imageViewZombie.animationImages = arr;
    
    self.imageViewZombie.animationDuration = arr.count * 0.1;
    
    self.imageViewZombie.animationRepeatCount = 0;


}



#pragma mark - 知识点 1 UISwitch (开关控制)

- (void)createSwitch{

    _sw = [[UISwitch alloc] initWithFrame:CGRectMake(310, 50, 0, 0)];
    
    [self.view addSubview:_sw];

    [_sw release];
    
    //API
    
    _sw.tintColor = [UIColor redColor];//开关边框
    
    _sw.onTintColor = [UIColor whiteColor];//开启状态时的按钮颜色
    
    _sw.thumbTintColor = [UIColor orangeColor];//按钮颜色
    
    //核心:添加事件
    
    [_sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
   
    
}


// 控制动画开关

- (void)switchAction:(UISwitch *)sw{

    NSLog(@"ddd");

    if (sw.on) {
        [self.imageViewZombie startAnimating];
    }else{
    
        [self.imageViewZombie stopAnimating];
    }

}


#pragma mark - 知识点 2 UISlider (滑动条)


- (void)creatSlider{
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100,950)];
  
    [self.view addSubview:slider];
    
    [slider release];
    
   //API
    
    // 最小值
    
    slider.minimumValue = 1;
    
    // 最大值 滑块
    
    slider.maximumValue = 5;
    
    
    slider.minimumValueImage = [UIImage imageNamed:@"w"];
    
    slider.maximumValueImage = [UIImage imageNamed:@"1"];
    
    
    // 添加事件
    
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];


}

   // 控制动画速度

- (void)sliderAction:(UISlider *)slider{


    self.imageViewZombie.animationDuration = self.imageViewZombie.animationImages.count * (0.1 / slider.value);
    
    
    if ([self.sw isOn]) {  // 上面的 sw.on 因为方法在 sw 中所以直接这样写,下面需要调用sw 属性 [self.sw isOn]
        [self.imageViewZombie startAnimating];
    }
    
    
  //  [self.imageViewZombie startAnimating];


}



#pragma mark 知识点 3 UISegmentedControl


- (void)createSegment{


    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"红",@"黄",@"蓝"]];
    
    seg.frame = CGRectMake(65, 600, 300, 40);
    
    [self.view addSubview:seg];
    
    [seg release];

    
    //默认选中的 item. 默认按键为登陆
    
    seg.selectedSegmentIndex = 1;
    
    
    //添加事件 action
    
    [seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];

}

// 界面颜色切换


- (void)segmentAction:(UISegmentedControl *)seg{

    switch (seg.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = [UIColor redColor];
            break;
            
            case 1:
            self.view.backgroundColor = [UIColor yellowColor];
            break;
      
        case 2:
            
            self.view.backgroundColor = [UIColor blueColor];
            
            break;
  
        default:
            break;
    }

}


#pragma mark 知识点 4 UIScrollView 滚动条 轮播图















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
