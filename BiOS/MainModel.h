//
//  MainModel.h
//  BiOS
//
//  Created by BiaoWu on 16/8/9.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef MainMod_h
#define MainMod_h

#endif /* MainMod_h */

@interface MainModel : NSObject

@property(nonatomic, readonly) NSUInteger size;

- (NSString *)getItem:(NSUInteger)index;

- (UIViewController *)providerVc:(NSUInteger)index;

@end