//
//  ViewController.swift
//  finalProject
//
//  Created by Tom Stak on 2017.01.11.
//  Copyright © 2017 Jerry & Tom. All rights reserved.
//

import UIKit

class projectAvailable: NSObject {
    
    var projectName: String
    var selected: Bool
    
    init(name: String)
    {
        self.projectName = name
        self.selected = false
    }
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var projectList: [projectAvailable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //add testing variables.  
        //Note:  change to getting list of possible projects from Core Data when data implemented
        let project1 = projectAvailable(name: "Project 1")
        projectList.append(project1)
        let project2 = projectAvailable(name: "Project 2")
        projectList.append(project2)
        let project3 = projectAvailable(name: "Project 3")
        projectList.append(project3)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allProjectsCell", for: indexPath)
        
        var p: String = ""
        
        if projectList[indexPath.row].selected
        {
            p = " * \(projectList[indexPath.row].projectName)"
        }
        else
        {
            p = "   \(projectList[indexPath.row].projectName)"
        }
        
        cell.textLabel!.text = p
        //print("testing - \(toppingsString)")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList.count
    }
    
    @IBAction func addProject(_ sender: UIButton) {
        if(tableView.indexPathForSelectedRow != nil)
        {
            projectList[(tableView.indexPathForSelectedRow?.row)!].selected = true
            tableView.reloadData()
        }
    }
    
    @IBAction func removeProject(_ sender: UIButton) {
        if(tableView.indexPathForSelectedRow != nil)
        {
            projectList[(tableView.indexPathForSelectedRow?.row)!].selected = false
            tableView.reloadData()
        }
    }
    
    //get the list of selected projects, and pass them onto the calender/gantt chart for processing
    @IBAction func projectsViewTransition(_ sender: UIButton) {
        
        var selectedProjectList: [String] = []
        
        for project in projectList {
            if project.selected
            {
                selectedProjectList.append(project.projectName)
            }
        }
        
        if selectedProjectList.count > 0
        {
            //pass selectedProjectList onto calender/gantt chart
        }
        else
        {
            //give warning that no projects are selected
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

