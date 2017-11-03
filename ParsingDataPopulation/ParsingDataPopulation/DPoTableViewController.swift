//
//  DPoTableViewController.swift
//  ParsingDataPopulation
//
//  Created by DOTS2 on 11/3/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class DPoTableViewController: UITableViewController {
    
        let populationURL = "http://www.androidbegin.com/tutorial/jsonparsetutorial.txt"
    var population = [DataPopulation]()
    
    var idrankSelected:String?
    var countrySelected:String?
    var populationSelected:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPopulationData()
        
        //set row height to 92
        tableView.estimatedRowHeight = 92.0
        //set row table height to automatic dimension
        tableView.rowHeight = UITableViewAutomaticDimension
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return population.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DpTableViewCell
        
        cell.labelRank.text = "No\(population[indexPath.row].rank)"
        cell.labelCountryy.text = population[indexPath.row].country
        cell.labelPopulationn.text = population[indexPath.row].popolation

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = population[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        idrankSelected = "\(dataTask.rank)"
        countrySelected = dataTask.country
        populationSelected = dataTask.popolation
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let sendData = segue.destination as! ViewController
            sendData.passRank = idrankSelected
            sendData.passPopulation = populationSelected
            sendData.passCountry = countrySelected
        }
    }
    func getPopulationData() {
        guard let poURL = URL(string: populationURL) else {
            return //this return is for back up the value that got when call variable loanURL
        }
        let request = URLRequest(url: poURL)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                //condition when error
                //print error
                print(error)
                return //back up value error that we get
            }
            //parse JSON data
            //declare variable data to call data
            if let data = data {
                //for this part will call method parseJsonData that we will make in below
                self.population = self.parseJsonData(data: data)
                
                //reload tableView
                OperationQueue.main.addOperation({
                    //reload data again
                    self.tableView.reloadData()
                })
            }
        })
        //task will resume to call the json data
        task.resume()
    }
    func parseJsonData(data: Data) -> [DataPopulation] {
        var student = [DataPopulation]()
        do{
            //declare jsonResult for take data from the json
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            //parse json data
            //declare jsonLoans for call data array jsonResult with name Loans
            let jsonLoans = jsonResult?["worldpopulation"] as! [AnyObject]
            //will call data be repeated for jsonLoan have data json array from variable jsonLoans
            for jsonLoan in jsonLoans {
                //declare loan as object from class loan
                let studentss = DataPopulation()
                studentss.rank = jsonLoan["rank"] as! Int
                studentss.country = jsonLoan["country"] as! String
                studentss.popolation = jsonLoan["population"] as! String
                
                
                student.append(studentss)
            }
        }catch{
            print(error)
        }
        return student
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


