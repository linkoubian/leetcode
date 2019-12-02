//
//  main.m
//  leetcode
//
//  Created by Linkou Bian on 2019/11/20.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Solution.h"
#import "NSArray+DeltaCoder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"leetcode console");
        Solution *s = [Solution new];
        NSArray *results = [s groupAnagrams:@[@"pear", @"amleth", @"reap", @"dormitory", @"tinsel", @"dirty room", @"hamlet", @"listen", @"silent"]];
        NSLog(@"%@", results);
    }
    
    return 0;
}
