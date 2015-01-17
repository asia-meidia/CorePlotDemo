//
//  PieChartView.h
//  CorePlotDemo
//
//  Created by LuPengDa on 14-12-3.
//  Copyright (c) 2014年 xj2014. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 饼图
@interface PieChartView : UIView

/// 数据源 存放NSNumber
@property (nonatomic, strong) NSArray *dataSource;

/**
 *  加载图表
 */
- (void)loadView;

@end
