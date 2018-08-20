//
//  FirstViewController.swift
//  MyMemo
//
//  Created by user on 2018. 8. 7..
//  Copyright © 2018년 OgataRina. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    var selectTextContent = TextContent();
    let realmManager : RealmManager = RealmManager.sharedInstence;
    var isModify: Bool = false;// 수정인지 추가인지 확인한다. true : 기존 메모 수정, false : 새로운 메모
    
    @IBOutlet weak var textViewMemoContent: UITextView!
    @IBOutlet weak var btnSave: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboard();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if(self.isModify)
        {
            self.btnSave.setTitle("수정", for: .normal);
            self.textViewMemoContent.text = selectTextContent.text;
        }
        else
        {
            self.btnSave.setTitle("저장", for: .normal);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //Local Func
    
    func closeMemoView() {
        self.dismiss(animated: false, completion: nil);
    }
    
    //Action
    
    @IBAction func btnSaveAction(_ sender: Any) {
        print("btnSaveAction");
        
        let textContent = TextContent();
        textContent.text = self.textViewMemoContent.text!;
        
        if(!self.textViewMemoContent.text.isEmpty)
        {
            if(isModify)
            {
                //수정
                textContent.date = selectTextContent.date;
                //tabController에 있는 램에서 직접 가져온 데이터를 수정하려고 하면 트랜잭션 오류가 발생한다.
                self.realmManager.updateMemoData(textContent: textContent);
            }
            else
            {
                //새로운 메모
                textContent.date = Util.sharedInstence.getTodayString();
                self.realmManager.addMemoData(textContent: textContent);
            }
            
            let alert = UIAlertController(title: "", message: "저장되었습니다.", preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
                self.closeMemoView();
            }))
            self.present(alert, animated: true);
        }
        else
        {
            let alert = UIAlertController(title: "", message: "내용을 입력해주세요.", preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
            }))
            self.present(alert, animated: true);
            //            self.present(alertController,animated: true, completion: { () in
            //            });
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.closeMemoView();
    }
    
}

