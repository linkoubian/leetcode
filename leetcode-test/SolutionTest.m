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

@end
