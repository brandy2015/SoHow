//
//  WeakProxy.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/6/17.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

public class WeakProxy: NSObject {
    
    weak public var target: NSObjectProtocol?
    
    public init(target: NSObjectProtocol) {
        self.target = target
        super.init()
    }
    
    override public func responds(to aSelector: Selector!) -> Bool {
        return (target?.responds(to: aSelector) ?? false) || super.responds(to: aSelector)
    }
    
    override public func forwardingTarget(for aSelector: Selector!) -> Any? {
        return target
    }
}
