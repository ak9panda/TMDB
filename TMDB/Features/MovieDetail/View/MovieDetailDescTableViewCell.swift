//
//  MovieDetailDescTableViewCell.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit

final class MovieDetailDescTableViewCell: BaseTableViewCell {
    fileprivate let descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .darkGray
        descLabel.font = UIFont.systemFont(ofSize: 13)
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .left
        return descLabel
    }()
    
    fileprivate let line: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let website: UILabel = {
        let website = UILabel()
        website.textColor = .darkGray
        website.font = UIFont.systemFont(ofSize: 13)
        website.numberOfLines = 0
        website.textAlignment = .left
        return website
    }()
    
    fileprivate let genre: UILabel = {
        let genre = UILabel()
        genre.textColor = .darkGray
        genre.font = UIFont.systemFont(ofSize: 13)
        genre.numberOfLines = 0
        genre.textAlignment = .left
        return genre
    }()
    
    override func prepareView() {
        addSubview(descLabel)
        addSubview(line)
        addSubview(website)
        addSubview(genre)
    }
    
    override func setConstraintsView() {
        descLabel.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        line.snp.makeConstraints{(make) in
            make.top.equalTo(descLabel.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        website.snp.makeConstraints{(make) in
            make.top.equalTo(line.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        genre.snp.makeConstraints{(make) in
            make.top.equalTo(website.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    
    func configureData(data: DetailMoviesResponse?) {
        descLabel.attributedText = attributeText(boldText: "Overview: ", lightText: "\n\n\(data?.overview ?? "")")
        website.attributedText = attributeText(boldText: "Website :", lightText: "\n\n\(data?.homepage ?? "-")")
        guard let genreArray = data?.genres?.map({$0.name}) else {return}
        genre.attributedText = attributeText(boldText: "Genre :", lightText: "\n\n\(genreArray.map{$0!}.joined(separator: ", "))")
    }
    
    fileprivate func attributeText(boldText: String, lightText: String) -> NSMutableAttributedString {
        let text = NSMutableAttributedString(string: boldText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)])
        text.append(NSAttributedString(string: lightText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)]))
        return text
    }
}
