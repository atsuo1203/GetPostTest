//
//  ViewController.swift
//  GetPostTest
//
//  Created by Atsuo Yonehara on 2017/09/25.
//  Copyright © 2017年 Atsuo Yonehara. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func addButtonTapped(_ sender: UIButton) {
    }
    @IBOutlet weak var topTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //初期化
        topTableView.delegate = self
        topTableView.dataSource = self
        topTableView.estimatedRowHeight = 80
        topTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TopViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopTableViewCell
        cell.nameLabel.text = "takashi"
        cell.detailLabel.text = "大学生"
        return cell
    }
}
