//
//  MovieVerticalCollectionViewCell.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit
import SDWebImage

final class MovieVerticalCollectionViewCell: BaseCollectionViewCell {
    private let imgPoster: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let lblTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    private let starIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private let lblRating: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .darkGray
        descLabel.font = UIFont.systemFont(ofSize: 13)
        descLabel.numberOfLines = 1
        descLabel.textAlignment = .left
        return descLabel
    }()
    
    override func setupViews() {
        self.backgroundColor = .white
        addSubview(imgPoster)
        addSubview(lblTitle)
        addSubview(starIcon)
        addSubview(lblRating)
    }
    
    override func setConstraintsView() {
        imgPoster.snp.makeConstraints{(make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(230)
        }
        
        lblTitle.snp.makeConstraints{(make) in
            make.top.equalTo(imgPoster.snp_bottomMargin).offset(20)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
        starIcon.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(5)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(lblRating)
        }
        
        lblRating.snp.makeConstraints{(make) in
            make.top.equalTo(lblTitle.snp_bottomMargin).offset(10)
            make.left.equalTo(starIcon.snp_rightMargin).offset(10)
        }
    }
    
    func configureCell(data: UpcomingMoviesModel?) {
        imgPoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(data?.posterPath ?? "")"), placeholderImage: UIImage(systemName: "photo"))
        lblTitle.text = data?.title
        lblRating.text = "\(data?.voteAverage ?? 0)"
    }
}
