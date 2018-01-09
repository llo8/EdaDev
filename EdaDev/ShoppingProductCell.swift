//
//  BagProductCell.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

import UIKit

protocol DeletingProductDelegate: class {
    func remove(product:Product, with cell:ShoppingProductCell)
}

final class ShoppingProductCell: ProductCell {
    weak var delegate: DeletingProductDelegate?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func commonInit() {
        super.commonInit()
        
        self.actionButton.setImage(UIImage(named: "removeFromCart"), for: .normal)
        self.actionButton.addTarget(self, action: #selector(removeFromCart), for: .touchUpInside)
    }
    
    func removeFromCart() {
        delegate?.remove(product: product, with: self)
    }
}
