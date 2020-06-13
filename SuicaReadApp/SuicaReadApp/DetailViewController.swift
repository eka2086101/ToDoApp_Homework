//
//  DetailViewController.swift
//  SuicaReadApp
//
//  Created by Miki Arakawa on 2020/06/13.
//  Copyright © 2020 Miki Arakawa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var DatetimeLabel: UILabel!
    
    var Info: Info?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let Info = Info else{return}
        
        print(Info)
        iconView.image = UIImage(named: Info.iconName)
        DatetimeLabel.text = Info.datetime
        titleLabel.text = Info.title
        descriptionLabel.text = Info.description
    }



    @IBAction func ReturnBtn(_ sender: Any) {
        
        
         self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
