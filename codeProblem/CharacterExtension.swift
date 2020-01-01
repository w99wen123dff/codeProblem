//
//  CharactorExtension.swift
//  codeProblem
//
//  Created by w99wen on 2020/1/1.
//  Copyright © 2020 刘凡. All rights reserved.
//

import Foundation
extension Character
{
    func toInt() -> Int
    {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars
        {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter
    }
}
