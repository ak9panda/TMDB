//
//  BaseTableViewCell.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    open class var identifier: String { return String.className(self) }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        self.prepareView()
        self.setConstraintsView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.prepareView()
        self.setConstraintsView()
    }
    
    func prepareView() {
        
    }
    
    func setConstraintsView() {
        
    }
}
