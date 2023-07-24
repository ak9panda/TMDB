//
//  MovieDetailHeaderTableViewCell.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit
import SDWebImage

class MovieDetailHeaderTableViewCell: BaseTableViewCell {

    private let imgHeader: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let imgPoster: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let lblMovieTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    private let transparentBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let star: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private let lblRating: UILabel = {
        let rating = UILabel()
        rating.textColor = .darkGray
        rating.font = UIFont.systemFont(ofSize: 13)
        rating.numberOfLines = 1
        rating.textAlignment = .left
        return rating
    }()
    
    private let lineBorder1: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imagePeopleCount: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private let lblPeopleCount: UILabel = {
        let peopleCount = UILabel()
        peopleCount.textColor = .darkGray
        peopleCount.font = UIFont.systemFont(ofSize: 13)
        peopleCount.numberOfLines = 1
        peopleCount.textAlignment = .left
        return peopleCount
    }()
    
    private let lineBorder2: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imagePopularity: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "play.rectangle")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private let lblPopularityCount: UILabel = {
        let popularity = UILabel()
        popularity.textColor = .darkGray
        popularity.font = UIFont.systemFont(ofSize: 13)
        popularity.numberOfLines = 1
        popularity.textAlignment = .left
        return popularity
    }()
    
    override func prepareView() {
        addSubview(imgHeader)
        addSubview(transparentBackground)
        addSubview(imgPoster)
        addSubview(lblMovieTitle)
        addSubview(star)
        addSubview(lblRating)
        addSubview(lineBorder1)
        addSubview(imagePeopleCount)
        addSubview(lblPeopleCount)
        addSubview(lineBorder2)
        addSubview(imagePopularity)
        addSubview(lblPopularityCount)
    }
    
    override func setConstraintsView() {
        imgHeader.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(230)
        }
        
        transparentBackground.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(self)
            make.height.equalTo(230)
        }
        
        imgPoster.snp.makeConstraints{(make) in
            make.top.equalTo(imgHeader.snp_bottomMargin).offset(-60)
            make.left.equalTo(self).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(120)
            make.bottom.equalToSuperview()
        }
        
        lblMovieTitle.snp.makeConstraints{(make) in
            make.bottom.equalTo(imgHeader.snp_bottomMargin).offset(-5)
            make.left.equalTo(imgPoster.snp_rightMargin).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        star.snp.makeConstraints{(make) in
            make.left.equalTo(imgPoster.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(lblRating)
        }
        
        lblRating.snp.makeConstraints{(make) in
            make.top.equalTo(imgHeader.snp_bottomMargin).offset(20)
            make.left.equalTo(star.snp_rightMargin).offset(20)
        }
        
        lineBorder1.snp.makeConstraints{(make) in
            make.centerY.equalTo(lblRating)
            make.height.equalTo(20)
            make.left.equalTo(lblRating.snp_rightMargin).offset(20)
            make.width.equalTo(1)
        }
        
        imagePeopleCount.snp.makeConstraints{(make) in
            make.left.equalTo(lineBorder1.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(lblPeopleCount)
        }
        
        lblPeopleCount.snp.makeConstraints{(make) in
            make.top.equalTo(imgHeader.snp_bottomMargin).offset(20)
            make.left.equalTo(imagePeopleCount.snp_rightMargin).offset(20)
        }
        
        lineBorder2.snp.makeConstraints{(make) in
            make.centerY.equalTo(lblPeopleCount)
            make.height.equalTo(20)
            make.left.equalTo(lblPeopleCount.snp_rightMargin).offset(20)
            make.width.equalTo(1)
        }
        
        imagePopularity.snp.makeConstraints{(make) in
            make.left.equalTo(lineBorder2.snp_rightMargin).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(14)
            make.centerY.equalTo(lblPopularityCount)
        }
        
        lblPopularityCount.snp.makeConstraints{(make) in
            make.top.equalTo(imgHeader.snp_bottomMargin).offset(20)
            make.left.equalTo(imagePopularity.snp_rightMargin).offset(20)
        }
    }
    
    func configureData(data: DetailMoviesResponse?) {
        let placeHolderImg = UIImage(systemName: "photo")
        imgHeader.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(data?.backdropPath ?? "")"), placeholderImage: placeHolderImg)
        imgPoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(data?.posterPath ?? "")"), placeholderImage: placeHolderImg)
        lblMovieTitle.text = data?.originalTitle
        lblRating.text = "\(data?.voteAverage ?? 0)"
        lblPeopleCount.text = "\(data?.voteCount ?? 0)"
        lblPopularityCount.text = "\(data?.popularity ?? 0)"
    }
}
