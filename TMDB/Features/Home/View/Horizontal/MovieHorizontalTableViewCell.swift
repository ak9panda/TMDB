//
//  MovieHorizontalTableViewCell.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit
import SnapKit
import SDWebImage

final class MovieHorizontalTableViewCell: BaseTableViewCell {
    
    fileprivate lazy var imgMovieIcon: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    fileprivate lazy var lblMovieTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    fileprivate lazy var lblMovieDesc: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .darkGray
        descLabel.font = UIFont.systemFont(ofSize: 13)
        descLabel.numberOfLines = 4
        descLabel.textAlignment = .left
        return descLabel
    }()
    
    fileprivate let starIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    fileprivate lazy var lblRating: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .darkGray
        descLabel.font = UIFont.systemFont(ofSize: 13)
        descLabel.numberOfLines = 4
        descLabel.textAlignment = .left
        return descLabel
    }()
    
    override func prepareView() {
        addSubview(imgMovieIcon)
        addSubview(lblMovieTitle)
        addSubview(lblMovieDesc)
        addSubview(starIcon)
        addSubview(lblRating)
    }

    override func setConstraintsView() {
        imgMovieIcon.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.height.equalTo(130)
            make.bottom.equalToSuperview()
        }
        
        lblMovieTitle.snp.makeConstraints{(make) in
            make.top.equalTo(imgMovieIcon).offset(5)
            make.left.equalTo(imgMovieIcon.snp_rightMargin).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        lblMovieDesc.snp.makeConstraints{(make) in
            make.top.equalTo(lblMovieTitle.snp_bottomMargin).offset(10)
            make.left.equalTo(imgMovieIcon.snp_rightMargin).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        starIcon.snp.makeConstraints{(make) in
            make.left.equalTo(imgMovieIcon.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(lblRating)
        }
        
        lblRating.snp.makeConstraints{(make) in
            make.top.equalTo(lblMovieDesc.snp_bottomMargin).offset(20)
            make.left.equalTo(starIcon.snp_rightMargin).offset(10)
        }
    }
    
    func configureCell(data: UpcomingMoviesModel?) {
        imgMovieIcon.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(data?.posterPath ?? "")"), placeholderImage: UIImage(systemName: "photo"))
        lblMovieTitle.text = data?.title
        lblMovieDesc.text = data?.overview
        lblRating.text = "\(data?.voteAverage ?? 0)"
    }
}
