//
//  ViewController.m
//  HBAssembly
//
//  Created by 贺兵 on 2017/10/11.
//  Copyright © 2017年 贺兵. All rights reserved.
//

#import "ViewController.h"
#import "HBRoundView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    HBRoundView *roudView = [HBRoundView new];
    roudView.frame = CGRectMake(50, 100, 100, 30);
    roudView.messageArray = @[@"的冯绍峰似懂非懂是粉色惹人"
                              ,@"风热更方便挺好卡挺好恐怖覅部分"
                              ,@"fs份儿饭热压机噢金币"
                              ,@"打算搜VOA噢温热"
                              ,@"关雎尔封ID脾气也让他购买V领滴水穿石的"
                              ,@"放得开都是去问问土管局"];
    [self.view addSubview:roudView];
    [roudView _roundAnimation];

}


@end
