//
//  FirstViewController.swift
//  TabTemplate
//
//  Created by Kathryn Lovell on 1/12/16.
//  Copyright © 2016 KLovell. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {

    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var initialEmotion: UITextField!
    @IBOutlet weak var initialIntensity: UISlider!
    @IBOutlet weak var situation: UITextView!
    @IBOutlet weak var autoThought: UITextView!
    @IBOutlet weak var evidence: UITextView!
    @IBOutlet weak var postThought: UITextView!
    @IBOutlet weak var postEmotion: UITextField!
    @IBOutlet weak var postIntensity: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(sender: AnyObject) {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Entry",
            inManagedObjectContext:managedContext)
        
        let entry = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        entry.setValue(self.type.text, forKey: "type")
        entry.setValue(self.initialEmotion.text, forKey: "init_mood")
        entry.setValue(Int(self.initialIntensity.value), forKey: "init_intensity")
        entry.setValue(self.situation.text, forKey: "situation")
        entry.setValue(self.autoThought.text, forKey: "init_thought")
        entry.setValue(self.evidence.text, forKey: "evidence")
        entry.setValue(self.postThought.text, forKey: "post_thought")
        entry.setValue(self.postEmotion.text, forKey: "post_mood")
        entry.setValue(Int(self.postIntensity.value), forKey: "post_intensity")
        entry.setValue(NSDate(), forKey: "date")
        
        
        //4
        do {
            try managedContext.save()
            
            let alert = UIAlertController(title: "Saved",
                message: "Your entry was saved.",
                preferredStyle: .Alert)
            
            let close = UIAlertAction(title: "Close",
                style: .Default,
                handler: { (action:UIAlertAction) -> Void in
            })
            
            alert.addAction(close)
            
            presentViewController(alert, animated: true, completion: nil)
            
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    
}

