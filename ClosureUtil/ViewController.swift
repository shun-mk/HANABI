//
//  ViewController.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let items: [String] = ["1", "2", "3"]
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            GestureRecognizerUtil.addTapGestureRecognizer(to: button, target: self) { _ in
                print("aaa")
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.setClosureToDataSource(
                numberOfRowsInSection: { [weak self] (tableView, index) -> Int in
                    guard let `self` = self else { return 0 }
                    return self.items.count
            }, cellForRowAtIndexPath: { [weak self] (tableView, index) -> UITableViewCell in
                guard let `self` = self else { return UITableViewCell() }
                let title = self.items[index.row]
                let cell = UITableViewCell()
                cell.textLabel?.text = title
                return cell
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

