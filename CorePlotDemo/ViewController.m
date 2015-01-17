//
//  ViewController.m
//  CorePlotDemo
//
//  Created by LuPengDa on 14-11-21.
//  Copyright (c) 2014年 xj2014. All rights reserved.
//

#import "ViewController.h"

#import "ScatterChartView.h"
#import "BarChartView.h"
#import "PieChartView.h"

@interface ViewController ()
{
    UIView *_currentView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UISegmentedControl *segmentedCtr = [[UISegmentedControl alloc] initWithItems:@[@"折线图",@"柱状图",@"饼图"]];
    segmentedCtr.frame = CGRectMake(20, 30, 200, 44);
    [segmentedCtr addTarget:self action:@selector(switchChart:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedCtr];
    [segmentedCtr setSelectedSegmentIndex:0];
    [self switchChart:segmentedCtr];
}

- (void)switchChart:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            [_currentView removeFromSuperview];
            // 折线图
            NSMutableArray *dataSource = [NSMutableArray arrayWithCapacity:10];
            for (int i = 0; i < 10; i++) {
                [dataSource addObject:@(arc4random()%10)];
            }
            ScatterChartView *scatterChart = [[ScatterChartView alloc] initWithFrame:CGRectMake(20, 75, 700, 600)];
            scatterChart.dataSource = dataSource;
            [self.view addSubview:scatterChart];
            [scatterChart loadView];
            
            _currentView = scatterChart;
        }
            break;
        case 1:
        {
            [_currentView removeFromSuperview];
            // 柱状图
            NSMutableArray *dataSource1 = [NSMutableArray arrayWithCapacity:10];
            NSMutableArray *dataSource2 = [NSMutableArray arrayWithCapacity:10];
            for (int i = 0; i < 10; i++) {
                [dataSource1 addObject:@(arc4random()%10)];
                [dataSource2 addObject:@(arc4random()%10)];
            }
            BarChartView *barChart = [[BarChartView alloc] initWithFrame:CGRectMake(20, 75, 700, 600)];
            barChart.dataSource1 = dataSource1;
            barChart.dataSource2 = dataSource2;
            [self.view addSubview:barChart];
            [barChart loadView];
            
            _currentView = barChart;
        }
            break;
        default:
        {
            [_currentView removeFromSuperview];
            // 饼图
            NSMutableArray *dataSource = [NSMutableArray arrayWithCapacity:10];
            for (int i = 0; i < 6; i++) {
                [dataSource addObject:@(arc4random()%10)];
            }
            for (int i = 0; i < 6; i++) {
                CGFloat scale = [dataSource[i] floatValue] / [[dataSource valueForKeyPath:@"@sum.self"] floatValue];
                [dataSource replaceObjectAtIndex:i withObject:@(scale)];
            }
            
            PieChartView *pieChare = [[PieChartView alloc] initWithFrame:CGRectMake(20, 75, 700, 600)];
            pieChare.dataSource = dataSource;
            [self.view addSubview:pieChare];
            [pieChare loadView];
            _currentView = pieChare;
        }
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
