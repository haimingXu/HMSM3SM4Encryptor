//
//  HMEncrypt.m
//  SM3Test
//
//  Created by apple on 2017/5/5.
//  Copyright © 2017年 cetc.com. All rights reserved.
//

#import "HMEncrypt.h"
#import "HM_SM3.h"
#import "NSString+HM_Base64.h"

@implementation HMEncrypt

+ (NSString *)getVKey:(NSString *)key {
    //第一次hash
    NSString *str = [HM_SM3 stringFromOrginString:key];
    //base64加密
    NSString *tempStr = [str stringByAppendingString:@"CETC_IOT"];
//    NSString *encodStr = [tempStr base64EncodedString];
    //第二次hash
    NSString *resultStr = [HM_SM3 stringFromOrginString:tempStr];
    //第二次加密
//    NSString *resultStr = [str2 base64EncodedString];
    return resultStr;
}

+ (NSString *)getJointParameterStringWithDict:(NSDictionary *)paraDict {
    NSArray *keyArray = [paraDict allKeys];
    //将参数字段按字母顺序进行排序
    NSArray *newArray = [keyArray sortedArrayUsingSelector:@selector(compare:)];
//    NSArray *tempArray = [[newArray reverseObjectEnumerator] allObjects];
    NSString *keyStr = @"";
    for (int i = 0; i < newArray.count; i++) {
        NSString *tempStr = newArray[i];
        if (i == 0) {
            keyStr = [keyStr stringByAppendingString:[NSString stringWithFormat:@"%@=%@",tempStr,[paraDict objectForKey:tempStr]]];
        }
        else {
            keyStr = [keyStr stringByAppendingString:[NSString stringWithFormat:@"&%@=%@",tempStr,[paraDict objectForKey:tempStr]]];
        }
    }

    return keyStr;
}

@end
