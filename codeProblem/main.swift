//
//  main.swift
//  codeProblem
//
//  Created by 刘凡 on 2019/9/16.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Foundation

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


func printLinkNode(_ str:String, _ head:ListNode?) {
    if let head2 = head {
        printLinkNode("\(str.count > 0 ? "\(str) -> " : "")\(head2.val)", head2.next);
    } else {
        print(str);
    }
}

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

//let tmp5 = RemoveNthFromEnd();
//tmp5.removeNthFromEnd(buildLinks(), 7);

//let tmp6 = GenerateParenthesis();
//print(tmp6.generateParenthesis(3));

//let tmp7 = SwapPairs();
//var headNode:ListNode? = buildLinks();
//headNode = tmp7.swapPairs(headNode);
//printLinkNode("", headNode);


//let tmp8 = DivideSimulator();
//print(tmp8.divide(Int(Int32.min), -1));
//print(tmp8.divide(Int(Int32.max), 1));
//
//var a = 8;
//var b = 1;
//print(tmp8.divide(a, b));
//print(tmp8.divide(a, -b));
//print(tmp8.divide(-a, b));
//print(tmp8.divide(-a, -b));
//
//a = 9;
//b = 2;
//print(tmp8.divide(a, b));
//print(tmp8.divide(a, -b));
//print(tmp8.divide(-a, b));
//print(tmp8.divide(-a, -b));

//print(tmp8.divide(-2147483648, -1));

//do {
//    let tmp9 = NextPermutation();
//    var nums = [1,3,2];
//    tmp9.nextPermutation(&nums);
//    print(nums);
//}

//do {
//    let tmp = ArraySearchNoRepeatNum();
//    let nums = [4,5,-2,-1,0,1,2];
//    let target = 1;
//    print(tmp.search(nums, target));
//}

//do {
//    let tmp = ArraySearchRange();
//    let nums = [5,7,7,8,8,10];
//    let target = 8;
//    print(tmp.searchRange(nums, target));
//}


//do {
//    let tmp = TestIsValidSudoku();
//    let nums:[[Character]] = [
//      ["5","3",".",".","7",".",".",".","."],
//      ["6",".",".","1","9","5",".",".","."],
//      [".","9","8",".",".",".",".","6","."],
//      ["8",".",".",".","6",".",".",".","3"],
//      ["4",".",".","8",".","3",".",".","1"],
//      ["7",".",".",".","2",".",".",".","6"],
//      [".","6",".",".",".",".","2","8","."],
//      [".",".",".","4","1","9",".",".","5"],
//      [".",".",".",".","8",".",".","7","9"]
//    ];
//    print(tmp.isValidSudoku(nums));
//}


do {
    let tmp = CombinationSum();
    let nums = [2,3,6,7];
    let target = 7;
    print(tmp.combinationSum(nums, target));
}


do {
    @propertyWrapper
    struct SmallNumber {
        private var number = 0
        var projectedValue = false
        var wrappedValue: Int {
            get { return number }
            set {
                if newValue > 12 {
                    number = 12
                    projectedValue = true
                } else {
                    number = newValue
                    projectedValue = false
                }
            }
        }
    }
    struct SomeStructure {
        @SmallNumber var someNumber: Int
    }
    var someStructure = SomeStructure()
    
    someStructure.someNumber = 4
    print(someStructure.$someNumber)
    // 打印 "false"
    
    someStructure.someNumber = 55
    print(someStructure.$someNumber)
    // 打印 "true"
}

//do {
//    let tmp = CombinationSumV2();
//    let nums = [10,1,2,7,6,1,5];
//    let target = 8;
//    print(tmp.combinationSum2(nums, target));
//}

//do {
//    let tmp = Permute();
//    print(tmp.permute([1,2,3]));
//}

//do {
//    let temp = PermuteUnique();
//    print(temp.permuteUnique([1,1,2]));
//}

//do {
//    let temp = GroupAnagrams();
//    print(temp.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]));
//}


do {
    let temp = Multiply();
    print(temp.multiply("123", "456"));
}
