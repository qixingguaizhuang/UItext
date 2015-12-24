//
//  ViewController.m
//  UITableView课后代码练习
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)UITableView *tableView;

@property (nonatomic, retain)NSMutableArray *arrDate;

@end

@implementation ViewController

- (void)dealloc{
    [_tableView release];
    [_arrDate release];
    [super dealloc];
}

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    [self creatTableView];
    
    [self handleDate];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

/** 第一步 创建 tableview */

- (void)creatTableView{

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame  style:UITableViewStylePlain];

    self.tableView.backgroundColor = [UIColor grayColor];
    
    self.tableView.rowHeight = 150;
    
    self.tableView.separatorColor = [UIColor redColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    
    [_tableView release];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    

}


/** 数组数据 */

- (void)handleDate{

    self.arrDate = @[
                     @{@"title":@"海贼王",
                       @"detail":@"尾田荣一郎",
                       @"image":@"z.jpg"},
                     
                     @{@"title":@"海绵宝宝",
                       @"detail":@"派大星",
                       @"image":@"h.jpg"},
                     
                     @{@"title":@"地毯",
                       @"detail":@"客厅",
                       @"image":@"s.png"},
                     
                     @{@"title":@"高圆圆",
                       @"detail":@"老乡",
                       @"image":@"g.jpg"},
                     
                     @{@"title":@"漫画",
                       @"detail":@"手绘",
                       @"image":@"c.jpg"},

                     ].mutableCopy;


}


/** 第二步 实现协议方法 1 提供 row 数,有多少 row 创建多少个 cell , 所以 self.arrDate.count */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrDate.count;

}

/** 方法 2 */

/** 通过 tableView 的协议方法进行设置 row 数 和 cell 内容和样式,签代理*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

/** 重用池 */
    
    static NSString *pool1 = @"reuse1";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool1];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:pool1] autorelease];
    }
    
    
/** 赋值 */
    
    NSDictionary *dic = [self.arrDate objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"title"];
    
    cell.detailTextLabel.text = [dic objectForKey:@"detail"];
    
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    
    // cell 后面带箭头
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    SecondController *second = [[SecondController alloc]init];
    
    second.mDic = [self.arrDate objectAtIndex:indexPath.row];
  
    [self.navigationController pushViewController:second animated:YES]; 

    NSLog(@"ddd %ld, %ld", indexPath.section, indexPath.row);

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
