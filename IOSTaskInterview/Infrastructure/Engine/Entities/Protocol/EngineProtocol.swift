//
//  EngineProtocol.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

protocol EngineProvider: AnyObject {
    

    func notifyWithTask(task: TaskModel, status: String)
    
}
