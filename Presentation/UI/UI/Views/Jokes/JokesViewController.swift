//
//  JokesViewController.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import UIKit

class JokesViewController: BaseViewController<JokesViewModel>{
    
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
          
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.setUpBindings();
        
        self.viewModel.loadData()
        
    }
    
    
    
    private func setUpBindings(){
        
        self.viewModel.$data
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .sink(receiveValue: {[weak self] data in
                self?.tableView.reloadData()
            })
            .store(in:  &cancellables)
        
    }
    
}


extension JokesViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount()
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel.dataForItem(at: indexPath.row) ?? "-"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.numberOfLines = -1
        cell.textLabel?.text = item
        
        return  cell
        
    }
    
    
}
