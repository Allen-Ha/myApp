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
        try! self.realm.write {
            self.realm.add(textContent);
        }
    }
    
    func updateMemoData(textContent: TextContent) {
        let previousTextContents = realm.objects(TextContent.self).filter("date = %@", textContent.date);
        let previousTextContent = previousTextContents.first;
        try! self.realm.write {
            previousTextContent?.text = textContent.text;
            previousTextContent?.date = textContent.date;
        }
    }
        
    func removeMemoData(textContent: TextContent) {
        try! self.realm.write {
            self.realm.delete(textContent);
        }
    }
    
    func removeAllMemoData() {
        try! self.realm.write {
            self.realm.deleteAll();
        }
    }
    
    func getAllMemoData() -> Results<TextContent> {
//        var textContentResultList : Results<TextContent>?;
//        try! self.realm.write {
//            textContentResultList = realm.objects(TextContent.self).sorted(byKeyPath: "date", ascending: true);
//        }
        
        let textContentResultList = realm.objects(TextContent.self).sorted(byKeyPath: "date", ascending: true);
        return textContentResultList;
    }
}
