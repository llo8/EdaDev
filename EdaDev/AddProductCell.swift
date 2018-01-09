//
//  AddProductCell.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

import UIKit

@objc protocol AdditionProductDelegate: class {
    func addToShoppingList(product: Product)
}

@objc class AddProductCell: ProductCell {
    weak var delegate: AdditionProductDelegate?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func commonInit() {
        super.commonInit()
        
        self.actionButton.setImage(UIImage(named: "addToCart"), for: .normal)
        self.actionButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
    }
    
    func addToCart() {
        delegate?.addToShoppingList(product: self.product)
    }
}
