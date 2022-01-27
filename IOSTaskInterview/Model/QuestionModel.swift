//
//  QuestionModel.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

//Model for User and application not related with engine model
//so if engine model change my ui/app model not changed
class QuestionModel {
    var id: String?
    var numbers: [Double]?
    var operatorEquation: String?
    var result: Double?
    var delayTime: Int?
    var createdDate: String?
    var excuteDate: String?
    var statusText: String?

    
}
