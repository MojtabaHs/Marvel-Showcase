//
//  MarvelAPITests.swift
//  MarvelAPITests
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/22/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import XCTest
@testable import MarvelAPI

class MarvelAPITests: XCTestCase {
    
    /// Current bundle
    lazy var bundle = Bundle(for: type(of: self))
    
    /// Default json decoder
    lazy var josnDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
    /// Default date formatter
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        return formatter
    }()
    
    
    
    // MARK: - Common
    
    
    
    // MARK: - URL
    
    lazy var url = Entity.Common.URL(
        type: "detail",
        url: "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=4ee1eda14970cccd2431512475c6b888"
    )
    
    func testDecodingURL() {
        XCTAssertEqualityCheck(desiredObject: url, jsonWithName: "URL")
    }
    
    
    
    // MARK: - Image
    
    lazy var image = Entity.Common.Image(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
        extension: "jpg"
    )
    
    func testDecodingImage() {
        XCTAssertEqualityCheck(desiredObject: image, jsonWithName: "Image")
    }
    
    
    
    // MARK: - TextObject
    
    lazy var textObject = Entity.Common.TextObject(
        type: "issue_solicit_text",
        language: "en-us",
        text: "Collecting the first six art books of Marvel's REFLECTIONS series from multiple Eisner Award-nominated creator David Mack, this gorgeous volume of cover paintings and step-by-step art techniques is being presented in oversized hardcover format to show off Mack's work to full effect. Readers have been waiting for an oversized art-book collection of Mack's work for years, and this monster volume delivers with loads of extras -- including never-before-seen art, new paintings, a cover gallery, figure studies, step-by-step art techniques and commentary, remastered pages, new design pages, a \"Best of Letters\" section, and more! A whopping 320 pages with extra features -- all elegantly collected in a high-end oversized hardcover with high-quality paper, embossment, and an all-new introduction and interview!\r\n320PGS./$39.99\r\nISBN: 978-0-7851-4328-4\r\nTrim size: oversized"
    )
    
    func testDecodingTextObject() {
        XCTAssertEqualityCheck(desiredObject: textObject, jsonWithName: "TextObject")
    }
    
    
    
    // MARK: - Core
    
    
    
    // MARK: - Creator
    
    // TODO: Test Creator Instance
    
    lazy var creatorList = Entity.Core.Creator.List(
        available: 1,
        returned: 1,
        collectionURI: "http://gateway.marvel.com/v1/public/comics/25582/creators",
        items: [creatorSummary]
    )
    
    func testDecodingCreatorList() {
        XCTAssertEqualityCheck(desiredObject: creatorList, jsonWithName: "CreatorList")
    }
    
    
    
    // MARK: - Character
    
    lazy var character = Entity.Core.Character(
        id: 1011334,
        name: "3-D Man",
        description: "",
        modified: dateFormatter.date(from: "2014-04-29T14:18:17-0400")!,
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
        urls: [url],
        thumbnail: image,
        comics: comicList,
        stories: storyList,
        events: eventList,
        series: seriesList
    )
    
    func testDecodingCharacter() {
        XCTAssertEqualityCheck(desiredObject: character, jsonWithName: "Character")
    }
    
    
    
    lazy var characterList = Entity.Core.Character.List(
        available: 3,
        returned: 1,
        collectionURI: "http://gateway.marvel.com/v1/public/comics/16230/characters",
        items: [characterSummary]
    )
    
    func testDecodingCharacterList() {
        XCTAssertEqualityCheck(desiredObject: characterList, jsonWithName: "CharacterList")
    }
    
    
    
    lazy var characterSummary = Entity.Core.Character.Summary(
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1009220",
        name: "Captain America",
        role: nil
    )
    
    func testDecodingCharacterSummary() {
        XCTAssertEqualityCheck(desiredObject: characterSummary, jsonWithName: "CharacterSummary")
    }
    
    
    
    // MARK: - Event
    
    // TODO: Test Event Instance
    
    lazy var eventList = Entity.Core.Event.List(
        available: 1,
        returned: 1,
        collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/events",
        items: [eventSummary]
    )
    
    func testDecodingEventList() {
        XCTAssertEqualityCheck(desiredObject: eventList, jsonWithName: "EventList")
    }
    
    
    
    lazy var eventSummary = Entity.Core.Event.Summary(
        resourceURI: "http://gateway.marvel.com/v1/public/events/269",
        name: "Secret Invasion"
    )
    
    func testDecodingEventSummary() {
        XCTAssertEqualityCheck(desiredObject: eventSummary, jsonWithName: "EventSummary")
    }
    
    
    
    // MARK: - Comic
    
    // TODO: Test Comic Instance

    lazy var comicList = Entity.Core.Comic.List(
        available: 12,
        returned: 1,
        collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
        items: [comicSummary]
    )
    
    func testDecodingComicList() {
        XCTAssertEqualityCheck(desiredObject: comicList, jsonWithName: "ComicList")
    }
    
    
    
    lazy var comicSummary = Entity.Core.Comic.Summary(
        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
        name: "Avengers: The Initiative (2007) #14"
    )
    
    func testDecodingComicSummary() {
        XCTAssertEqualityCheck(desiredObject: comicSummary, jsonWithName: "ComicSummary")
    }
    
    
    
    lazy var creatorSummary = Entity.Core.Creator.Summary(
        resourceURI: "http://gateway.marvel.com/v1/public/creators/23",
        name: "David Mack",
        role: "penciller (cover)"
    )
    
    func testDecodingCreatorSummary() {
        XCTAssertEqualityCheck(desiredObject: creatorSummary, jsonWithName: "CreatorSummary")
    }
    
    
    
    // MARK: - Series
    
    // TODO: Test Series Instance

    lazy var seriesList = Entity.Core.Series.List(
        available: 3,
        returned: 1,
        collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series",
        items: [seriesSummary]
    )
    
    func testDecodingSeriesList() {
        XCTAssertEqualityCheck(desiredObject: seriesList, jsonWithName: "SeriesList")
    }
    
    
    
    lazy var seriesSummary = Entity.Core.Series.Summary(
        resourceURI: "http://gateway.marvel.com/v1/public/series/1945",
        name: "Avengers: The Initiative (2007 - 2010)"
    )
    
    func testDecodingSeriesSummary() {
        XCTAssertEqualityCheck(desiredObject: seriesSummary, jsonWithName: "SeriesSummary")
    }
    
    
    
    // MARK: - Story
    
    // TODO: Test Story Instance

    lazy var storyList = Entity.Core.Story.List(
        available: 21,
        returned: 1,
        collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/stories",
        items: [storySummary]
    )
    
    func testDecodingStoryList() {
        XCTAssertEqualityCheck(desiredObject: storyList, jsonWithName: "StoryList")
    }

    
    
    lazy var storySummary = Entity.Core.Story.Summary(
        resourceURI: "http://gateway.marvel.com/v1/public/stories/19947",
        name: "Cover #19947",
        type: "cover"
    )
    
    func testDecodingStorySummary() {
        XCTAssertEqualityCheck(desiredObject: storySummary, jsonWithName: "StorySummary")
    }
}



// MARK: - Helper extesnsion

extension MarvelAPITests {
    
    func pathToJSON(name: String) -> String? {
        return bundle.path(forResource: name, ofType: "json")
    }
    
    func XCTAssertEqualityCheck<T: Decodable & Equatable>(desiredObject: T, jsonWithName name: String) {
        guard let path = pathToJSON(name: name) else { return XCTFail("Test file not found") }
        do {
            let json = try String(contentsOfFile: path)
            guard let jsonData = json.data(using: .utf8) else { return XCTFail("Invalid test file") }
            
            let decodedTestFile = try josnDecoder.decode(T.self, from: jsonData)
            
            XCTAssert(decodedTestFile == desiredObject)
            
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
