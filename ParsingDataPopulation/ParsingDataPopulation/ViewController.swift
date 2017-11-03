//
//  ViewController.swift
//  ParsingDataPopulation
//
//  Created by DOTS2 on 11/3/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPopulation: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblRank: UILabel!
    var passRank:String?
    var passCountry:String?
    var passPopulation:String?
    
    override func viewDidLoad() {
        
        lblRank.text = passRank!
        lblPopulation.text = passPopulation!
        lblCountry.text = passCountry!
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

