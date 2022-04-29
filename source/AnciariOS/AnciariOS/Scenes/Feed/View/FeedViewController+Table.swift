//
//  FeedViewController+Table.swift
//  AnciariOS
//
//  Created by Ravindran on 29/04/22.
//

import Foundation
import UIKit

extension FeedViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        feedViewModel.getNumberOfFeedSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedViewModel.getNumberOfRowsPerSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            return getDoubleElementCell(tableView, indexPath: indexPath)
        } else {
            return getSingleElementCell(tableView, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 120
        } else {
            return 240
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return feedViewModel.getSectionKey(section)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let confirmedHeaderView = view as? UITableViewHeaderFooterView {
            confirmedHeaderView.textLabel?.text = feedViewModel.getSectionKey(section)
        }
    }
    
    func getSingleElementCell(_ tableView: UITableView, indexPath: IndexPath) -> FeedSingleElementCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FeedSingleElementCell.cellIdentifier,
                                                    for: indexPath) as? FeedSingleElementCell,
            let feedData = feedViewModel.getFeed(indexPath.section, row: indexPath.row),
            let confirmedUrl = feedData.firstImageUrl {
            
            cell.setImage(imagePath: confirmedUrl)
            cell.selectionStyle = .none
            return cell
            
        }
        return FeedSingleElementCell()
    }
    
    func getDoubleElementCell(_ tableView: UITableView, indexPath: IndexPath) -> FeedDoubleElementCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FeedDoubleElementCell.cellIdentifier,
                                                    for: indexPath) as? FeedDoubleElementCell,
            let feedData = feedViewModel.getFeed(indexPath.section, row: indexPath.row) {
            
            if let confirmedFirstUrl = feedData.firstImageUrl {
                cell.setLeftImage(imagePath: confirmedFirstUrl)
            }
            
            if let confirmedSecondUrl = feedData.secondImageUrl {
                cell.setRightImage(imagePath: confirmedSecondUrl)
            }
            
            cell.selectionStyle = .none
            return cell
        }
        return FeedDoubleElementCell()
    }

}
