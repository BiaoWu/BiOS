//
//  MainModel.m
//  BiOS
//
//  Created by BiaoWu on 16/8/9.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

#import "MainModel.h"

@interface MainModel ()

@property(nonatomic) NSUInteger size;

@end

@implementation MainModel

NSString *tapOrHolder = @"01.TapOrHoldCounter";

NSMutableArray *data;

- (instancetype)init {
  self = [super init];

  if (self) {
    data = [[NSMutableArray alloc] init];
    [data addObject:tapOrHolder];
  }

  return self;
}

- (NSUInteger)size {
  return [data count];
}

- (NSString *)getItem:(NSUInteger)index {
  return [data objectAtIndex:index];
}

- (UIViewController *)providerVc:(NSUInteger)index {
  NSString *name = [self getItem:index];
  if ([name isEqualToString:tapOrHolder]) {
    UIStoryboard *storyboard =
        [UIStoryboard storyboardWithName:@"TapOrHoldCounter" bundle:nil];
    return [storyboard instantiateInitialViewController];
  } else {
    return nil;
  }
}

@end