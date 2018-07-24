//
//  Shamir.h
//  Shamir
//
//  Created by 段林波 on 2018/7/4.
//  Copyright © 2018年 段林波. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for Shamir.
FOUNDATION_EXPORT double ShamirVersionNumber;

//! Project version string for Shamir.
FOUNDATION_EXPORT const unsigned char ShamirVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Shamir/PublicHeader.h>

#import "sss.h"

@interface Shamir: NSObject

+ (NSArray<NSData*>*)create_shares:(NSData*)data
                                 n:(NSInteger)n
                                 k:(NSInteger)k;

+ (NSData*)combine_shares:(NSArray<NSData*>*)dataArray
                        k:(NSInteger)k;

@end




