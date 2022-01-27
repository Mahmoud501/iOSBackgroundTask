//
//  Int+UniqueID.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

extension String {
    
    static func random(digits:Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}
