 
//
//  VC_StoryBoard_Extension.swift
//  XYZMoney
//
//  Created by zhangzihao on 2022/11/10.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

// MARK: - UIStoryboard Extension for Instantiating View Controllers
public extension UIStoryboard {
    
    /// Instantiates a view controller of the specified type from the storyboard.
    ///
    /// This function simplifies the process of creating view controllers by
    /// inferring the view controller's identifier from its class name.
    ///
    /// - Parameter type: The type of the view controller to instantiate.
    /// - Returns: A view controller of the specified type.
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        // Use the class name as the storyboard identifier for the view controller.
        
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}

// MARK: - Alternative Initialization Method for View Controllers
public extension UIStoryboard {
    
    /// Another method for initializing a view controller of the specified type.
    ///
    /// This function works similarly to `instantiateViewController(ofType:)` by
    /// utilizing the class name as the identifier but can be used as an alternative.
    ///
    /// - Parameter type: The type of the view controller to initialize.
    /// - Returns: A view controller of the specified type.
    func initVC<T>(ofType type: T.Type) -> T {
        // Use the class name as the storyboard identifier for the view controller.
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
