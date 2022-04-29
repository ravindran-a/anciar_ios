//
//  FeedViewModel.swift
//  AnciariOS
//
//  Created by Ravindran on 29/04/22.
//

import Foundation

class FeedViewModel {
    
    var feedData: [String: [Feed]] = [String: [Feed]]()
    
    func getNumberOfFeedSections() -> Int {
        return feedData.keys.count
    }
    
    func getNumberOfRowsPerSection(_ section: Int) -> Int? {
        return feedData[getSectionKey(section)]?.count
    }
    
    func getSectionKey(_ section: Int) -> String {
        return feedData.map { String($0.key) }[section]
    }
    
    func getFeed(_ section: Int, row: Int) -> Feed? {
        return feedData[getSectionKey(section)]?[row]
    }
    
    func createFeedData(completionHandler: ((Error?) -> Void)? = nil) {
        DispatchQueue.global().async {[weak self] in
            let months = Calendar.current.monthSymbols
            for month in months {
                var monthFeed: [Feed] = [Feed]()
                for index in 0..<4 {
                    if index % 2 == 0 {
                        monthFeed.append(Feed(firstImageUrl: ImageRepo.images.randomElement(), secondImageUrl: ImageRepo.images.randomElement()))
                    } else {
                        monthFeed.append(Feed(firstImageUrl: ImageRepo.images.randomElement()))
                    }
                }
                self?.feedData[month + " Feed"] = monthFeed
            }
            DispatchQueue.main.async {
                completionHandler?(nil)
            }
        }
    }
    
}
