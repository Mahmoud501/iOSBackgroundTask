//
//  ServiceProtocol.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

protocol ServiceProtocol {
    
    var serverProvider: ServiceProvider? { get set }
    
    func getTasks() -> [TaskModel]
    func getTasksCount() -> Int
    func addThreadFrom(task: TaskModel)
    func excuteService(task: TaskModel)
    
    
}


protocol ServiceProvider: AnyObject {
    
    func taskDidAdd(task: TaskModel)
    func taskDidCancelled(task: TaskModel)
    func taskProcessing(task: TaskModel)
    func taskDidFinish(task: TaskModel)
    
}
