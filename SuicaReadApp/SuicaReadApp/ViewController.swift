//
//  ViewController.swift
//  SuicaReadApp
//
//  Created by Miki Arakawa on 2020/06/06.
//  Copyright © 2020 Miki Arakawa. All rights reserved.
//

let infoLists: [KameInfo] = [
     KameInfo(iconName: "02", title: "もでーん", description: "おなかいっぱいなかめくん"),
     KameInfo(iconName: "12", title: "ぐしゅん", description: "泣き虫かめくん"),
     KameInfo(iconName: "14", title: "いまいくの", description: "いくフリしておっくうになってるかめくん"),
     KameInfo(iconName: "19", title: "むりなの", description: "拒否するかめくん"),
     KameInfo(iconName: "22", title: "きゅうけい", description: "さぼってるかめくん"),
     KameInfo(iconName: "28", title: "にゃーっっ", description: "驚いてへんな声だしてるかめくん"),
     KameInfo(iconName: "32", title: "にしー", description: "ほめてもらったかめくん"),
     KameInfo(iconName: "29", title: "わほーい", description: "テンションアゲアゲなかめくん"),
     KameInfo(iconName: "35", title: "にひひ", description: "わるだくみしているかめくん"),
     KameInfo(iconName: "38", title: "もうだめだ・・・", description: "ギブアップしたかめくん"),
     KameInfo(iconName: "avatar", title: "ふつう", description: "やさしげなかめくん")
 ]

import UIKit

class ViewController: UIViewController,UITextViewDelegate,UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  infoLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ListViewController
        
        cell.ImageView.image = UIImage(named: infoLists[indexPath.row])
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var SelectAutoBtn: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        configureTableViewCell()
    }

    
    func configureTableViewCell(){
        let nib = UINib(nibName: "ListViewController", bundle: nil)
    
        let cellID = "CustomCell"
        
        tableView.register(nib, forCellReuseIdentifier: cellID)
    
    }
    @IBAction func CsvModeBtn(_ sender: Any) {
        
        //選択されているセグメントのインデックス
        let selectedIndex = segmentedControl.selectedSegmentIndex
        
        if(selectedIndex == 1)
        {
            ManualRead()
            
        }
        else if(selectedIndex == 0)
        {
            
        }
        
         }
    

}

func ManualRead() {
    
    var csvLines = [String]()

     guard let path = Bundle.main.path(forResource:"dataList", ofType:"csv") else {
         print("csvファイルがないよ")
         return
     }

     do {
         let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
         csvLines = csvString.components(separatedBy: .newlines)
         csvLines.removeLast()
     } catch let error as NSError {
         print("エラー: \(error)")
         return
     }

     for animalData in csvLines {
         let animalDetail = animalData.components(separatedBy: ",")
         print("【名前】\(animalDetail[0])　【体長】\(animalDetail[1]) cm　【体重】\(animalDetail[2]) kg")
     }
}

