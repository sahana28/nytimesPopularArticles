//
//  NYTimesPopularArticlesTests.swift
//  NYTimesPopularArticlesTests
//
//  Created by admin on 6/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import XCTest
@testable import NYTimesPopularArticles

class NYTimesPopularArticlesTests: XCTestCase {
    var articleArray = [Article]()
    var jsonDictionary = [String: Any]()
    var articleDataLayer = ArticlesDataLayer()
    
    override func setUp() {
        super.setUp()
        if let path = Bundle.main.path(forResource: "articleResponse", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if jsonResult is Dictionary<String, AnyObject>{
                    jsonDictionary = jsonResult as! [String : Any]
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testArticleResponse() {
        articleArray = articleDataLayer.getArticles(responseObject: jsonDictionary as AnyObject)
        XCTAssertTrue(articleArray.count > 0,"article array is empty" )
        let article = articleArray[0]
        XCTAssertNotNil(article, "article is nil")
    }
    
    
    
}
