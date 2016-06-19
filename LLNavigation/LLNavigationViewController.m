//
//  LLNavigationViewController.m
//  LLNavigation
//
//  Created by 李雷 on 16/6/19.
//  Copyright © 2016年 李雷. All rights reserved.
//

#import "LLNavigationViewController.h"

#import "LLNavigationView.h"

#define NAVIBARHEIGHT 44.0f

@interface LLNavigationViewController ()

@property (nonatomic, retain) NSMutableArray *mArrNaviData;
@property (nonatomic, retain) LLNavigationView *navigationView;

@property (nonatomic, retain) UILabel *lblTitle;

@end

@implementation LLNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handleData];
    
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    _lblTitle.backgroundColor = [UIColor grayColor];
    _lblTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_lblTitle];
}

/**
 *  创建NavigationBar上的导航条
 */
- (void)createNavigationView {
    __weak typeof(self) weakSelf = self;
    /** 给当前页面(首页添加导航栏) */
    self.navigationView = [[LLNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, NAVIBARHEIGHT) ItemArray:_mArrNaviData btnRightImage:[UIImage imageNamed:@"btnSearch_nor"] itemClickBlock:^(NSInteger tag) {
        // >这里写上导航条上相应Items被点击要执行的事件
        
        weakSelf.lblTitle.text = _mArrNaviData[tag-1];
    } btnRightBlock:^(UIButton *btnRight) {
        // >这里写上导航条上最右侧按钮被点击要执行的事件
        
    }];
    self.navigationItem.titleView = _navigationView;
}

#warning - UICollectionView继承UIScrollView, 以下是UIScrollView的代理方法
/** 正常下面主要内容是放在一个UICollectionView上, 当其Cell滚动时会触发此方法, 调用后相应改变导航条状态 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    CGFloat offset = scrollView.contentOffset.x/_collectionView.frame.size.width;
//    // >设置导航条的变化(方法在LLNavigationView中)
//    [_navigationView scrollWithTag:offset + 1];
}


#pragma mark - 网络数据(这里处理模拟网络获取的导航条)
- (void)handleData {
    if (!_mArrNaviData) {
        _mArrNaviData = @[@"推荐", @"视频", @"图片", @"国际", @"体育", @"军事", @"娱乐", @"财经", @"房产", @"汽车"].mutableCopy;
    }
    [self createNavigationView];
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
