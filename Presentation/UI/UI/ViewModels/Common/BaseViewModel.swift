//
//  BaseViewModel.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation
import Domain
import Resolver
import Combine
import Common

public class BaseViewModel:ObservableObject,ViewModelProtocol{
 
    @Published var data: [Any]?
    @Published var error: AppError?;
       
    var cancellables = Set<AnyCancellable>()
    
    @Injected public var router:RouterProtocol;
    
    public weak var view: ViewRouterProtocol?
    
    //MARK: Initializers
    
    public required init(){
      self.setupObservers();
    }
    
    //MARK: Internal/Public Functions
    
    func onError(_ error:AppError){
        
        var description:String?;
        
        if case .apiError = error{
            description = error.description;
        }
       
        print(description ?? "UNKNOWN_ERROR".localized)
    }
    
    //MARK: Private Functions
    
    private func setupObservers(){
        
        self.$error.sink {[unowned self] appError in
            
            if let errorValue = appError{
                self.onError(errorValue);
            }
            
        }.store(in: &cancellables)
    }
}
