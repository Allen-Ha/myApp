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
        
//        self.MemoTableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        
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
    
    
    //Local Func
    
    func setupMemoData() {
        self.memoDataArray = self.realmManager.getAllMemoData();
        self.MemoTableView.reloadData();
    }
    
    func showMemoView(textContent: TextContent?, isModify: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "MemoView") as! MemoViewController;
        if(textContent != nil)
        {
            vc.selectTextContent = textContent!;
        }
        else
        {
            print("new memo!!");
        }
        vc.isModify = isModify;
        self.present(vc, animated: true, completion: nil);
    }
    
    //TableView Delegate
    
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
        self.showMemoView(textContent: self.memoDataArray![indexPath.row], isModify: true);
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete)
        {
            self.realmManager.removeMemoData(textContent: self.memoDataArray![indexPath.row]);
            self.setupMemoData();
        }
    }
    
    
    //Action
    
    @IBAction func btnWriteAction(_ sender: Any) {
        self.showMemoView(textContent: nil, isModify: false);
    }
    
    @IBAction func btnEditAction(_ sender: UIBarButtonItem) {
        
        if(self.memoDataArray!.count > 0)
        {
            if (self.MemoTableView.isEditing)
            {
                sender.title = "변경";
                self.MemoTableView.setEditing(false, animated: true);
            }
            else
            {
                sender.title = "완료";
                self.MemoTableView.setEditing(true, animated: true);
            }
        }
    }
}

