//
//  FirstViewController.swift
//  MyMemo
//
//  Created by user on 2018. 8. 7..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    let realmManager : RealmManager = RealmManager.sharedInstence;
    
    @IBOutlet weak var textViewMemoContent: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnTextDelete: UIButton!
    @IBOutlet weak var lblSubject: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tabController = self.tabBarController as! MemoTabViewController;
        
        //공용 저장소 데이터가 있으면 유저가 선택했으므로 화면에 뿌려준다.
        if(tabController.selectTextContent.date.count > 0)
        {
            self.textViewMemoContent.text = tabController.selectTextContent.text;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSaveAction(_ sender: Any) {
        print("btnSaveAction");
        
        let textContent = TextContent();
        textContent.date = Util.sharedInstence.getTodayString();
        textContent.text = self.textViewMemoContent.text!;
        
        if(!self.textViewMemoContent.text.isEmpty)
        {
            self.realmManager.addMemoData(textContent: textContent);
            self.lblSubject.text = "적절하게 입력";
        }
        else
        {
            self.lblSubject.text = "내용을 입력해라";
        }
    }
    
    @IBAction func btnTextDeleteAction(_ sender: Any) {
        print("btnTextDeleteAction");
        
        let tabController = self.tabBarController as! MemoTabViewController;

        //업데이트 테스트
        if(tabController.selectTextContent.date.count > 0)
        {
            let textContent = TextContent();
            textContent.date = tabController.selectTextContent.date;
            textContent.text = self.textViewMemoContent.text!;
            
            //tabController에 있는 램에서 직접 가져온 데이터를 수정하려고 하면 트랜잭션 오류가 발생한다.
            self.realmManager.updateMemoData(textContent: textContent);
        }
        
    }
        
        
        //다른 탭에서 데이터 가져오기
//        let tbCon = self.tabBarController  as! MemoTabViewController;
//        let listViewCon = tbCon.viewControllers?[1] as! MemoListViewController;
//        print("listViewCon.testData = \(listViewCon.testData)");
        
                
//        print("textContent = \(textViewMemoContent.text)")
        
        //텍스트 삭제
//        textViewMemoContent.text = "";
        
        
//        let textContentResultList = realm.objects(TextContent.self).sorted(byKeyPath: "count", ascending: true);
//        print("textContentResultList = \(textContentResultList)");
//
//        let textContent = realm.objects(TextContent.self).sorted(byKeyPath: "count", ascending: true).first
//        self.textViewMemoContent.text = textContent?.text;

        
    
}

