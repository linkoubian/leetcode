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

@end

@implementation LinkedListTest

- (void)setUp {
    self.head = [[ListNode alloc] initWithVal:100];
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
}

- (void)testRemoveNthFromEndOfList {
    NSLog(@"originalList: %@", self.head);
    ListNode *result = [[Solution new] removeNth:2 fromEndOfList:self.head];
    NSLog(@"removeNthFromEndOfList: %@", result);
}

- (void)testRemoveZeroFromEndOfList {
    NSLog(@"originalList: %@", self.head);
    ListNode *result = [[Solution new] removeNth:0 fromEndOfList:self.head];
    NSLog(@"removeNthFromEndOfList: %@", result);
}

@end
