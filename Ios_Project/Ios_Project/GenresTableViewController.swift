//
//  GenresTableViewController.swift
//  Ios_Project
//
//  Created by Mélyne LERAY on 27/04/2022.
//

import UIKit

class GenresTableViewController: UITableViewController {

    var genre = ""
    var genres:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Value of selected genre : ", genre)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
                
        let url = URL(string: "http://localhost:3001/data/genre/"+genre)!
                
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? [[String: AnyObject]] {
                        for item in data {
                            self.genres.append(item["title"] as! String)
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.genres.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genresTableIdentifier", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = self.genres[indexPath.row]
        
        print("section : \(indexPath.section) - row : \(indexPath.row)")
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.systemGray
        } else {
            cell.backgroundColor = UIColor.systemGray3
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "login") as? LoginViewController {
            
            var film = self.genres[indexPath.row]
            print(film)
            self.present(vc, animated: true, completion: nil)
        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
