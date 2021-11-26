//
//  XYZTableView.swift
//  SoHow
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZTableView: NSObject {

}

//不选中
//tableView.allowsSelection = true

//估计高度
//tableView.estimatedRowHeight = 400
//tableView.rowHeight = UITableView.automaticDimension



//这个是在配置tableView的基本颜色属性
public extension UITableView{
    
    
    
    //设置tableView的透明状态
    func setClearBackground(View:UIView,separatorOn:Bool = false)  {
        let imageView = UIImageView()
        imageView.bounds = View.bounds
        imageView.backgroundColor = .black
        self.backgroundView = imageView
        self.separatorStyle = separatorOn ? .singleLine : .none
    }
    
    
    //设置tableView的距离上边距，LeftsideMenu
    func setUPsideForLeftMenu(View:UIView,高度:Double = 0.175)  {
        self.contentInset = UIEdgeInsets(top: View.frame.height * CGFloat(高度), left: 0,bottom: 0, right: 0)
        self.bounces                         = false
        self.separatorStyle                  = .none
        self.backgroundView?.backgroundColor = .black
    }
    
    
}

public extension UITableView{
    func TableView的启动后配置(View:UIView)  {
        // MARK: - //swipe部分
        self.setClearBackground(View: View, separatorOn: false)
        //这个重要
        self.allowsMultipleSelectionDuringEditing = true
        self.allowsSelection = true
    }
}



public extension IndexPath {
    static func fromRow(_ row: Int) -> IndexPath {
        return IndexPath(row: row, section: 0)
    }
}

public extension UITableView {
    func applyChanges(deletions: [Int], insertions: [Int], updates: [Int]) {
        beginUpdates()
        deleteRows(at: deletions.map(IndexPath.fromRow), with: .automatic)
        insertRows(at: insertions.map(IndexPath.fromRow), with: .automatic)
        reloadRows(at: updates.map(IndexPath.fromRow), with: .automatic)
        endUpdates()
    }
}




//XYZTableView
public extension UITableViewCell{
    var FatherTableView:UITableView?{
       return self.superview as? UITableView
        //return self.next as? UITableView
    }
    
    var FatherVC:UIViewController? {
         return (self.next as? UITableView)?.firstViewController()
    }
    
    var FatherTVC:UITableViewController? {
        return self.next?.next as? UITableViewController
    }
    
    var CellindexPath:IndexPath?{
        let superTableViewX = self.superview as? UITableView
        return superTableViewX?.indexPath(for: self)
    }
    func reloadTableView()  {
        DispatchQueue.main.async {
            self.FatherTableView?.reloadData()
        }
    }
    
}


private extension UIView {
    //返回该view所在VC
    func firstViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
}
  

public extension UITableView{
    func FitForBarControllerMask(tabBarController:UITabBarController,height:Int = 80)  {
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: (tabBarController.tabBar.frame.size.height) - CGFloat(height), right: 0)
    }
    func MoveContentVerticalDown(offSet:Int = 150)  {
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:  CGFloat(offSet), right: 0)
    }
    
}
