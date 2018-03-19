//
//  Location.swift
//  iVoluntr
//
//  Created by Susie Renjith on 12/28/17.
//  Copyright © 2017 Susie Renjith. All rights reserved.
//

import UIKit

class Location: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

