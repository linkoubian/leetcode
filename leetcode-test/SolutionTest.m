//
//  SolutionTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/12/11.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution.h"

@interface SolutionTest : XCTestCase

@end

@implementation SolutionTest

- (void)testPriceRounding {
    NSInteger result = [Solution priceRounding:408581 withN:5];
    XCTAssert(result == 400000);

    result = [Solution priceRounding:25 withN:1];
    XCTAssert(result == 30);
    
    result = [Solution priceRounding:-3050 withN:2];
    XCTAssert(result == -3000);
    
    result = [Solution priceRounding:-3060 withN:2];
    XCTAssert(result == -3100);
}

- (void)testPolygons {
    NSArray *data = @[@"36 30 36 30",
                      @"30 36 30 30",
                      @"15 15 15 15",
                      @"46 96 90 90 100",
                      @"100 200 100 200",
                      @"-100 -100 -100",
                      @"100",
    ];
    NSArray *result = [Solution polygonCount:data];
    XCTAssert([result[0] integerValue] == 1);
    XCTAssert([result[1] integerValue] == 2);
    XCTAssert([result[2] integerValue] == 2);
    XCTAssert([result[3] integerValue] == 2);
}

@end
