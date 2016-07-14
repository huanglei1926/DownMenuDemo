//
//  HLDownMenuButton.h
//  DownMenuDemo
//
//  Created by lei.huang on 16/7/14.
//  Copyright © 2016年 len.wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLDownMenuButton : UIButton<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGRect actualFrame;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *selectLists;
@property (nonatomic, assign) NSInteger selectIndex;

@end
