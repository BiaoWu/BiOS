//
//  MainViewController.m
//  BiOS
//
//  Created by BiaoWu on 16/8/9.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

#import "MainModel.h"
#import "MainViewController.h"

@implementation MainViewController

MainModel *model;

- (void)viewDidLoad {
  model = [[MainModel alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return model.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

  cell.textLabel.text = [model getItem:indexPath.row];

  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self showViewController:[model providerVc:indexPath.row] sender:nil];
}

@end
