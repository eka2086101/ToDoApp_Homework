

var infoLists: [Info] = []
var TitleLists: [Title] = []

let hoge: String? = nil

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

    var number:Int! = 0
    
     for animalData in csvLines {
         let animalDetail = animalData.components(separatedBy: ",")
//         print("【出発】\(animalDetail[2])　\(animalDetail[3])　【到着】\(animalDetail[5]) \(animalDetail[6])")
     if (  number == 0  )  {
//        TitleLists.append(Title(iconName: "avatar", datetime: : "\(animalDetail[0])",title: "\(animalDetail[0])", description: "\(animalDetail[2])　\(animalDetail[3])　から\(animalDetail[5]) \(animalDetail[6])まで"));
     } else{
            infoLists.append(Info(iconName: "avatar",datetime: "\(animalDetail[0])", title: "\(animalDetail[7])円", description: "\(animalDetail[2])　\(animalDetail[3])　 \(animalDetail[5]) \(animalDetail[6])"));
     }
       number = number + 1
     }

      
}

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var SelectAutoBtn: UISegmentedControl!
    
    override func viewDidLoad() {
        
         ManualRead()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableViewCell()
        tableView.delegate = self
        tableView.dataSource = self
        

    }

    
    func configureTableViewCell(){
        
        //nibを作成
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)

        let cellID = "TaskTableViewCell"
        //tableQiewで使えるように登録する
        tableView.register(nib, forCellReuseIdentifier: cellID)
    
    }
    
    //rowの数を指定するメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //infoListの数
        return infoLists.count
    }
    
    //tableViewのcellに表示する内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        //iconViewの設定
        cell.iconView.image = UIImage(named: infoLists[indexPath.row].iconName)
        //titleの設定
        cell.titleLabel.text = infoLists[indexPath.row].title
        
        cell.descriptionLabel.text = infoLists[indexPath.row].description
        
        return cell
    }
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return
//    }
    
    //セクションのタイトルを設定
    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "\(section)"
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "\(section)"
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
        
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let vc = DetailViewController()
        vc.Info = infoLists[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: true,completion: nil)

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


