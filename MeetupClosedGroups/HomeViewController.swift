//
//  HomeViewController.swift
//  MeetupClosedGroups
//
//  Created by Robert Martin on 9/1/16.
//  Copyright © 2016 Robert Martin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data = [
        "Bro Coders",
        "Trump Supporters",
        "Basket Weavers at Midnight",
        "Dog coders",
        "men who love ballet",
        "Prep Team for 2008 Olympics",
        "Arizona Boat racers"
    ]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //reuse cells that leave the bottom of the screen as resources for new cells entering the top 
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as UITableViewCell
        //sets cell text equal to info in the array passed in
        cell.textLabel?.text = data[(indexPath as NSIndexPath).row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    // From UITableViewDelegate protocol.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("User selected section: \((indexPath as NSIndexPath).section), row: \((indexPath as NSIndexPath).row)")
        
        //this will change cell highlighted color
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.cyan
        
        // The user has tapped or selected a row in our table view - manually fire our
        // named Segue.
        performSegue(withIdentifier: "mySegue", sender: tableView)
    }
    
    // We can override this method in UIViewController if we want to perform some
    // logic before a Segue actually fires off.
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if segue.identifier == "mySegue" {
            
            print("Preparing for mySegue!")
            
            // Ask the table view what row is currenlty selected.
            let indexPath: IndexPath = self.myTableView.indexPathForSelectedRow!
            
            print("User selected section: \((indexPath as NSIndexPath).section), row: \((indexPath as NSIndexPath).row)")
            
            let secondVC = segue.destination as! LabelViewController
            
            // Pass some data to the next View Controller by setting one or more of
            // its properties.
            secondVC.textData = data[(indexPath as NSIndexPath).row]
        }
    }
    
    // From UITableViewDelegate protocol.
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // From UITableViewDelegate protocol.
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.red
    }
    
    // From UITableViewDelegate protocol.
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.clear
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
