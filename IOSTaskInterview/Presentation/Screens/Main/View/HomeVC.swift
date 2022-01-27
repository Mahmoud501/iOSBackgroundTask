//
//  HomeVC.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import UIKit

class HomeVC: UIViewController {

    //variables
    var presenter: HomePresenter? = HomePresenter()
    
    //Outlets
    @IBOutlet weak var lblNumberOfOperation: UILabel!
    @IBOutlet weak var txtConsole: UITextView!
    @IBOutlet weak var TVTasks: UITableView!
    
    //Actions
    @IBAction func addTask(_ sender: Any) {
        let vc = AddTaskVC.createVC()
        vc.didAddTask = { [weak self] (numbers,operate, time) in
            guard let self = self else { return }
            let question = QuestionModel()
            question.numbers = numbers
            question.operatorEquation = operate
            self.presenter?.startOperation(question: question, after: time)
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func ClearConsole(_ sender: Any) {
        self.txtConsole.text = "Console...\n"
    }
}


//LifeCycle
extension HomeVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.delegate = self
    }
}


// another Logic
extension HomeVC {
    
    func setupUI() {
        self.txtConsole.text = "Console...\n"
    }
    
}
