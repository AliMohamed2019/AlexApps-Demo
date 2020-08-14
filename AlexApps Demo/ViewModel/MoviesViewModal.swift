//
//  MoviesViewModal.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/13/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import Foundation

struct MovieViewModel {
    let image: String
    let title: String
    let date: String
    let publishedBy: String
    
    init(movie: Movie) {
        title = movie.display_title
        date = movie.publication_date
        publishedBy = movie.byline
        image = movie.multimedia.src
    }
}
