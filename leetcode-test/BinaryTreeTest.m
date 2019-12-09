//
//  BinaryTreeTest.m
//  leetcode-test
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Solution+BinaryTree.h"

@interface BinaryTreeTest : XCTestCase

@property (nonatomic, strong) TreeNode *node3;
@property (nonatomic, strong) TreeNode *node7;
@property (nonatomic, strong) TreeNode *node9;
@property (nonatomic, strong) TreeNode *node15;
@property (nonatomic, strong) TreeNode *node20;

@end

@implementation BinaryTreeTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.node3 = [[TreeNode alloc] initWithVal:3];
    self.node7 = [[TreeNode alloc] initWithVal:7];
    self.node9 = [[TreeNode alloc] initWithVal:9];
    self.node15 = [[TreeNode alloc] initWithVal:15];
    self.node20 = [[TreeNode alloc] initWithVal:20];
    
    /**
        3
      /   \
     9    20
         /  \
        15   7
     */
    self.node3.left = self.node9;
    self.node3.right = self.node20;
    
    self.node20.left = self.node15;
    self.node20.right = self.node7;
}

- (void)testSameTree {
    BOOL isSameTree = [[Solution new] isTree:nil sameAsTree:nil];
    XCTAssert(isSameTree);
    
    isSameTree = [[Solution new] isTree:nil sameAsTree:self.node3];
    XCTAssert(!isSameTree);
    
    isSameTree = [[Solution new] isTree:self.node3 sameAsTree:self.node7];
    XCTAssert(!isSameTree);
    
    isSameTree = [[Solution new] isTree:self.node3 sameAsTree:self.node3];
    XCTAssert(isSameTree);
}

- (void)testSymmeticTree {
    BOOL isSymmetricTree = [[Solution new] isSymmetricTree:nil];
    XCTAssert(isSymmetricTree);
    
    isSymmetricTree = [[Solution new] isSymmetricTree:self.node15];
    XCTAssert(isSymmetricTree);
    
    isSymmetricTree = [[Solution new] isSymmetricTree:self.node20];
    XCTAssert(!isSymmetricTree);
    
    self.node7.value = 15;
    isSymmetricTree = [[Solution new] isSymmetricTree:self.node20];
    XCTAssert(isSymmetricTree);
}

- (void)testLevelOrderTraversal {
    NSLog(@"levelOrderTraversal: %@", [[Solution new] levelOrderTraversal:self.node3]);
}

- (void)testPreorderTraversal {
    NSLog(@"preorderTraversal: %@", [[Solution new] preorderTraversal:self.node3]);
}

- (void)testInorderTraversal {
    NSLog(@"inorderTraversal: %@", [[Solution new] inorderTraversal:self.node3]);
}

- (void)testPostorderTraversal {
    NSLog(@"postorderTraversal: %@", [[Solution new] postorderTraversal:self.node3]);
}

@end
