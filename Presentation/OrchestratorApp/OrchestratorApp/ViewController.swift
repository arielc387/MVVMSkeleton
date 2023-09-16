//
//  ViewController.swift
//  OrchestratorApp
//
//  Created by Ariel Calderon Solis on 02/09/23.
//

import UIKit
import UI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let viewModel = JokesViewModel();
        viewModel.view = self;
        
        viewModel.showJokesView();
    }


}

