//
//  ShoppingList.swift
//  EdaDev
//
//  Created by Юрий on 01.01.18.
//  Copyright (c) 2018 Юрий. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {
    let configurator: ShoppingListConfigurator = ShoppingListConfigurator()
    var output: ShoppingListViewOutput!

    // MARK: UI elements
    lazy var tableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.viewIsAppear()
    }
}

extension ShoppingListViewController: ShoppingListViewInput {

    func setupInitialState() {
        self.title = NSLocalizedString("bag_tab", comment: "")

        // setup tableView
        tableView.register(ShoppingProductCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 200
        tableView.delegate = self
        tableView.dataSource = self
        
        // setup position tableView
        self.view.addSubview(tableView)
        let topConstraint = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal,
                                               toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let botConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
                                               toItem: tableView, attribute: .bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal,
                                                toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal,
                                                 toItem: tableView, attribute: .trailing, multiplier: 1, constant: 0)
        view.addConstraints([topConstraint, botConstraint, leftConstraint, rightConstraint])
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.countProducts()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ShoppingProductCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ShoppingProductCell

        let product = output.productForIndex(indexPath.row)
        cell.fill(with: product)
        cell.delegate = self

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ShoppingListViewController: DeletingProductDelegate {
    func remove(product: Product, with cell: ShoppingProductCell) {
        output.removeFromShoppingList(product)
        if let indexPath = tableView.indexPath(for: cell) {
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .middle)
            self.tableView.endUpdates()
        }
    }
}
