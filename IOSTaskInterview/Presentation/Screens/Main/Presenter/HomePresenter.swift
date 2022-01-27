//
//  HomePresenter.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

class HomePresenter {
    
    var questions: [QuestionModel] = []
    //i don't support more engine for now so i depended on mathengine only
    private var engine = MathEngineService()
    
    // protocol
    weak var delegate: HomeViewProtocol?
    
    init() {
        engine.engineProvider = self
    }
    
    func startOperation(question: QuestionModel?, after: Int) {
        if let questionOperator = engine.getOperatorType(question?.operatorEquation) {
            if let numbers = question?.numbers {
                let engineQuestion = NormalEquation.init(numbers:  numbers, questionOperator)
                engine.startSolveEquation(engineQuestion, after: after)
            }else {
                delegate?.updateConsoleWith(str: "Can't add service: numbers is empty")
            }
        }else {
            delegate?.updateConsoleWith(str: "Can't add service: Operator not correct")
        }
    }
    
    func getOperationCount() -> Int {
        return engine.getOperationCount()
    }

}

extension HomePresenter: EngineProvider {
    func notifyWithTask(task: TaskModel, status: String) {
        let taskQuestion = task.question as? NormalEquation
        if task.status == .pendding {
            let newQuestion = QuestionModel()
            newQuestion.id = task.id
            newQuestion.operatorEquation = taskQuestion?.operatorEquation.rawValue
            newQuestion.statusText = task.status.rawValue
            newQuestion.delayTime = task.delayTime
            newQuestion.createdDate = task.createdDate.description
            newQuestion.excuteDate = task.excuteDate?.description
            newQuestion.numbers = taskQuestion?.numbers
            self.questions.append(newQuestion)
        }else {
            _ = self.questions.map({ question in
                if (task.id == question.id) {
                    question.statusText = task.status.rawValue
                    question.result = taskQuestion?.result
                }
            })
        }
        delegate?.updateConsoleWith(str: "taskID\(task.id) is \(status)")
        delegate?.updateTaskList()
    }
    
}
