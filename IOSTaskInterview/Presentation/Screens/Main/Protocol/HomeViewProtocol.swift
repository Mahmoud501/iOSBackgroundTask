//
//  HomeViewProtocol.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    
    func updateConsoleWith(str: String)
    func updateTaskList()
    
}
