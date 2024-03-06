//
//  MovieTableViewCell.swift
//  ScreenSleuth
//
//  Created by Home on 5/3/2024.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genrefirstLabel: UILabel!
    @IBOutlet weak var genresecondLabel: UILabel!
    @IBOutlet weak var genrethirdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
