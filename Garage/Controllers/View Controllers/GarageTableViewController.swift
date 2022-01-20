//
//  GarageTableViewController.swift
//  Garage
//
//  Created by Arian Mohajer on 1/19/22.
//

import UIKit

class GarageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CarController.sharedInstance.garage.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath)

        // Configure the cell...
        let car = CarController.sharedInstance.garage[indexPath.row]
        cell.textLabel?.text = "\(car.year) \(car.make) \(car.model)"

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let carToDelete = CarController.sharedInstance.garage[indexPath.row]
            CarController.sharedInstance.deleteCar(car: carToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "toCarDetails" {
            if let indexPath = tableView.indexPathForSelectedRow,
               let destination = segue.destination as? CarDetailViewController {
                let carToSend = CarController.sharedInstance.garage[indexPath.row]
                destination.car = carToSend
            }
        }
        // Pass the selected object to the new view controller.
        
        //Identity, index, destination, object to send, object to receive
    }
}
