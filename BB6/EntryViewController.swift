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
    var str_entryDate:String!
    var str_initEmotion:String!
    var str_initIntensity:Int!
    var str_postIntensity:Int!
    var str_postEmotion:String!
    var str_autoThought:String!
    var str_evidence:String!
    var str_postThought:String!
    
    @IBOutlet weak var entryDate: UILabel!
    @IBOutlet weak var situation: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var initEmotion: UILabel!
    @IBOutlet weak var initIntensity: UILabel!
    @IBOutlet weak var postEmotion: UILabel!
    @IBOutlet weak var postIntensity: UILabel!
    @IBOutlet weak var autoThought: UILabel!
    @IBOutlet weak var evidence: UILabel!
    @IBOutlet weak var postThought: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        type.text = str_type
        situation.text = str_situation
        initEmotion.text = str_initEmotion
        initIntensity.text = String(str_initIntensity)
        postEmotion.text = str_postEmotion
        postIntensity.text = String(str_postIntensity)
        autoThought.text = str_autoThought
        evidence.text = str_evidence
        postThought.text = str_postThought
        entryDate.text = str_entryDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

