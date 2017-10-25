//
//  ViewController.swift
//  Example
//
//  Created by Rudy Bermudez on 10/24/17.
//  Copyright © 2017 Rogue Bit Studios. All rights reserved.
//

import UIKit
import Juliet

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		Logger.verbose("View Loaded")
		Logger.info(Date())
		Logger.debug(["Yellow", "Blue", 3])
		Logger.warning("Yikes something is not right")
		Logger.error("Fatal Error")
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

