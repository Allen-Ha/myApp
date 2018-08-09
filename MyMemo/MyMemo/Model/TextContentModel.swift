//
//  TextContentModel.swift
//  MyMemo
//
//  Created by user on 2018. 8. 9..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import Foundation
import RealmSwift

class TextContent: Object {
    @objc dynamic var date = "";
    @objc dynamic var text = "";
}
