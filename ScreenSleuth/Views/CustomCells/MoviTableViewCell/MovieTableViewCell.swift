//
//  MovieTableViewCell.swift
//  ScreenSleuth
//
//  Created by Home on 5/3/2024.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImage: WebImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genrefirstLabel: UILabel!
    @IBOutlet weak var genresecondLabel: UILabel!
    @IBOutlet weak var genrethirdLabel: UILabel!
    
    private var viewModel: MovieTableViewCellViewModel? {
        didSet {
            setupViews()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with viewModel: MovieTableViewCellViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupViews() {
        setupPosterImage()
        setupTitleLabel()
        setupGenreLabels()
    }
    
    private func setupPosterImage() {
        posterImage.setup(withURLString: viewModel?.posterImageURLString ?? "")
    }
    
    private func setupTitleLabel() {
        titleLabel.text = viewModel?.title
    }
    
    private func setupGenreLabels() {}
}
