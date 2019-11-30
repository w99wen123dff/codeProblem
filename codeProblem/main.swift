//
//  main.swift
//  codeProblem
//
//  Created by 刘凡 on 2019/9/16.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Foundation

//print("Hello, World!")
//let result = TwoSum().twoSum([7, 7, 2, 11, 15], 9);
//print("result = \(result)");
//
//let result2 = Reverse().reverse(123);
//print("result = \(result2)");
//
//
//let result3 = Solution().isPalindrome(121);
//print("result = \(result3)");
//
//let result4 = RomanToInteger().romanToInt("MCMXCIV");
//print("result = \(result4)");
//
//let result5 = LongestCommonPrefix().longestCommonPrefix(["flower","flow","flight"]);
//print("result = \(result5)");
//
//for i in 0..<5{
//    print("i = \(i)");
//}
//
//let arrTmp = [1, 2, 3, 4, 5];
//let arr1 = [Int]()
//
//
//for name in arrTmp[0..<arrTmp.count]{
//    print("i = \(name)");
//}
//
//let str = """
//   012\
//    123
//    234
//    345
//   """;
//print(str);
//
//
//var variableString = "Horse";
//var variableStringCopy = variableString;
//variableString += " and carriage";
//print(variableString.utf8);
//print(variableStringCopy)


//let tmp1:NoRepeatLongestSubString = NoRepeatLongestSubString();
//print(tmp1.lengthOfLongestSubstring("abcabcbb"));
//print(tmp1.lengthOfLongestSubstring("bbbbb"));
//print(tmp1.lengthOfLongestSubstring("pwwkew"));
//print(tmp1.lengthOfLongestSubstring("bbtablud"));
//print(tmp1.lengthOfLongestSubstring("aa"));

//let tmp2:IntToRoman = IntToRoman();
//print(tmp2.intToRoman(3))
//print(tmp2.intToRoman(4))
//print(tmp2.intToRoman(9))
//print(tmp2.intToRoman(58))
//print(tmp2.intToRoman(1994))


//let tmp3 = MergeSort();
//var nums = [2, 1, 4, 3, 6, 10, 8, 7, 5, 11, 14, 13, 20, 19];
//tmp3.mergeSort(&nums);
//print(nums);

//let tmp4 = LetterCombinations();
//print(tmp4.letterCombinations("2345"));

func buildLinks() -> ListNode? {
    let values = [1,2,3,4,5,6,7,8,9,10];
    let head = ListNode(values[0]);
    var formerNode:ListNode? = head;
    for value in values[1 ..< values.count] {
        let node = ListNode(value);
        if let formerNode2 = formerNode {
            formerNode2.next = node;
        }
        formerNode = node;
    }
    return head;
}

let tmp5 = RemoveNthFromEnd();
tmp5.removeNthFromEnd(buildLinks(), 7);

