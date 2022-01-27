//
//  AddTaskVC.swift
//  IOSTaskInterview
//
//  Created by Mahmoud Zaki on 27/01/2022.
//

import UIKit

//FOR Save time i don't use any archiecture here just simple vc

class AddTaskVC: UIViewController {

    deinit {
        print("AddTaskVC deinit")
    }
    
    var didAddTask: (([Double],String,Int)->())?
    
    @IBOutlet weak var txtNumbers: UITextField!
    @IBOutlet weak var txtOperator: UITextField!
    @IBOutlet weak var delayTime: UITextField!
    
    @IBAction func addClicked(_ sender: Any) {
        if let time = getDelayTime() {
            if let numbers = getNumbers() {
                if let operatorEquation = getOperator() {
                    didAddTask?(numbers, operatorEquation,time)
                    self.dismiss(animated: true, completion: nil)
                }else {
                    showAlert("error operator")
                }
            }else {
                showAlert("error numbers")
            }
        }else {
            showAlert("error time")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(_ message: String) {
        let alertVC = UIAlertController.init(title: "error", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

}

extension AddTaskVC {
    
    func getNumbers() -> [Double]? {
        var arr = [Double]()
        let text = txtNumbers.text!
        for item in text.split(separator: ",") {
            if let number = Double(item) {
                arr.append(number)
            }else {
                return nil
            }
        }
        return arr
    }
    
    func getDelayTime () -> Int? {
        return Int(delayTime.text ?? "")
    }
    
    func getOperator () -> String? {
        if self.txtOperator.text == "+" ||
           self.txtOperator.text == "-" ||
            self.txtOperator.text == "*" ||
            self.txtOperator.text == "/" {
            return self.txtOperator.text
        }
        return nil
    }
}


//Router
extension AddTaskVC {
    static var storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    
    static func createVC() -> AddTaskVC {
        let vc = storyboard.instantiateViewController(withIdentifier: "AddTaskVC") as! AddTaskVC
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
}
