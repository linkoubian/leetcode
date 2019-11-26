//
//  SubStringTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+SubString.h"

@interface SubStringTest : XCTestCase

@end

@implementation SubStringTest

- (void)testLengthOfLongestSubstring {
    NSString *str = @"abcabcbb";
    NSUInteger length = [[Solution new] lengthOfLongestSubstring:str];
    
    XCTAssert(length == 3, @"lengthOfLongestSubstring %@ should be 3", str);
}

- (void)testLongestPalindrome {
    NSString *str = @"abcabcbb";
    NSString *palindrome = [[Solution new] longestPalindrome:str];
    
    NSLog(@"testLongestPalindrome %@ is %@", str, palindrome);
    XCTAssert([palindrome length] == 3);
    
    str = @"m";
    palindrome = [[Solution new] longestPalindrome:str];
    NSLog(@"testLongestPalindrome %@ is %@", str, palindrome);
    XCTAssert([palindrome length] == 1);
}

- (void)testZigZag {
    NSString *str = @"PAYPALISHIRING";
    NSString *zigZag = [[Solution new] zigZag:str withRow:1];
    
    NSLog(@"testZigZag %@ with row 1 is %@", str, zigZag);
    XCTAssert([zigZag isEqualToString:@"PAYPALISHIRING"]);
    
    zigZag = [[Solution new] zigZag:str withRow:3];
    
    NSLog(@"testZigZag %@ with row 3 is %@", str, zigZag);
    XCTAssert([zigZag isEqualToString:@"PAHNAPLSIIGYIR"]);
    
    zigZag = [[Solution new] zigZag:str withRow:4];
    
    NSLog(@"testZigZag %@ with row 4 is %@", str, zigZag);
    XCTAssert([zigZag isEqualToString:@"PINALSIGYAHRPI"]);
    
    zigZag = [[Solution new] zigZag:str withRow:str.length];
    NSLog(@"testZigZag %@ with row %tu is %@", str, str.length, zigZag);
    XCTAssert([zigZag isEqualToString:@"PAYPALISHIRING"]);
}

- (void)testLongestCommonSubString_DP {
    NSString *aStr = @"zxabcdezy";
    NSString *bStr = @"yzabcdezx";
    NSString *lcs = [[Solution new] longestCommonSubStringOf:aStr andString:bStr];
    
    NSLog(@"longestCommonSubString is %@", lcs);
    XCTAssert([lcs isEqualToString:@"abcdez"]);
}

@end
