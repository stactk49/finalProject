//
//  AddEventViewController.swift
//  finalProject
//
//  Created by mac on 1/15/17.
//  Copyright © 2017 Jerry & Tom. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventDate: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    @IBOutlet weak var eventProjectName: UITextField!
    @IBOutlet weak var eventType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveEvent(_ sender: UIButton) {
        var noError = true
        
        //Check that all fields are filled
        if eventName.text == nil
        {
            //send warning that Event Name not filled
            print("event name empty")
            noError = false
        }
        if eventDate.text == nil
        {
            //send warning that Event Date not filled
            print("event date empty")
            noError = false
        }
        if eventLocation.text == nil
        {
            //send warning that Event Location not filled
            print("event location empty")
            noError = false
        }
        if eventProjectName.text == nil
        {
            //send warning that Project Name not filled
            print("event project name empty")
            noError = false
        }
        if eventType.text == nil
        {
            //send warning that Event Type not filled
            print("event type empty")
            noError = false
        }
        
        //convert eventDate from string to Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: eventDate.text!)
        
        if date == nil
        {
            noError = false
            print("date format wrong")
        }
        
        if noError
        {
            //save event
            print("saving Event")
            AppDelegate().createDatabase(date: date!, location: eventLocation.text!, name: eventName.text!, projectName: eventProjectName.text!, type: eventType.text!)
            print("successfully saved Event")
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
