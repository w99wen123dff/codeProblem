//
//  LetterCombinations.swift
//  codeProblem
//
//  Created by w99wen on 2019/11/30.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa
/*
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
     put("2", "abc");
     put("3", "def");
     put("4", "ghi");
     put("5", "jkl");
     put("6", "mno");
     put("7", "pqrs");
     put("8", "tuv");
     put("9", "wxyz");

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/solution/dian-hua-hao-ma-de-zi-mu-zu-he-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


 示例:

 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class LetterCombinations: NSObject {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return [];
        }
        var maps = [String:String]();
        maps["2"] = "abc";
        maps["3"] = "def";
        maps["4"] = "ghi";
        maps["5"] = "jkl";
        maps["6"] = "mno";
        maps["7"] = "pqrs";
        maps["8"] = "tuv";
        maps["9"] = "wxyz";
        var result = [String]();
        let digitsArray = Array(digits);
        LetterCombinationsV2("", digitsArray, 0, maps, &result);
        return result;
    }
    
    func LetterCombinationsV2(_ a:String, _ digitsArray:[Character],_ pos:Int, _ maps:[String:String], _ result: inout [String]) {
        if pos >= digitsArray.count {
            result.append(a);
        } else {
            let digit = digitsArray[pos];
            var key = "";
            key.append(digit);
            let tmp = Array(maps[key] ?? "");
            for character in tmp {
                var tmp2 = a;
                tmp2.append(character);
                LetterCombinationsV2(tmp2, digitsArray, pos + 1, maps, &result);
            }
        }
    }
}
