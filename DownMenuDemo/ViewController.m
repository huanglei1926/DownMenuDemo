//
//  ViewController.m
//  DownMenuDemo
//
//  Created by lei.huang on 16/7/14.
//  Copyright © 2016年 len.wang. All rights reserved.
//

#import "ViewController.h"
#import "HLDownMenuButton.h"

@interface ViewController ()

@property (strong, nonatomic) HLDownMenuButton *selectButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}

- (void)initSubViews
{
    _selectButton = [HLDownMenuButton buttonWithType:UIButtonTypeCustom];
    _selectButton.frame = CGRectMake(100, 200, 100, 30);
    _selectButton.backgroundColor = [UIColor grayColor];
    [_selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _selectButton.selectLists = @[@"小兔快跑", @"小猪快跑", @"火隐忍者", @"切西瓜"];
    [self.view addSubview:_selectButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
