//
//  HomeVC+TableView.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import Foundation
import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = presenter?.questions[indexPath.row]
        let task_id = "task id \(item?.id)"
        let number = "numbers \(item?.numbers.map{$0.description})"
        let operation = "operator \(item?.operatorEquation)"
        let status = "status \(item?.statusText)"
        let delaytime = "delayTime \(item?.delayTime)"
        let excuteTime = "excute date \(item?.excuteDate)"
        var fullText = task_id + "\n" + number + "\n" + operation + "\n" + status + "\n" + delaytime + "\n" + excuteTime
        if let res = item?.result {
            let result = "result \(res.description)"
            fullText = fullText + "\n" + result
        }
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = fullText
        return cell
    }
}

