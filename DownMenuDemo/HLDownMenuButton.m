//
//  HLDownMenuButton.m
//  DownMenuDemo
//
//  Created by lei.huang on 16/7/14.
//  Copyright © 2016年 len.wong. All rights reserved.
//

#import "HLDownMenuButton.h"

@implementation HLDownMenuButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setSelectLists:(NSArray *)selectLists
{
    _selectLists = selectLists;
    [self setTitle:_selectLists[_selectIndex] forState:UIControlStateNormal];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, _selectLists.count * self.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = self.bounds.size.height;
    [_tableView reloadData];
    _tableView.hidden = YES;
    [self addSubview:_tableView];
    self.actualFrame = CGRectZero;
}

- (void)buttonClick {
    self.selected = !self.isSelected;
    if (self.selected) {
        _tableView.hidden = NO;
        _tableView.userInteractionEnabled = YES;
        self.actualFrame = _tableView.frame;
    }else{
        [self setTitle:_selectLists[_selectIndex] forState:UIControlStateNormal];
        _tableView.hidden = YES;
        _tableView.userInteractionEnabled = NO;
        self.actualFrame = CGRectZero;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selectLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"SelectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _selectLists[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndex = indexPath.row;
    [self buttonClick];
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bigRect = CGRectMake(self.bounds.origin.y, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height + _actualFrame.size.height);
    if (point.x >= bigRect.origin.x && point.x <= CGRectGetMaxX(bigRect) && point.y >= bigRect.origin.y && point.y <= CGRectGetMaxY(bigRect)) {
        return YES;
    }
    return NO;
}

@end
