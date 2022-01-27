//
//  TaskModel.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

class TaskModel {
    var id: String
    var question: Question
    var delayTime: Int
    var createdDate: Date = Date.now
    var excuteDate: Date?
    var status: TaskStatus = .new
    
    init(question: Question, delayTime: Int) {
        self.id = String.random(digits: 6)
        self.question = question
        self.delayTime = delayTime
    }
    
    func reschedualeTask() {
        //
    }
    
    func excuteTask() {
        let taskExcuted = question.solve()
        print("excuted task in background",taskExcuted)
    }
    
    
}
