//
//  ViewController.swift
//  FunFacts
//
//  Created by Benjamine Mutebi on 2/15/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    
     let factbook = Factbook()
     let ColorWheel = colorWheel()

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        funFactLabel.text = factbook.randomNumber();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func showFunFact() {
        
        var randomColor = ColorWheel.randomColor()
        funFactButton.tintColor = randomColor;
        funFactLabel.text = factbook.randomNumber();
        view.backgroundColor = randomColor;
    }
    

}

