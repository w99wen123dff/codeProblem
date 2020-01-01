//
//  Multiply.swift
//  codeProblem
//
//  Created by w99wen on 2020/1/2.
//  Copyright © 2020 刘凡. All rights reserved.
//

import Cocoa
/*
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。

 示例 1:

 输入: num1 = "2", num2 = "3"
 输出: "6"
 示例 2:

 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：

 num1 和 num2 的长度小于110。
 num1 和 num2 只包含数字 0-9。
 num1 和 num2 均不以零开头，除非是数字 0 本身。
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/multiply-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Multiply: NSObject {
    func multiply(_ num1: String, _ num2: String) -> String {
        var result = "";
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        var isNegetive = false;
        if num1.hasPrefix("-") {
            isNegetive = !isNegetive
        }
        
        if num2.hasPrefix("-") {
            isNegetive = !isNegetive
        }
        
        var n1 = "";
        var n2 = "";
        if num2.count < num1.count {
            n1 = String(num1.reversed());
            n2 = String(num2.reversed());
        } else {
            n1 = String(num2.reversed());
            n2 = String(num1.reversed());
        }
        
        var maxLength = 0;
        var midResults = [String]();
        for (i2, n1Character) in n2.enumerated() {
            var midValue = "";
            var risen = 0;
            for (_, n2Character) in n1.enumerated() {
                let result = mutiForNth(Int("\(n1Character)") ?? 0, Int("\(n2Character)") ?? 0, risen);
                risen = result.risen;
                midValue = "\(result.num)\(midValue)";
            }
            if risen > 0 {
                midValue = "\(risen)\(midValue)";
            }
            midValue += String(repeating: "0", count: i2);
            midResults.append(midValue);
            if midValue.count > maxLength {
                maxLength = midValue.count;
            }
        }
        
        var nthRisen = 0;
        for i in 0 ..< maxLength {
            var nthNumSum = 0;
            for midResult in midResults {
                if midResult.count > i {
                    let targetStringIndex = midResult.index(midResult.startIndex, offsetBy: midResult.count - 1 - i);
                    let charater = midResult[targetStringIndex];
                    nthNumSum += Int("\(charater)") ?? 0;
                }
            }
            nthNumSum += nthRisen;
            nthRisen = nthNumSum / 10;
            result = "\(nthNumSum % 10)\(result)"
        }
        if nthRisen > 0 {
            result = "\(nthRisen)" + result;
        }
        if isNegetive {
            result = "-" + result;
        }
        return result;
    }
    
    private func mutiForNth(_ n1: Int, _ n2: Int, _ risen: Int) -> (risen:Int, num:Int){
        var num = 0;
        var risen2 = 0;
        let N1N2 = n1 * n2 + risen;
        num = N1N2 % 10;
        risen2 = N1N2 / 10;
        return (risen2, num);
    }
}
