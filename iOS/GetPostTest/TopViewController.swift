//
//  ViewController.swift
//  GetPostTest
//
//  Created by Atsuo Yonehara on 2017/09/25.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Add", bundle: nil)
        let next = storyboard.instantiateInitialViewController() as! AddViewController
        self.present(next, animated: true, completion: nil)
    }
    @IBOutlet weak var topTableView: UITableView!
    
    var users = Users()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //初期化
        topTableView.delegate = self
        topTableView.dataSource = self
        topTableView.estimatedRowHeight = 80
        topTableView.rowHeight = UITableViewAutomaticDimension
        getRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRequest(){
        Alamofire.request("http://127.0.0.1:5000/").responseJSON { (response) in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            json.forEach { (_, json) in
                let user = User()
                user.name = json["name"].description
                user.description = json["description"].description
                self.users.userList.append(user)
            }
            self.topTableView.reloadData()
        }
    }
}

extension TopViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopTableViewCell
        cell.nameLabel.text = users.userList[indexPath.row].name.description
        cell.descriptionLabel.text = users.userList[indexPath.row].description.description
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.users.userList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
