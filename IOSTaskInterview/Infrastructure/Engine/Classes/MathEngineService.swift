//
//  MathEngineService.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

class MathEngineService: ServiceProvider {
    
    weak var engineProvider: EngineProvider?
    private var service: ServiceProtocol
    
    
    init() {
        service = BGService()
        self.service.serverProvider = self
    }
    
    init(service: ServiceProtocol) {
        self.service = service
        self.service.serverProvider = self
    }
    
    func getOperationCount () -> Int {
        return service.getTasksCount()
    }
    
    func getOperatorType(_ with: String?) -> OperatorType? {
        return OperatorType.init(rawValue: with ?? "")
    }
    
    func getOperations() -> [TaskModel] {
        return service.getTasks()
    }
    
    func startSolveEquation(_ equation: Question, after: Int) {
        let task = TaskModel.init(question: equation, delayTime: after)
        print(task.id, "new init")
        engineProvider?.notifyWithTask(task: task, status: "new init")
        service.addThreadFrom(task: task)
    }
    
}

extension MathEngineService {
    func taskDidAdd(task: TaskModel) {
        print(task.id, "add")
        engineProvider?.notifyWithTask(task: task, status: "add")
    }
    
    func taskDidCancelled(task: TaskModel) {
        print(task.id, "cancelled")
        engineProvider?.notifyWithTask(task: task, status: "cancelled")
    }
    
    func taskProcessing(task: TaskModel) {
        print(task.id, "processing")
        engineProvider?.notifyWithTask(task: task, status: "processing")
    }
    
    func taskDidFinish(task: TaskModel) {
        print(task.id, "finishined")
        engineProvider?.notifyWithTask(task: task, status: "fininsed")
    }
}
