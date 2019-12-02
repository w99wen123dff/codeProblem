//
//  DivideSimulator.swift
//  codeProblem
//
//  Created by w99wen on 2019/12/3.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

/*
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

 返回被除数 dividend 除以除数 divisor 得到的商。

 示例 1:

 输入: dividend = 10, divisor = 3
 输出: 3
 示例 2:

 输入: dividend = 7, divisor = -3
 输出: -2
 说明:

 被除数和除数均为 32 位有符号整数。
 除数不为 0。
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−2^31,  2^31 − 1]。本题中，如果除法结果溢出，则返回 2^31 − 1。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/divide-two-integers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class DivideSimulator: NSObject {
    let OVERFLOW:Int32 = Int32.max;
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if (dividend == 0) {
            return 0;
        } else if (dividend == Int32.min && divisor == -1){
            return Int(OVERFLOW);
        } else if (divisor == 1) {
            return dividend;
        } else {
            if dividend > 0 && divisor > 0{
                var result:Int = 0;
                var dividendTmp = dividend;
                while dividendTmp - divisor >= 0 {
                    result += 1;
                    dividendTmp -= divisor;
                }
                return result;
            } else if (dividend < 0 && divisor < 0) {
                var result:Int = 0;
                var dividendTmp = dividend;
                while dividendTmp - divisor <= 0 {
                    result += 1;
                    dividendTmp -= divisor;
                }
                return result;
            } else if (dividend < 0 && divisor > 0) {
                var result:Int = 0;
                var dividendTmp = dividend;
                while dividendTmp + divisor <= 0 {
                    result -= 1;
                    dividendTmp += divisor;
                }
                return result;
            } else if (dividend > 0 && divisor < 0) {
                var result:Int = 0;
                var dividendTmp = dividend;
                while dividendTmp + divisor >= 0 {
                    result -= 1;
                    dividendTmp += divisor;
                }
                return result;
            }
        }
        return Int(OVERFLOW);
    }
}
