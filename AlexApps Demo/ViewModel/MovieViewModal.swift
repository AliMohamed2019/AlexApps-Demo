//
//  MoviesViewModal.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/13/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import Foundation

class MoviesViewModel {
    
    typealias clousre = (()->())
    
    var reloadTableView: clousre?
    var changeActivityIndicatorStatus: clousre?
    
    var numberOfCells: Int {
        return moviesViewModels.count
    }
    
    private var moviesViewModels = [MoviesCellViewModel](){
        didSet{
            self.reloadTableView?()
        }
    }
    
    var state: State = .empty {
        didSet{
            self.changeActivityIndicatorStatus?()
        }
    }
    
    func fetchMovies(){
        self.state = .loading
        Service.shared.fetchData {[weak self] (movies, error) in
            guard let self = self else {return}
            
            guard  error == nil else {
                self.state = .error
                return
            }
            
            let movies = movies?.results
            self.moviesViewModels = movies?.map({return MoviesCellViewModel(movie: $0)}) ?? []
            self.state = .ready
        }
    }
    
    func getCellMovie( at indexPath: IndexPath)-> MoviesCellViewModel {
        return moviesViewModels[indexPath.row]
    }
}

enum State {
    case loading
    case error
    case ready
    case empty
}
