//
//  BaseCollectionViewCell.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setConstraintsView()
    }
    
    func setupViews() {
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setupViews()
        self.setConstraintsView()
    }
    
    func setConstraintsView(){
        
    }
}

