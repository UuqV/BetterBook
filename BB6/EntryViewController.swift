//
//  FirstViewController.swift
//  TabTemplate
//
//  Created by Kathryn Lovell on 1/12/16.
//  Copyright © 2016 KLovell. All rights reserved.
//

import UIKit
import CoreData

class EntryViewController: UIViewController {
    var str_type:String!
    var str_situation:String!
    var date:NSDate!
    
    @IBOutlet weak var situation: UILabel!
    @IBOutlet weak var type: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        type.text = str_type
        situation.text = str_situation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

