//
//  TableViewCell.swift
//  AlexApps Demo
//
//  Created by Ali Mohamed on 8/13/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var cellPublisher: UILabel!
    
    var moviewCellViewModel: MoviesCellViewModel! {
        didSet {
            cellTitle.text = moviewCellViewModel.title
            cellDate.text = moviewCellViewModel.date
            cellPublisher.text = moviewCellViewModel.publishedBy
            cellImage.setImage(FromURL: moviewCellViewModel.image, placeholder: "MoviePlaceholder")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

