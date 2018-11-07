//
//  NSString+HM_Base64.m
//  SM3Test
//
//  Created by apple on 2017/5/5.
//  Copyright © 2017年 cetc.com. All rights reserved.
//

#import "NSString+HM_Base64.h"

@implementation NSString (HM_Base64)
- (NSString *)base64EncodedString;
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64DecodedString
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
