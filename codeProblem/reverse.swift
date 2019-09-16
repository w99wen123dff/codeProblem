//
//  reverse.swift
//  codeProblem
//
//  Created by 刘凡 on 2019/9/17.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

class reverse: NSObject {
    /*
     给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
     
     示例 1:
     输入: 123
     输出: 321
     
     示例 2:
     输入: -123
     输出: -321
     
     示例 3:
     输入: 120
     输出: 21
     注意:
     
     假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
     
     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/reverse-integer
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func reverse(_ x: Int) -> Int {
        var result:Int64 = 0;
        var absX:Int = x;
        var isPositive = true;
        if x < 0 {
            absX = 0 - x;
            isPositive = false;
        }
        while absX / 10 > 0 {
            let modLeft = absX % 10;
            absX = absX / 10;
            result = result * 10 + Int64(modLeft);
        }
        result = result * 10 + Int64(absX);
        if !isPositive {
            result = 0 - result;
        }
        if result > Int32.max || result < Int32.min {
            return 0;
        }else{
            return Int(result);
        }
    }
}
