//
//  RealmManager.swift
//  MyMemo
//
//  Created by user on 2018. 8. 9..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    let realm = try! Realm()
    
    static let sharedInstence : RealmManager = {
        let instance = RealmManager();
        return instance;
    } ()
    
    private init() {
    };
    
    
    func addMemoData(textContent: TextContent) {
        try! realm.write {
            realm.add(textContent);
        }
    }
    
    func removeMemoData(textContent: TextContent) {
        try! realm.write {
            realm.delete(textContent);
        }
    }
    
    func removeAllMemoData() {
        try! realm.write {
            realm.deleteAll();
        }
    }
}
