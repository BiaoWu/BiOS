//
//  TapOrHoldCounterVC.m
//  BiOS
//
//  Created by BiaoWu on 16/8/9.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

#import "TapOrHoldCounterVC.h"

@interface TapOrHoldCounterVC ()

@property(weak, nonatomic) IBOutlet UILabel *countLabel;
@property(weak, nonatomic) IBOutlet UIButton *tabBtn;

@property(nonatomic) NSUInteger count;

@end

@implementation TapOrHoldCounterVC

- (void)setCount:(NSUInteger)count {
  _count = count;
  self.countLabel.text = [NSString stringWithFormat:@"%lu", count];
}

- (void)viewDidLoad {
  [self setCount:0];

  UITapGestureRecognizer *tabG =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(tab)];
  [self.tabBtn addGestureRecognizer:tabG];

  UILongPressGestureRecognizer *longPressG =
      [[UILongPressGestureRecognizer alloc]
          initWithTarget:self
                  action:@selector(longPress:)];
  [self.tabBtn addGestureRecognizer:longPressG];
}

- (void)tab {
  [self setCount:self.count + 1];
}

- (void)longPress:(UIGestureRecognizer *)sender {
  if (sender.state == UIGestureRecognizerStateChanged) {
    [self setCount:self.count + 1];
  }
}

- (IBAction)reset:(id)sender {
  [self setCount:0];
}

@end
