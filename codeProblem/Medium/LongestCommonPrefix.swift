//
//  LongestCommonPrefix.swift
//  codeProblem
//
//  Created by 刘凡 on 2019/9/26.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 */
class LongestCommonPrefix: NSObject {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return "";
        }else if strs.count == 1 {
            return strs[0];
        }
        var minLen = strs[0].count;
        var result = [Character]();
        for str in strs {
            if minLen > str.count{
                minLen = str.count;
            }
        }
        for i in 0..<minLen {
            let firstStr = strs[0];
            let strIndex = firstStr.index(firstStr.startIndex, offsetBy: i);
            let c = firstStr[strIndex];
            var equal = true;
            for (index, value) in strs.enumerated() {
                if index == 0 {
                    continue;
                }
                let c2 = value[strIndex];
                if c != c2{
                    equal = false;
                    break;
                }
            }
            if equal {
                result.append(c);
            }else{
                break;
            }
        }
        
        return String(result);
    }
}
