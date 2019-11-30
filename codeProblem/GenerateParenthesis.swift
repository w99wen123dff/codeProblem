//
//  GenerateParenthesis.swift
//  codeProblem
//
//  Created by w99wen on 2019/11/30.
//  Copyright © 2019 刘凡. All rights reserved.
//

import Cocoa

class GenerateParenthesis: NSObject {
    func generateParenthesis(_ n: Int) -> [String] {
        if n <= 0 {
            return [];
        } else if n == 1 {
            return ["()"];
        }
        var result = [String]();
        generateParenthesisV2("", n, n, &result);
        return result;
    }
    
    func generateParenthesisV2(_ str:String, _ LL:Int, _ LR:Int, _ result:inout [String]) {
        if LL <= 0 && LR <= 0 {
            result.append(str);
            return;
        }
        if LL > 0 {
            generateParenthesisV2(str + "(", LL - 1, LR, &result);
        }
        
        if LR > 0 && LR > LL {
            generateParenthesisV2(str + ")", LL, LR - 1, &result);
        }
    }
}
