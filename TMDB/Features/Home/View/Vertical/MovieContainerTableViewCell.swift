//
//  MovieContainerTableViewCell.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit
import SnapKit

class MovieContainerTableViewCell: BaseTableViewCell {
    
    var movieList: [UpcomingMoviesModel] = []
    var presenter: ViewToPresenterProtocol?
    var navigationController: UINavigationController?
    
    private lazy var moviesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 00, left: 30, bottom: 0, right: 30)
        collectionView.registerCellClass(MovieVerticalCollectionViewCell.self)
        return collectionView
    }()
    
    private let line: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func prepareView() {
        self.backgroundColor = .clear
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        moviesCollectionView.isUserInteractionEnabled = true
        self.contentView.addSubview(moviesCollectionView)
        self.contentView.addSubview(line)
    }
    
    override func setConstraintsView() {
        moviesCollectionView.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        line.snp.makeConstraints{(make) in
            make.top.equalTo(moviesCollectionView.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    
    func configureData(data: [UpcomingMoviesModel]?) {
        self.movieList = data ?? []
        moviesCollectionView.reloadData()
    }
}


extension MovieContainerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(MovieVerticalCollectionViewCell.self), for: indexPath) as? MovieVerticalCollectionViewCell {
            cell.configureCell(data: movieList[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let presenter = self.presenter,
              let movieId = self.movieList[indexPath.row].id else {return}
        presenter.showDetailMovieController(navigationController: self.navigationController ?? UINavigationController(), movieId: movieId)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 290)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
