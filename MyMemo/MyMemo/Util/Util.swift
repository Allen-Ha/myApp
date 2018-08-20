//
//  Util.swift
//  MyMemo
//
//  Created by user on 2018. 8. 9..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import Foundation
import UIKit

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
    
//    func showCommonAlert(title: String, message: String) -> UIAlertController{
//        let alertController = UIAlertController(title: title,message: message, preferredStyle: UIAlertControllerStyle.alert)
//        
//        let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
//
//        alertController.addAction(cancelButton)
//
//        return alertController;
////        self.present(alertController,animated: true,completion: nil)
//    }
}


