//
//  HomeViewController.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    
    private var upcomingMovies: [UpcomingMoviesModel] = []
    private var popularMovies: [UpcomingMoviesModel] = []
    private var dataGenre: [MovieGenresModel] = []
    
    fileprivate var moviesTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.registerCellClass(MovieHorizontalTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}


// MARK: - HELPER FUNCTIONS
extension HomeViewController {
    
    fileprivate func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .red
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        view.addSubview(moviesTableView)
        setTableViewContraints()
        fetchPresenter()
    }
    
    private func fetchPresenter() {
        presenter?.fetchingHome()
    }
    
    fileprivate func setTableViewContraints() {
        moviesTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    fileprivate func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
}


// MARK: - CONFORM TO PRESENTER PROTOCOL
extension HomeViewController: PresenterToViewProtocol {
    func showGenreMovie(data: [MovieGenresModel]?) {
        self.dataGenre = data ?? []
//        self.moviesTableView.reloadData()
    }
    
    func showUpcomingMovies(data: [UpcomingMoviesModel]?) {
        self.upcomingMovies = data ?? []
        self.moviesTableView.reloadData()
    }
    
    func showPopularMoviesData(data: [UpcomingMoviesModel]?) {
        self.popularMovies = data ?? []
        self.moviesTableView.reloadData()
    }
    
    
    func showError(error: String) {
        showAlert(title: "Error", message: error)
    }
    
    func isLoading(isLoading: Bool) {
        // to do show loading
    }
}


// MARK: - DATASOURCE AND DELEGATE
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let secionTitle = section == 0 ? "Popular Movies" : "Upcoming Movies"
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        headerView.backgroundColor = .white
        let title: UILabel = {
            let titleLabel = UILabel()
            titleLabel.textColor = .black
            titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            titleLabel.numberOfLines = 1
            titleLabel.textAlignment = .left
            titleLabel.text = secionTitle
            return titleLabel
        }()
        headerView.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp_topMargin)
            make.right.equalTo(headerView.snp_rightMargin).offset(-20)
            make.bottom.equalTo(headerView.snp_bottomMargin)
            make.left.equalTo(headerView.snp_leftMargin).offset(20)
        }
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.upcomingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = MovieContainerTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: MovieContainerTableViewCell.identifier)
            cell.presenter = self.presenter
            cell.navigationController = self.navigationController
            cell.configureData(data: self.popularMovies)
            return cell
        case 1:
            let cell = MovieHorizontalTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: MovieHorizontalTableViewCell.identifier)
            cell.configureCell(data: upcomingMovies[indexPath.row])
            return cell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let movieId = upcomingMovies[indexPath.row].id else {return}
        presenter?.showDetailMovieController(navigationController: navigationController ?? UINavigationController(), movieId: movieId)
    }
}
