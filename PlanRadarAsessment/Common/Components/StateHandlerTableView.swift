//
//  StateHandlerTableView.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import RxSwift

final class StateHandlerTableView: UITableView {
    
    // MARK: - View Life cycle
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        emptyDataSetDelegate = self
    }
    
    // MARK: - Overriden
    
    public override func reloadData() {
        super.reloadData()
        emptyDataSetSource = self
    }
}

// MARK: - DZNEmptyDataSet Source

extension StateHandlerTableView: DZNEmptyDataSetSource {
    
    public func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "Start adding your own cities")
    }
    
    public func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return #imageLiteral(resourceName: "general-emptyState")
    }
    
    public func buttonTitle(forEmptyDataSet scrollView: UIScrollView!,
                            for state: UIControl.State) -> NSAttributedString! {
        return nil
    }
    
    public func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> UIImage! {
        
        return nil
    }
    
}

// MARK: - DZNEmptyDataSetDelegate

extension StateHandlerTableView: DZNEmptyDataSetDelegate {
    
}
