//
//  AddViewController.swift
//  GetPostTest
//
//  Created by Atsuo Yonehara on 2017/09/25.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBAction func backButtonTaped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sendButtonTaped(_ sender: UIButton) {
        guard let name = nameTextField.text?.description else {
            return
        }
        let description = descriptionTextView.text.description
        print(name)
        print(description)
    }
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
