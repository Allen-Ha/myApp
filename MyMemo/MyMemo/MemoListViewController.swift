//
//  SecondViewController.swift
//  MyMemo
//
//  Created by user on 2018. 8. 7..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import UIKit
import RealmSwift

class MemoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realmManager : RealmManager = RealmManager.sharedInstence;
    
    var memoDataArray :Results<TextContent>?;
    
    @IBOutlet weak var MemoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MemoTableView.delegate = self;
        self.MemoTableView.dataSource = self;
        self.setupMemoData();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.MemoTableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupMemoData() {
        self.memoDataArray = realmManager.getAllMemoData();
        self.MemoTableView.reloadData();
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memoDataArray!.count;
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one        
        let cell = self.MemoTableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        
        // set the text from the data model
        cell.textLabel?.text = self.memoDataArray![indexPath.row].date;
        
        return cell;
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row)");
        
        //데이터 저장
        let tabController = self.tabBarController as! MemoTabViewController;
        tabController.selectTextContent = self.memoDataArray![indexPath.row];
    }
}

