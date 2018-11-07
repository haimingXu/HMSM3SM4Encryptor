//
//  NSString+HM_Base64.h
//  SM3Test
//
//  Created by apple on 2017/5/5.
//  Copyright © 2017年 cetc.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HM_Base64)
/**
 *  转换为Base64编码
 */
- (NSString *)base64EncodedString;
/**
 *  将Base64编码还原
 */
- (NSString *)base64DecodedString;
@end
