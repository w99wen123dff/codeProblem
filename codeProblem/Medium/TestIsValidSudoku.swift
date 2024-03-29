//
//  TestIsValidSudoku.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/13.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

/*
 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
 
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 
 
 上图是一个部分填充的有效的数独。
 
 数独部分空格内已填入了数字，空白格用 '.' 表示。
 https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png
 示例 1:
 
 输入:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 输出: true
 示例 2:
 
 输入:
 [
   ["8","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 输出: false
 解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
 但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
 说明:
 
 一个有效的数独（部分已被填充）不一定是可解的。
 只需要根据以上规则，验证已经填入的数字是否有效即可。
 给定数独序列只包含数字 1-9 和字符 '.' 。
 给定数独永远是 9x9 形式的。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-sudoku
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class TestIsValidSudoku: NSObject {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var horionInfo :[[Character:Int]] = Array(repeatElement(Dictionary(), count: 9));
        var verticalInfo :[[Character:Int]] = Array(repeatElement(Dictionary(), count: 9));
        var sectionInfo :[[Character:Int]] = Array(repeatElement(Dictionary(), count: 9));
        for (index_i, value_i) in board.enumerated() {
            for (index_j, value_j) in value_i.enumerated() {
                if value_j == "." {
                    continue;
                } else if value_j > "9" || value_j < "0" {
                    return false;
                } else {
                    if let count = horionInfo[index_i][value_j] {
                        if count > 0 {
                            return false;
                        }
                    } else {
                        horionInfo[index_i][value_j] = 1;
                    }
                    
                    if let count = verticalInfo[index_j][value_j] {
                        if count > 0 {
                            return false;
                        }
                    } else {
                        verticalInfo[index_j][value_j] = 1;
                    }
                    
                    let tmp = (index_i / 3) + (index_j / 3) * 3;
                    if let count = sectionInfo[tmp][value_j] {
                        if count > 0 {
                            return false;
                        }
                    } else {
                        sectionInfo[tmp][value_j] = 1;
                    }
                }
            }
        }
        return true;
    }
    
    
}
