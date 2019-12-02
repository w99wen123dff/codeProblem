//
//  NoRepeatLongestSubString.swift
//  codeProblem
//
//  Created by w99wen on 2019/11/28.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class NoRepeatLongestSubString: NSObject {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if (s.count <= 1) {
            return s.count;
        }
        let charactersArray: Array = Array(s);
        var leftPos = 0;
        var length = 1;
        var targetPos = leftPos + length;
        var maxLeftPos = leftPos;
        var maxlength = length;
        
        while targetPos < charactersArray.count {
            let index = isContain(charactersArray, leftPos, length, targetPos);
            if index < 0 {
                length += 1;
                if length > maxlength {
                    maxLeftPos = leftPos;
                    maxlength = length;
                }
            } else {
                length = leftPos + length - index;
                leftPos = index + 1;
            }
            targetPos = leftPos + length;
        }
        return maxlength;
    }
    func isContain(_ charactersArray:Array<Character>, _ leftPos:Int, _ length:Int, _ targetPos:Int) -> Int {
        if leftPos < 0 {
            return -1;
        }
        if length <= 0 {
            return -1;
        }
        if leftPos + length >= charactersArray.count {
            return -1;
        }
        if targetPos >= charactersArray.count {
            return -1;
        }
        if let i = charactersArray[leftPos ..< leftPos + length].firstIndex(of: charactersArray[leftPos + length]) {
            return i;
        }
        return -1;
    }
}
