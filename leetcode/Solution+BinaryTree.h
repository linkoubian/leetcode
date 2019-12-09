//
//  Solution+BinaryTree.h
//  leetcode
//
//  Created by Linkou Bian on 2019/11/24.
//  Copyright © 2019 Balloonsys Inc. All rights reserved.
//

#import "Solution.h"

@interface TreeNode : NSObject

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;

- (instancetype)initWithVal:(NSInteger)value;

@end

/*!
*  @brief      避免 Solution 太臃肿，工程上应采用独立的类实现
*/
@interface Solution (BinaryTree)

- (BOOL)isTree:(TreeNode *)rootNodeA sameAsTree:(TreeNode *)rootNodeB;
- (BOOL)isSymmetricTree:(TreeNode *)rootNode;

// 广度优先（层次遍历）
- (NSArray *)levelOrderTraversal:(TreeNode *)root;

// 深度优先（前序 root, left, right）
- (NSArray *)preorderTraversal:(TreeNode *)root;
// 中序
- (NSArray *)inorderTraversal:(TreeNode *)root;
// 后序
- (NSArray *)postorderTraversal:(TreeNode *)root;

@end
