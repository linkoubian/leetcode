//
//  LinkedListTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/28.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Solution+LinkedList.h"

@interface LinkedListTest : XCTestCase

@property (nonatomic, strong) ListNode *head;
@property (nonatomic, strong) ListNode *sortedHeadA;
@property (nonatomic, strong) ListNode *sortedHeadB;

@end

@implementation LinkedListTest

- (void)setUp {
    self.head = [[ListNode alloc] initWithVal:0];
    ListNode *node9 = [[ListNode alloc] initWithVal:9];
    ListNode *node22 = [[ListNode alloc] initWithVal:22];
    ListNode *node25 = [[ListNode alloc] initWithVal:25];
    ListNode *node41 = [[ListNode alloc] initWithVal:41];
    ListNode *node88 = [[ListNode alloc] initWithVal:88];
    
    self.head.next = node22;
    node22.next = node9;
    node9.next = node41;
    node41.next = node88;
    node88.next = node25;
    
    self.sortedHeadA = [[ListNode alloc] initWithVal:10];
    ListNode *node23 = [[ListNode alloc] initWithVal:23];
    ListNode *node89 = [[ListNode alloc] initWithVal:89];
    self.sortedHeadA.next = node23;
    node23.next = node89;
    
    self.sortedHeadB = [[ListNode alloc] initWithVal:8];
    ListNode *node24 = [[ListNode alloc] initWithVal:24];
    ListNode *node90 = [[ListNode alloc] initWithVal:90];
    
    self.sortedHeadB.next = node24;
    node24.next = node90;
}

- (void)testRemoveNthFromEndOfList {
    NSLog(@"originalList: %@", self.head);
    ListNode *result = [[Solution new] removeNth:2 fromEndOfList:self.head];
    NSLog(@"removeNthFromEndOfList: %@", result);
    
    result = [[Solution new] removeNth:0 fromEndOfList:self.head];
    NSLog(@"removeNthFromEndOfList: %@", result);
}

- (void)testMergeLists {
    ListNode *result = [[Solution new] mergeList:self.sortedHeadA withAnother:self.sortedHeadB];
    NSLog(@"mergeLists: %@", result);
    
    result = [[Solution new] mergeList:[[ListNode alloc] initWithVal:25] withAnother:result];
    NSLog(@"mergeLists: %@", result);
}

@end
