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


//tableView.separatorColor = [UIColor clearColor];
//
//
//或者
//
//table.separatorStyle = UITableViewCellSeparatorStyleNone;



//如果要保留分割线 用这个: tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
