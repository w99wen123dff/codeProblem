//
//  GroupAnagrams.swift
//  codeProblem
//
//  Created by w99wen on 2020/1/1.
//  Copyright © 2020 刘凡. All rights reserved.
//

import Cocoa

/*
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。

 示例:

 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
 输出:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 说明：

 所有输入均为小写字母。
 不考虑答案输出的顺序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/group-anagrams
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class GroupAnagrams: NSObject {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var tmp = [String : [String]]();
        for str in strs {
            let key = stringToHashString(str);
            if var values = tmp[key] {
                values.append(str);
                tmp[key] = values;
            } else {
                var values = [String]();
                values.append(str)
                tmp[key] = values;
            }
        }
        return Array(tmp.values);
    }
    
    private func stringToHashString(_ str: String) -> String {
        return mapToHashString(stringToMap(str));
    }
    
    private func stringToMap(_ str: String) -> Dictionary<Character, Int> {
        var result = [Character: Int]();
        let charactors = Array(str)
        
        for charactor in charactors {
            let count = result[charactor] ?? 0
            result[charactor] = count + 1;
        }
        return result;
    }
    
    private func mapToHashString(_ info: Dictionary<Character, Int>) -> String {
        var result = "";
        let numberFromA = ("a" as Character).toInt();
        let numberFromZ = ("z" as Character).toInt();
        for item in numberFromA ... numberFromZ {
            let key = intToCharater(item);
            let count = info[key] ?? 0;
            result += "#\(count)"
        }
        return result;
    }
    
    /// Int转Character代码
    /// - Parameter number: number是一个整数
    private func intToCharater(_ number: Int) -> Character {
        //转换成character字符
        let character = Character(UnicodeScalar(number) ?? "A")
        return character;
    }
    
}
