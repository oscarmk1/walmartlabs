//
//  SAMProductViewController.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/21/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit

class SAMProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let productCellReuseIdentifier = "productCellReuseIdentifier"
    fileprivate let productCellLoadingFooterIdentifier = "productCellLoadingFooterIdentifier"
    fileprivate let pageSize = 30
    fileprivate let firstPage = 1
    
    fileprivate var response: SAMproductResponse?
    fileprivate var products: [SAMProduct]?
    fileprivate var loadingNextPage = false
    fileprivate var paginationManager: SAMPaginationManager?
    fileprivate lazy var service = SAMProductService()
    fileprivate weak var footerView: SAMLoadingFooterView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service.fetchProducts(paginationData: SAMPaginationManager.paginationAsString(currentPage: firstPage, pageSize: pageSize)) {[unowned self] (error, response) in
            guard error == nil, let response = response else {
                //TODO: Show error
                return
            }
            self.response = response
            self.products = response.products
            self.paginationManager = SAMPaginationManager(pageSize: self.pageSize, totalSize: response.totalProducts!)
            self.tableView.reloadData()
        }
        
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func configureUI() {
        let navImageView = UIImageView(image: UIImage(named: "samsclublogo"))
        navImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = navImageView
        
        self.tableView.estimatedRowHeight = 115
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.register(UINib(nibName: String(describing: SAMProductTableViewCell.self), bundle: nil) , forCellReuseIdentifier: productCellReuseIdentifier)
        let footerView: SAMLoadingFooterView = .fromNib()
        self.tableView.tableFooterView = footerView
        self.footerView = footerView
    }
    
    fileprivate func loadNextPage() {
        let pagination = self.paginationManager?.nextPage()
        if let paginationData = pagination {
            self.footerView?.startAnimating()
            self.service.fetchProducts(paginationData: paginationData, completionBlock: {[unowned self] (error, response) in
                self.loadingNextPage = false
                self.footerView?.stopAnimating()
                guard error == nil, let response = response else {
                    //TODO: Show error
                    return
                }
                self.products?.append(contentsOf: response.products!)
                self.tableView.reloadData()
            })
        }
        else {
            self.footerView?.doneLoading()
        }
    }
}

extension SAMProductViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = SAMProductDetailViewController()
        detailVC.product = self.products?[indexPath.row]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastProduct = self.products!.count - 1
        if !self.loadingNextPage && indexPath.row == lastProduct {
            self.loadingNextPage = true
            loadNextPage()
        }
    }
}

extension SAMProductViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products != nil ? products!.count : 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: productCellReuseIdentifier) as! SAMProductTableViewCell
        
        let product = products?[indexPath.row]
        if let product = product {
            productCell.configureWith(product)
        }
        
        return productCell
    }
}
