//
//  OnboardingScreen3ViewController.swift
//  w6d5
//
//  Created by Roland on 2017-12-13.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

import UIKit

class OnboardingScreen3ViewController: UIViewController {

    // MARK: - IBActions
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: segueMainScreen, sender: self)
    }
    
    // MARK: - Private properties
    let segueMainScreen = "segueMainScreen"
}

// MARK: - UIViewController methods
extension OnboardingScreen3ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
}

