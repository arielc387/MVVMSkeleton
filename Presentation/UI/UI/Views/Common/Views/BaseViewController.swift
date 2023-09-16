//
//  BaseViewController.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import UIKit
import Combine

open class BaseViewController<ViewModel:BaseViewModel>: UIViewController {

    public var viewModel: ViewModel = ViewModel()
    
    public var parameters: Any?
    
    var cancellables = Set<AnyCancellable>()
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.view = self;
        // Do any additional setup after loading the view.
       
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func registerCell(name:String, reuseId:String?, for tview:UITableView){
    
        tview.register(UINib.init(nibName: name, bundle: Bundle.init(for: Self.self)), forCellReuseIdentifier: reuseId ?? name);
        
    }
    
}
