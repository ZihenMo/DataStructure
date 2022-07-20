//
// Created by 墨子痕 on 2021/7/14.
// Copyright (c) 2021 Hutter. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "DSTreeNode+ValidBST.h"
#import "DSTreeNode+Traverse.h"
#import "DSTreeNode.h"
#import <vector>
#import <string>
#import "DSTreeNode+PathSum.h"
#import "DSTreeNode+Bracket.h"
#import <iostream>
#import "DSTreeNode+Queen.h"
#import "DSTreeNode+Sudoku.h"

using namespace std;

@interface DSTestTree : XCTestCase

@end

@implementation DSTestTree

#pragma mark - 二叉树遍历

void printVector(vector<int> vector) {
    printf("{");
    for (int v : vector) {
        printf(" %d", v);
    }
    printf(" }\n");
}

- (void)testTreeTraverse1 {
    vector<int> nodes = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
    CTreeNode *tree = constructTree(nodes);
    tree_print(tree);
    auto preorder = tree_preorder(tree);
    auto inorder = tree_inorder(tree);
    auto postorder = tree_postOrder(tree);
    auto levelOrder = tree_levelOrder(tree);

    printVector(preorder);
    printVector(inorder);
    printVector(postorder);
    printVector(levelOrder);
}

/// 栈遍历二叉树
- (void)testTreeTraverse2 {
    vector<int> nodes = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
    CTreeNode *tree = constructTree(nodes);
    tree_print(tree);
    tree_preorder_stack(tree);
    tree_inorder_stack(tree);
    tree_postorder_stack(tree);
}

#pragma mark - 验证BST

- (void)testValidBST {
    vector<int> nodes1 = {5, 1, 4, TreeNodeNULL, TreeNodeNULL, 3, 6};
    vector<int> nodes2 = {2, 1, 3};
    CTreeNode *tree1 = constructTree(nodes1);
    CTreeNode *tree2 = constructTree(nodes2);
    ValidBST *solution = new ValidBST();
    XCTAssertFalse(solution->isValidBST(tree1));
    XCTAssertTrue(solution->isValidBST(tree2));

}

#pragma mark - 路径和

- (void)testPathSum {
    PathSum pathSum;
    vector<int> nodes = {5, 4, 8, 11, TreeNodeNULL, 13, 4, 7, 2, TreeNodeNULL, TreeNodeNULL, TreeNodeNULL, 1};
    int target = 22;
    CTreeNode *tree = constructTree(nodes);
    bool result = pathSum.tree_hasPathSum_DFS(tree, target);
    XCTAssertTrue(result);
}

- (void)testPathSum2 {
    PathSum pathSum;
    vector<int> nodes = {5,
            4, 8,
            11, TreeNodeNULL, 13, 4,
            7, 2, TreeNodeNULL, TreeNodeNULL, 5, 1};
    int target = 22;
    CTreeNode *tree = tree_construct(nodes);
    auto result = pathSum.pathSum_DFS(tree, target);
    for (auto v : result) {
        printVector(v);
    }
}


#pragma mark - 22.生成括号

- (void)testGenBracket {
    Bracket *solution = new Bracket();
    int n = 3;
    auto result = solution->generateParenthesis(n);
    vector<string> answer= {"((()))", "(()())", "(())()", "()(())", "()()()"};
    for (auto s : result) {
        cout << s << endl;
    }
    XCTAssertEqual(result, answer);

}

#pragma mark - 51.N皇后
- (void)testNQueen {
    Queen *queen = new Queen();
    auto result = queen->solveNQueens(4);
    for (vector<string> v : result) {
        for (string s : v) {
            cout << s << endl;
        }
        cout << endl;
    }
}

#pragma mark - 39.数独
- (void)testSudoku {
    Sudoku *solution = new Sudoku();
    vector<vector<char> > sudoku = {
            {'5','3','.','.','7','.','.','.','.'},
            {'6','.','.','1','9','5','.','.','.'},
            {'.','9','8','.','.','.','.','6','.'},
            {'8','.','.','.','6','.','.','.','3'},
            {'4','.','.','8','.','3','.','.','1'},
            {'7','.','.','.','2','.','.','.','6'},
            {'.','6','.','.','.','.','2','8','.'},
            {'.','.','.','4','1','9','.','.','5'},
            {'.','.','.','.','8','.','.','7','9'}
    };
    solution->solveSudoku(sudoku);
    cout << "---SUDOKU---" << endl;
    for (auto row : sudoku) {
        for (auto c : row) {
            cout << c << " ";
        }
        cout << endl;
    }
}
@end
