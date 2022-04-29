//
//  FeedViewController.swift
//  AnciariOS
//
//  Created by Ravindran on 29/04/22.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var feedTable: UITableView!
    lazy var feedViewModel: FeedViewModel = FeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupFeedTable()
        loadData()
    }
    
    func setupView() {
        self.title = "Anciar Feed"
        self.spinner.stopAnimating()
    }
    
    func setupFeedTable() {
        feedTable.register(UINib(nibName: FeedSingleElementCell.cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: FeedSingleElementCell.cellIdentifier)
        feedTable.register(UINib(nibName: FeedDoubleElementCell.cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: FeedDoubleElementCell.cellIdentifier)
        
        feedTable.refreshControl = UIRefreshControl()
        feedTable.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    @objc func handleRefresh() {
        self.feedTable.refreshControl?.endRefreshing()
        self.loadData()
    }
    
    func loadData() {
        self.spinner.startAnimating()
        self.feedViewModel.createFeedData { error in
            self.spinner.stopAnimating()
            if error != nil {
                
            } else {
                self.feedTable.reloadData()
            }
        }
    }

}
