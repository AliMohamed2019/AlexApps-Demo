//
//  DetailsViewController.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/13/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var summeryLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!{
        didSet {
            movieImage.layer.cornerRadius = 5
        }
    }
    
    var moviewViewModel: MoviesCellViewModel?
    private let imagePlaceholder = "imagePlaceholder"
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        setUpView()
    }
    
    func setUpView(){
        if let movie = moviewViewModel {
            movieImage.setImage(FromURL: movie.image, placeholder: imagePlaceholder)
            movieImage.contentMode = .scaleAspectFill
            titleLabel.text = movie.title
            dateLabel.text = movie.date
            publisherLabel.text = movie.publishedBy
            summeryLabel.text = movie.summry
        }
    }

}
