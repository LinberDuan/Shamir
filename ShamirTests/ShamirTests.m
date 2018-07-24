//
//  ShamirTests.m
//  ShamirTests
//
//  Created by 段林波 on 2018/7/4.
//  Copyright © 2018年 段林波. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Shamir.h"

@interface ShamirTests : XCTestCase

@end

@implementation ShamirTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testShamir {
    char *str = "Hello Shamir 123Hello Shamir 123acd6";
    NSLog(@"strLen:%d", strlen(str));
    NSData *data = [NSData dataWithBytes:str length:strlen(str)];
    NSArray<NSData*> *shaDataArray = [Shamir create_shares:data n:9 k:2];
    
    NSString *testStr = [NSString stringWithCharacters:shaDataArray[0].bytes length:shaDataArray[0].length];
    
    NSData *comShares = [Shamir combine_shares:shaDataArray k:2];
    
    NSString *comStr = [NSString stringWithCString:comShares.bytes encoding:NSUTF8StringEncoding];
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
