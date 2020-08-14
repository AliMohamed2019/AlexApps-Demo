//
////   let movies = try? newJSONDecoder().decode(Movies.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Movies
//struct Movies: Codable {
//    let status, copyright: String
//    let has_more: Bool
//    let num_results: Int
//    let results: [Movie]
//}
//
//// MARK: - Result
//struct Movie: Codable {
//    let display_title: String
//    let mpaa_rating: String
//    let critics_pick: Int
//    let byline, headline, summary_short, publication_date: String
//    let opening_date: String?
//    let date_updated: String
//    let link: String
//    let multimedia: Multimedia?
//}
//
//// MARK: - Multimedia
//struct Multimedia: Codable {
//    let type: String
//    let src: String
//    let width, height: Int
//}



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movies = try? newJSONDecoder().decode(Movies.self, from: jsonData)

//import Foundation
//
//// MARK: - Movies
//struct Movies: Codable {
//    let status, copyright: String
//    let has_more: Bool
//    let num_results: Int
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let display_title: String
//    let mpaa_rating: String
//    let critics_pick: Int
//    let byline, headline, summary_short, publication_date: String
//    let opening_date: String?
//    let date_updated: String
//    let link: Link
//    let multimedia: Multimedia?
//}
//
//// MARK: - Link
//struct Link: Codable {
//    let type: String
//    let url: String
//    let suggested_link_text: String
//}
//
//// MARK: - Multimedia
//struct Multimedia: Codable {
//    let type: String
//    let src: String
//    let width, height: Int
//}


import Foundation

// MARK: - Movies
struct Movies: Codable {
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable {
    let display_title: String
    let byline, headline, summary_short, publication_date: String
    let multimedia: Multimedia?
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let src: String
}
