//
//  NormalEquation.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation


class NormalEquation: Question {

    var numbers: [Double]
    var operatorEquation: OperatorType
    var result: Double?
    
    init(numbers: [Double],_ _operator: OperatorType) {
        self.numbers = numbers
        self.operatorEquation = _operator
    }

    func printDetails() {
        print("this is normal equetion that take numbers and one operator")
    }
    
    func solve() -> String {
        switch operatorEquation {
        case .add:
            self.result = numbers.reduce(0, +)
            return result!.description
        case .div:
            self.result = numbers.reduce(1, /)
            return result!.description
        case .sub:
            self.result = numbers.reduce(0, -)
            return result!.description
        case .mul:
            self.result = numbers.reduce(1, *)
            return result!.description
        }
    }
    
}
