//
//  SAMPaginationManager.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/22/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import Foundation

public class SAMPaginationManager {

    private var currentPage = 1
    private var pageSize: Int
    private var totalSize: Int

    init(pageSize: Int, totalSize: Int) {
        self.pageSize = pageSize
        self.totalSize = totalSize
    }
    
    public func nextPage() -> String? {
        guard currentPage * pageSize <= totalSize else {
            return nil
        }
        currentPage += 1
        return SAMPaginationManager.paginationAsString(currentPage: currentPage, pageSize: pageSize)
    }
    
    static public func paginationAsString(currentPage: Int, pageSize: Int) -> String {
        return String(currentPage) + "/" + String(pageSize)
    }
}
