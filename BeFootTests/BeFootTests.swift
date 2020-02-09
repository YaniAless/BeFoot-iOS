//
//  BeFootTests.swift
//  BeFootTests
//
//  Created by Lukas Brasseleur on 18/12/2019.
//  Copyright © 2019 LukasYaniAless. All rights reserved.
//

import XCTest
@testable import BeFoot

class BeFootTests: XCTestCase {
    
    var leagueService: LeagueService {
        return LeagueServiceApi()
    }
    
    var matchService: MatchService {
        return MatchServiceApi()
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLeagueService(){
        
        var rankSize: Int = 0
        let expectation = self.expectation(description: "league")
        
        self.leagueService.getLeagueStanding(leagueId: 525) { rank in

            XCTAssertEqual(rankSize, 0)
            rankSize = rank.teams.count
            XCTAssertEqual(rank.teams.count, 20)
            
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    func testMatchService(){
        
        var matchCount: Int = 0
        let expectation = self.expectation(description: "matches")
        
        self.matchService.getByDate(date: "2020-02-08", leagueId: 525){ matches in

            XCTAssertEqual(matchCount, 0)
            matchCount = matches.fixtures.count
            XCTAssertEqual(matches.fixtures.count, 6)
            
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            testMatchService()
            // Put the code you want to measure the time of here.
        }
    }

}
