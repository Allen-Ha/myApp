//
//  FirstViewController.swift
//  MyMemo
//
//  Created by user on 2018. 8. 7..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    var realmManager : RealmManager = RealmManager.sharedInstence;
    
    @IBOutlet weak var textViewMemoContent: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnTextDelete: UIButton!
    @IBOutlet weak var lblSubject: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let fileManager = FileManager()
//
//        // document 디렉토리의 경로 저장
//        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//        // 해당 디렉토리 이름 지정
//        let dataPath = documentsDirectory.appendingPathComponent("data")
//
//        do {
//            // 디렉토리 생성
//            try fileManager.createDirectory(atPath: dataPath.path, withIntermediateDirectories: false, attributes: nil)
//
//        } catch let error as NSError {
//            print("Error creating directory: \(error.localizedDescription)")
//        }
//
//        do {
//            // 파일 이름을 기존의 경로에 추가
//            let helloPath = dataPath.appendingPathComponent("Hello.txt")
//
//            // 내용 읽기
//            let text = try String(contentsOf: helloPath, encoding: .utf8)
//
//            textViewMemoContent.text = text;
//        }
//        catch let error as NSError {
//            print("Error Reading File : \(error.localizedDescription)")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSaveAction(_ sender: Any) {
        print("btnSaveAction");
        
        let textContent = TextContent();
        textContent.date = Util.sharedInstence.getTodayString();
        textContent.text = textViewMemoContent.text!;
        
        if(!textViewMemoContent.text.isEmpty)
        {
            realmManager.addMemoData(textContent: textContent);
            lblSubject.text = "적절하게 입력";
        }
        else
        {
            lblSubject.text = "내용을 입력해라";
        }
        
        
//        if(!textViewMemoContent.text.isEmpty)
//        {
//            let fileManager = FileManager()
//
//            // document 디렉토리의 경로 저장
//            let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//            // 해당 디렉토리 이름 지정
//            let dataPath = documentsDirectory.appendingPathComponent("data")
//
//            do {
//                // 파일 이름을 기존의 경로에 추가
//                let helloPath = dataPath.appendingPathComponent("Hello.txt")
//
//                let text = textViewMemoContent.text!;
//
//                do {
//                    // 쓰기 작업
//                    try text.write(to: helloPath, atomically: false, encoding: .utf8)
//                }
//            } catch let error as NSError {
//                print("Error Writing File : \(error.localizedDescription)")
//            }
//        }
//        else
//        {
//            print("There are no characters in the text view!");
//        }
    }
    
    @IBAction func btnTextDeleteAction(_ sender: Any) {
        print("btnTextDeleteAction");
        
//        print("textContent = \(textViewMemoContent.text)")
        
        //텍스트 삭제
//        textViewMemoContent.text = "";
        
//        let realm = try! Realm();
        
//        try! realm.write {
//            realm.deleteAll();
//        }
        
//        let textContentResultList = realm.objects(TextContent.self).sorted(byKeyPath: "count", ascending: true);
//        print("textContentResultList = \(textContentResultList)");
//
//        let textContent = realm.objects(TextContent.self).sorted(byKeyPath: "count", ascending: true).first
//        self.textViewMemoContent.text = textContent?.text;
        
//        if (textContent != nil)
//        {
//            try! realm.write {
//                realm.delete(textContent!);
//            }
//        }
//        else
//        {
//            print("not found realm Data");
//        }
        
    }
}

