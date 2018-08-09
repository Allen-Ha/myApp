//
//  Util.swift
//  MyMemo
//
//  Created by user on 2018. 8. 9..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import Foundation

class Util {
    static let sharedInstence : Util = {
        let instance = Util();
        return instance;
    } ()
    
    private init() {
    };
    
    func getTodayString() -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        let todayString = formatter.string(from: Date());
        
        return todayString;
    }
}


