//
//  main.swift
//  codeProblem
//
//  Created by 刘凡 on 2019/9/16.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Foundation

print("Hello, World!")
let result = TwoSum().twoSum([7, 7, 2, 11, 15], 9);
print("result = \(result)");

let result2 = Reverse().reverse(123);
print("result = \(result2)");


let result3 = Solution().isPalindrome(121);
print("result = \(result3)");

let result4 = RomanToInteger().romanToInt("MCMXCIV");
print("result = \(result4)");

let result5 = LongestCommonPrefix().longestCommonPrefix(["flower","flow","flight"]);
print("result = \(result5)");

for i in 0..<5{
    print("i = \(i)");
}

let arrTmp = [1, 2, 3, 4, 5];
let arr1 = [Int]()


for name in arrTmp[0..<arrTmp.count]{
    print("i = \(name)");
}

let str = """
   012\
    123
    234
    345
   """;
print(str);


var variableString = "Horse";
var variableStringCopy = variableString;
variableString += " and carriage";
print(variableString.utf8);
print(variableStringCopy)
