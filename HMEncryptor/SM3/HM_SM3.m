//
//  HM_SM3.m
//  SM3Test
//
//  Created by apple on 2017/5/5.
//  Copyright © 2017年 cetc.com. All rights reserved.
//

#import "HM_SM3.h"
#import "sm3.h"
#import "NSString+HM_Base64.h"

@implementation HM_SM3

+ (NSString *)stringFromOrginString:(NSString *)orginString {
    //字符串转byte数组
    NSString *str = orginString;
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    Byte *input = (Byte *)[data bytes];
    
    int ilen = (int)[data length];
    unsigned char output[32];
    int i;
    //    sm3_context ctx;
    
    //--------------------------------------------------
//    printf("输入消息:\n");
    //    printf("%@  \n",str);
//    NSLog(@"%@  \n",str);
    
//    NSString *string = @"";
    
    sm3_hash(input, ilen, output);//调用sm3算法环节
    
    NSString *string = @"";
//    printf("杂凑值:\n   ");
    for(i=0; i<32; i++)
    {
        printf("%02x",output[i]);
        //        if (((i+1) % 4 ) == 0) printf(" ");
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%02x",output[i]]];
        
    }
    NSLog(@"小写： %@",string);
    
    Byte *byte = (Byte *)output;
    
    NSData *adata = [[NSData alloc] initWithBytes:byte length:32];
    
//    NSLog(@"data_length ----- %ld",[adata  length]);
    
    NSString *encodStr = [adata base64EncodedStringWithOptions:0];
    
    return encodStr;
}

@end
