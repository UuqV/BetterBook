//
//  SecondViewController.swift
//  TabTemplate
//
//  Created by Kathryn Lovell on 1/12/16.
//  Copyright © 2016 KLovell. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var people = [NSManagedObject]()
    var row = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "EntryTableViewCell", bundle: nil), forCellReuseIdentifier: "EntryTableViewCell")
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return people.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("EntryTableViewCell", forIndexPath:indexPath) as? EntryTableViewCell
            
            let person = people[indexPath.row]
            
            cell!.situation.text = person.valueForKey("situation") as? String
            cell!.type.text = person.valueForKey("type") as? String
            
            let formatter = NSDateFormatter()
            formatter.dateStyle = .ShortStyle
            cell!.date.text = formatter.stringFromDate(person.valueForKey("date") as! NSDate)
            
            return cell!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Entry")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            people = results as! [NSManagedObject]
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.row = indexPath.row
        performSegueWithIdentifier("tableEntrySegue", sender: self)
    }
    
    @IBAction func turnOnDelete(sender: AnyObject) {
        tableView.editing = !tableView.editing
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            managedContext.deleteObject(people[row])
            people.removeAtIndex(row)
            do {
                try managedContext.save()
            }
            catch {
                
            }
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "tableEntrySegue") {
            let svc = segue.destinationViewController as? EntryViewController;
            
            let formatter = NSDateFormatter()
            formatter.dateStyle = .ShortStyle
            svc!.str_entryDate = formatter.stringFromDate(people[row].valueForKey("date") as! NSDate)
            
            svc!.str_type = people[row].valueForKey("type") as! String
            svc!.str_situation = people[row].valueForKey("situation") as! String
            svc!.str_autoThought = people[row].valueForKey("init_thought") as! String
            svc!.str_initEmotion = people[row].valueForKey("init_mood") as! String
            svc!.str_evidence = people[row].valueForKey("evidence") as! String
            svc!.str_postIntensity = people[row].valueForKey("post_intensity") as! Int
            svc!.str_initIntensity = people[row].valueForKey("init_intensity") as! Int
            svc!.str_postEmotion = people[row].valueForKey("post_mood") as! String
            svc!.str_postThought = people[row].valueForKey("post_thought") as! String
        }
    }

}

