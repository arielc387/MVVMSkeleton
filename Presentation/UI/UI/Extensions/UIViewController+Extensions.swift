//
//  UIViewController+Extensions.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation
import UIKit


extension UIViewController {
    static func loadFromNib(name:String) -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: name, bundle: Bundle(for: Self.self))
        }

        return instantiateFromNib()
    }
}

extension UIViewController:ViewRouterProtocol{
 
    public func set(root view: ViewRouterProtocol) -> Bool {
        
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first, let vc = view as? UIViewController {
            
            let nav = UINavigationController(rootViewController: vc)
            nav.isNavigationBarHidden = true;
            window.rootViewController = nav;
            
            return true;
        }
        
        return false;
    }
    
    
    public func canHandle(view: ViewRouterProtocol) -> Bool{
        return view is UIViewController;
    }
        
    public func navigate(to view: ViewRouterProtocol) -> Bool{
        
        guard let viewController = view as? UIViewController else {
            return false;
        }
        
        
        self.navigationController?.pushViewController(viewController, animated: true);
        
        return true;
    }
    
    public func set(view: ViewRouterProtocol) -> Bool{
        
        guard let viewController = view as? UIViewController else {
            return false;
        }

        self.navigationController?.setViewControllers([viewController], animated:true);
        return true;
    }
    
    public func present(view: ViewRouterProtocol,completion: (()->())?) -> Bool{
        
        guard let viewController = view as? UIViewController else {
            return false;
        }
        
        self.navigationController?.present(viewController, animated: true, completion: completion);
        
        return true;
    }
    
    public func dismiss(completion: (() -> Void)? = nil) -> Bool {
     
        self.dismiss(animated: true,completion:completion);
        
        return true;
    }
    
    public func back() -> Bool {
       
        self.navigationController?.popViewController(animated: true);
      
        return true;
    }
    
    public func open(url:URL)->Bool{
        UIApplication.shared.open(url);
        
        return true;
    }
}
