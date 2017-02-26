//
//  DetailOfItem.swift
//  EnglishForKId
//
//  Created by Admin on 2/26/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DetailOfItem: UIViewController {
    
    var stringTitle: String!
    var img: UIImage!
    
    @IBOutlet weak var ImageDetail: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        print(stringTitle)
        self.title = stringTitle
        img = UIImage(named: "\(stringTitle)Item.jpg")
        ImageDetail.image = img
    }

}
