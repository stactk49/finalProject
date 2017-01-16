//
//  EventManager.swift
//  finalProject
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 Jerry & Tom. All rights reserved.
//

import UIKit
import CoreData

class EventManager {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //retrieve Events from Core Data
    class func getAllEvents(completion: @escaping ([NSManagedObject]) -> Void)
    {
        let viewContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Events")
        
        do
        {
            //try to fetch all Events
            let results = try viewContext.fetch(fetchRequest)
            
            //cast the results to a list of Managed Objects
            let events = results as! [NSManagedObject]
            completion(events)
        }catch let error as NSError {
            //error retrieving artists
            print(error)
            completion([])
        }
    }
    
    func saveContext(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("COULD NOT SAVE!!!\(error), \(error.userInfo)")
        }
    }
    
    func deleteContext(removeEvent: NSManagedObject)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            managedContext.delete(removeEvent)
            try managedContext.save()
        }
        catch let error as NSError {
            print("COULD NOT SAVE!!!\(error), \(error.userInfo)")
        }
    }
}
