//
//  ViewController.swift
//  CloudKitPractice
//
//  Created by Lena on 2022/07/21.
//

import CloudKit
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let database = CKContainer(identifier: "iCloud.iOS.cloudKitPractice").publicCloudDatabase
    
    @objc func saveItem(name: String) {
        let record = CKRecord(recordType: "GroceryItem") // record type 설정
        record.setValue(name, forKey: "name")
        database.save(record) { record, error in
            if record != nil, error == nil {
                print("saved")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Grocery List"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Item"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

