//
//  ZGViewController.m
//  ZGScrollViewTiming
//
//  Created by offcn_zcz32036 on 2017/6/22.
//  Copyright © 2017年 offcn. All rights reserved.
//

#import "ZGViewController.h"
#import "UIScrollView+ScrollAnimation.h"
//CA_EXTERN NSString * const kCAMediaTimingFunctionLinear//匀速
//CA_EXTERN NSString * const kCAMediaTimingFunctionEaseIn//加速
//CA_EXTERN NSString * const kCAMediaTimingFunctionEaseOut//减速
//CA_EXTERN NSString * const kCAMediaTimingFunctionEaseInEaseOut//先加速,后减速
@interface ZGViewController ()
<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView*tabView;
@end

@implementation ZGViewController
#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self tabView];
    CAMediaTimingFunction * timing=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.tabView setContentOffset:CGPointMake(0, self.tabView.contentOffset.y+44) withTimingFunction:timing duration:1];
    
}
-(UITableView *)tabView
{
    if (!_tabView) {
        _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _tabView.delegate=self;
        _tabView.dataSource=self;
        _tabView.showsVerticalScrollIndicator=NO;
        _tabView.showsHorizontalScrollIndicator=NO;
       [self.view addSubview:_tabView];
    }
    return _tabView;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"%@",@"scrollViewDidEndScrollingAnimation");
    
    CAMediaTimingFunction * timing=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    if (self.tabView.contentOffset.y<20*44) {
        [self.tabView setContentOffset:CGPointMake(0, self.tabView.contentOffset.y+44) withTimingFunction:timing duration:1];
        
    }
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - Request
@end
