//
//  Solution.swift
//  codeProblem
//
//  Created by 刘凡 on 2019/9/17.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

class Solution: NSObject {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false;
        }else if x < 10 {
            return true;
        }else{
            let xStr = Array(String(x));
            var lp = 0;
            var rp = xStr.count - 1;
            while rp > lp {
                if xStr[lp] != xStr[rp]{
                    return false;
                }else{
                    lp += 1;
                    rp -= 1;
                }
            }
        }
        return true;
    }
    
    func isPalindrome2(_ x: Int) -> Bool {
        var tmp = x;
        if tmp < 0 {
            return false;
        }else if tmp < 10 {
            return true;
        }else{
            var reversedX = 0;
            while tmp / 10 > 0 {
                reversedX = reversedX * 10 + (tmp % 10);
                tmp = tmp / 10;
            }
            reversedX = reversedX * 10 + tmp;
            
            if(reversedX == x){
                return true;
            }else{
                return false;
            }
        }
    }
}
