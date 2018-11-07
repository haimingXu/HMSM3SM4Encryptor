//
//  HMEncrypt.h
//  SM3Test
//
//  Created by apple on 2017/5/5.
//  Copyright © 2017年 cetc.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMEncrypt : NSObject

//获取vKey
+ (NSString *)getVKey:(NSString *)key;

//拼接参数字段
+ (NSString *)getJointParameterStringWithDict:(NSDictionary *)paraDict;

@end
