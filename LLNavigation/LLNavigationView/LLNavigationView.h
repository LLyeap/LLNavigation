//
//  LLNavigationView.h
//  LLNavigation
//
//  Created by 李雷 on 16/6/19.
//  Copyright © 2016年 李雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLNavigationView : UIView

/**
*  创建一个view返回给VC, 放在naviBar上
*
*  @param frame         设置页面布局
*  @param itemArray     显示item内容数组
*  @param btnRightImage 显示在导航条右侧的按钮图标
*  @param itemBlock     导航条中item点击结果回调block
*  @param btnRightBlock 右侧按钮点击事件的回调block
*
*  @return 带有collectionView和分割线和加好按钮的View
*/
- (instancetype)initWithFrame:(CGRect)frame ItemArray:(NSArray *)itemArray btnRightImage:(UIImage *)btnRightImage itemClickBlock:(void (^)(NSInteger tag))itemBlock btnRightBlock:(void (^)(UIButton *btnRight))btnRightBlock;
/**
 *  调用的页面中内容部分滑动到相应item, 通过此方法改变naviB的状态
 *
 *  @param tag 传过来应该被选中的item的tag值
 */
- (void)scrollWithTag:(NSInteger)tag;

@end
