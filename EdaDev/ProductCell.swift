//
//  ProductCell.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright © 2018 Юрий. All rights reserved.
//

import UIKit
import Kingfisher

@objc class ProductCell: UITableViewCell {

    let descriptionLabel: UILabel = UILabel()
    let productImageView: UIImageView = UIImageView()
    let retailerLabel: UILabel = UILabel()
    let priceLabel: UILabel = UILabel()
    let discountLabel: UILabel = UILabel()
    let actionButton: UIButton = UIButton()

    var product: Product!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        // setup descriptionLabel
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionLabel)
        let topDescriptionConstraint = NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal,
                                                          toItem: self, attribute: .top, multiplier: 1, constant: 16)
        let leftDescriptionConstraint = NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal,
                                                           toItem: self, attribute: .leading, multiplier: 1, constant: 16)
        let botDescriptionConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual,
                                                          toItem: descriptionLabel, attribute: .bottom,
                                                          multiplier: 1, constant: 16)
        
        // setup productImageView
        productImageView.contentMode = .scaleAspectFit
        productImageView.clipsToBounds = true
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(productImageView)
        let topImageConstraint = NSLayoutConstraint(item: productImageView, attribute: .top, relatedBy: .equal,
                                                    toItem: self, attribute: .top, multiplier: 1, constant: 16)
        let rightImageConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal,
                                                      toItem: productImageView, attribute: .trailing, multiplier: 1, constant: 16)
        let widthImageConstraint = NSLayoutConstraint(item: productImageView, attribute: .width, relatedBy: .equal,
                                                      toItem: self, attribute: .width, multiplier: 0.3, constant: 0)
        let aspectRatioImage = NSLayoutConstraint(item: productImageView, attribute: .width, relatedBy: .equal,
                                                       toItem: productImageView, attribute: .height, multiplier: 1, constant: 0)
        let botImageConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual,
                                                    toItem: productImageView, attribute: .bottom, multiplier: 1, constant: 16)
        
        let betweenImageDescription = NSLayoutConstraint(item: productImageView, attribute: .leading, relatedBy: .equal,
                                                         toItem: descriptionLabel, attribute: .trailing,
                                                         multiplier: 1, constant: 4)
        
        // setup actionButton
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(actionButton)
        let widthButtonConstraint = NSLayoutConstraint(item: actionButton, attribute: .width, relatedBy: .equal,
                                                       toItem: self, attribute: .width, multiplier: 0.1, constant: 0)
        let aspectRatioButton = NSLayoutConstraint(item: actionButton, attribute: .width, relatedBy: .equal,
                                                        toItem: actionButton, attribute: .height, multiplier: 1, constant: 0)
        let topButtonConstraint = NSLayoutConstraint(item: actionButton, attribute: .top, relatedBy: .equal,
                                                     toItem: productImageView, attribute: .bottom,
                                                     multiplier: 1, constant: 16)
        let bottomButtonConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual,
                                                        toItem: actionButton, attribute: .bottom,
                                                        multiplier: 1, constant: 16)
        let centerButtonConstraint = NSLayoutConstraint(item: actionButton, attribute: .centerX, relatedBy: .equal,
                                                        toItem: productImageView, attribute: .centerX,
                                                        multiplier: 1, constant: 0)
        
        // setup retailerLabel
        retailerLabel.textColor = .lightGray
        retailerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(retailerLabel)
        let topRetailerConstraint = NSLayoutConstraint(item: retailerLabel, attribute: .top, relatedBy: .equal,
                                                       toItem: descriptionLabel, attribute: .bottom,
                                                       multiplier: 1, constant: 16)
        let leftRetailerConstraint = NSLayoutConstraint(item: retailerLabel, attribute: .leading, relatedBy: .equal,
                                                           toItem: self, attribute: .leading, multiplier: 1, constant: 16)
        let botRetailerConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual,
                                                          toItem: retailerLabel, attribute: .bottom,
                                                          multiplier: 1, constant: 16)
        let betweenImageRetailer = NSLayoutConstraint(item: productImageView, attribute: .leading, relatedBy: .equal,
                                                      toItem: retailerLabel, attribute: .trailing,
                                                      multiplier: 1, constant: 4)
        
        // setup priceLabel
        priceLabel.textColor = .blue
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(priceLabel)
        let topPriceConstraint = NSLayoutConstraint(item: priceLabel, attribute: .top, relatedBy: .equal,
                                                       toItem: retailerLabel, attribute: .bottom,
                                                       multiplier: 1, constant: 16)
        let leftPriceConstraint = NSLayoutConstraint(item: priceLabel, attribute: .leading, relatedBy: .equal,
                                                        toItem: self, attribute: .leading, multiplier: 1, constant: 16)
        let botPriceConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual,
                                                       toItem: priceLabel, attribute: .bottom,
                                                       multiplier: 1, constant: 16)
        
        // setup discountLabel
        discountLabel.textColor = .red
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(discountLabel)
        let widthPriceDiscount = NSLayoutConstraint(item: discountLabel, attribute: .width, relatedBy: .equal,
                                                    toItem: priceLabel, attribute: .width, multiplier: 0.8, constant: 0)
        let leftDiscount = NSLayoutConstraint(item: priceLabel, attribute: .trailing, relatedBy: .equal,
                                              toItem: discountLabel, attribute: .leading, multiplier: 1, constant: 8)
        let rightDiscount = NSLayoutConstraint(item: productImageView, attribute: .leading, relatedBy: .equal,
                                               toItem: discountLabel, attribute: .trailing, multiplier: 1, constant: 4)
        let centerYDiscount = NSLayoutConstraint(item: discountLabel, attribute: .centerY, relatedBy: .equal,
                                                 toItem: priceLabel, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.addConstraints([topDescriptionConstraint, leftDescriptionConstraint, botDescriptionConstraint,
                             topImageConstraint, rightImageConstraint, botImageConstraint,
                             widthImageConstraint, aspectRatioImage, betweenImageDescription,
                             widthButtonConstraint, aspectRatioButton, topButtonConstraint,
                             bottomButtonConstraint, centerButtonConstraint,
                             topRetailerConstraint, leftRetailerConstraint,
                             botRetailerConstraint, betweenImageRetailer,
                             topPriceConstraint, leftPriceConstraint, botPriceConstraint,
                             widthPriceDiscount, rightDiscount, leftDiscount, centerYDiscount])
        
    }

    @objc public func fill(with product: Product) {
        self.product = product

        descriptionLabel.text = product.descriptionProduct
        retailerLabel.text = product.retailer
        
        if let price = product.price, price > 0 {
            priceLabel.text = "\(price) ₽"
        } else {
            priceLabel.text = ""
        }
        
        if let discount = product.discount, discount > 0 {
            discountLabel.text = "-\(discount)%"
        } else {
            discountLabel.text = ""
        }

        if let imageUrl = product.image, let url = URL(string: imageUrl) {
            productImageView.kf.setImage(with: url)
        }
    }
}
