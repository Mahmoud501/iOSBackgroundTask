//
//  BGService.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation
import UIKit

class BGService: ServiceProtocol {
        
    weak var serverProvider: ServiceProvider?
    
    var tasks: [String: TaskModel] = [:]
    var bgServices: [String: UIBackgroundTaskIdentifier] = [:]
    
    func getTasksCount() -> Int {
        return tasks.keys.count
    }
    
    func getTasks() -> [TaskModel] {
        return Array(tasks.values)
    }
    
    func addThreadFrom(task: TaskModel) {
        task.status = .pendding
        task.excuteDate = task.createdDate.addingTimeInterval(TimeInterval(task.delayTime))
        tasks[task.id] = task
        self.excuteService(task: task)
        serverProvider?.taskDidAdd(task: task)

    }
    
    internal func excuteService(task: TaskModel) {
        let bgIdentifier = excuteServiceWithBG(task: task)
        self.bgServices[task.id] = bgIdentifier
    }
    
    private func excuteServiceWithBG(task: TaskModel) -> UIBackgroundTaskIdentifier {
        let bgIdentifier = UIApplication.shared.beginBackgroundTask(withName: task.id) { [weak self] in
            guard let self = self else { return }
            task.status = .cancelled
            if let bgService = self.bgServices[task.id] {
                UIApplication.shared.endBackgroundTask(bgService)
                self.bgServices[task.id] = nil
            }
            self.tasks[task.id] = nil
            self.serverProvider?.taskDidCancelled(task: task)
        }
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + TimeInterval.init(task.delayTime)) {
           DispatchQueue.main.async { [weak self] in
               guard let self = self else { return }
               task.status = .processing
               self.serverProvider?.taskProcessing(task: task)
               task.excuteTask()
               task.status = .finished
               UIApplication.shared.endBackgroundTask(bgIdentifier)
               self.bgServices[task.id] = nil
               self.tasks[task.id] = nil
               self.serverProvider?.taskDidFinish(task: task)
           }
       }
        return bgIdentifier
    }

    
}
