//
//  ViewController.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/12/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var viewModel = MoviesViewModel()
    private let cellIdentifier = "MovieCell"
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initViewModel()
    }
    
    //MARK:- init VM
    func initViewModel() {
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.moviesTableView.reloadData()
            }
        }
        
        viewModel.changeActivityIndicatorStatus = { [weak self] () in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                switch self.viewModel.state {
                case .empty :
                    self.activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 0.3) {
                        self.moviesTableView.alpha = 0
                        self.messageLabel.alpha = 0
                    }
                case .error:
                    self.activityIndicator.stopAnimating()
                    self.messageLabel.text = "Couldn't load data"
                    UIView.animate(withDuration: 0.3) {
                        self.moviesTableView.alpha = 0
                        self.messageLabel.alpha = 1
                    }
                case .loading:
                    self.messageLabel.text = "Loading..."
                    self.activityIndicator.startAnimating()
                    UIView.animate(withDuration: 0.3) {
                        self.moviesTableView.alpha = 0
                        self.messageLabel.alpha = 1
                    }
                case .ready:
                    self.activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 0.3) {
                        self.moviesTableView.alpha = 1
                        self.messageLabel.alpha = 0
                    }
                }
            }
        }
        viewModel.fetchMovies()
    }
    
    //MARK:- Nav Bar
    private func setupNavBar(){
        self.navigationItem.title = "Home"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.5)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}

//MARK:- TableView Setup
extension ViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    // MARK:- Cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath) as! TableViewCell
        let movieCellModelView = viewModel.getCellMovie(at: indexPath)
        cell.moviewCellViewModel = movieCellModelView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // MARK:- Did Select Row At
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcid = "DetailsVC"
        if let vc = storyboard?.instantiateViewController(withIdentifier: vcid) as? DetailsViewController {
            
            let cellMovie = viewModel.getCellMovie(at: indexPath)
            vc.moviewViewModel = cellMovie
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
