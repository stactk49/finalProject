//
//  EditEventViewController.swift
//  finalProject
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 Jerry & Tom. All rights reserved.
//

import UIKit
import CoreData

class EditEventViewController: UIViewController {
    
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventDate: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    @IBOutlet weak var eventProjectName: UITextField!
    @IBOutlet weak var eventType: UITextField!
    let event: NSManagedObject? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventName.text = event?.value(forKey: "eventName") as! String?
        eventDate.text = event?.value(forKey: "eventDate") as! String?
        eventLocation.text = event?.value(forKey: "eventLocation") as! String?
        eventProjectName.text = event?.value(forKey: "eventProjectName") as! String?
        eventType.text = event?.value(forKey: "eventType") as! String?
    }

    @IBAction func saveEvent(_ sender: Any) {
        var noError = true
        
        //Check that all fields are filled
        if eventName.text == nil
        {
            //send warning that Event Name not filled
            noError = false
        }
        if eventDate.text == nil
        {
            //send warning that Event Date not filled
            noError = false
        }
        if eventLocation.text == nil
        {
            //send warning that Event Location not filled
            noError = false
        }
        if eventProjectName.text == nil
        {
            //send warning that Project Name not filled
            noError = false
        }
        if eventType.text == nil
        {
            //send warning that Event Type not filled
            noError = false
        }
        
        //convert eventDate from string to Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss Z"
        let date = dateFormatter.date(from: eventDate.text!)
        
        
        if noError
        {
        //save event
            event?.setValue(eventName.text, forKey: "eventName")
            event?.setValue(date, forKey: "eventDate")
            event?.setValue(eventLocation.text, forKey: "eventLocation")
            event?.setValue(eventProjectName.text, forKey: "eventProjectName")
            event?.setValue(eventType.text, forKey: "eventType")
            EventManager().saveContext()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
