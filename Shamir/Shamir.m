//
//  Shamir.m
//  Shamir
//
//  Created by 段林波 on 2018/7/4.
//  Copyright © 2018年 段林波. All rights reserved.
//

#import "Shamir.h"

@implementation Shamir

+ (NSArray<NSData*>*)create_shares:(NSData*)data
                                 n:(NSInteger)n
                                 k:(NSInteger)k {
    
    if(k>n) return nil;
    
    if(data.length > sss_SHARE_LEN*n) return nil;
    
    sss_Share shares[n];
    
    sss_create_shares(shares, data.bytes, n, k);
    
    NSMutableArray *sharesDataArray = [NSMutableArray array];
    for (int i=0; i<n; i++) {
        [sharesDataArray addObject:[NSData dataWithBytes:shares[i] length:sss_SHARE_LEN]];
    }
    
    return sharesDataArray;
    
}

+ (NSData*)combine_shares:(NSArray<NSData*>*)dataArray
                        k:(NSInteger)k
              restoredLen:(NSInteger)restoredLen {
    if(dataArray.count<k) return nil;
    
    uint8_t restored[sss_MLEN];
    memset(restored, 0, sizeof(restored));
    
    
    sss_Share shares[k];
    for (int i=0; i<k; i++) {
        NSData *data = dataArray[i];
        if(data.length>sss_SHARE_LEN) return nil;
        memcpy(shares[i], data.bytes, data.length);
    }
    
    
    
    sss_combine_shares(restored, shares, k);
    
    return [NSData dataWithBytes:restored length:sss_MLEN];
}

@end
