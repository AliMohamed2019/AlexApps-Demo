//
//  MoviesCellViewModel.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/14/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import Foundation

struct MoviesCellViewModel {
    let image: String
    let title: String
    let date: String
    let publishedBy: String
    let summry: String
    
    init(movie: Movie) {
        title = movie.display_title
        date = movie.publication_date
        publishedBy = movie.byline
        summry = movie.summary_short
        if let image = movie.multimedia?.src {
            self.image = image
        } else {
            self.image = ""
        }
    }
}

