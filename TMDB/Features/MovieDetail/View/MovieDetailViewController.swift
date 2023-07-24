//
//  MovieDetailViewController.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var presenter: DetailViewToPresenterProcol?
    var movieId: Int?
    
    private var data: DetailMoviesResponse?
    
    fileprivate var detailTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.registerCellClass(MovieDetailHeaderTableViewCell.self)
        tableView.registerCellClass(MovieDetailDescTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}


// MARK: - HELPER FUNCTIONS
extension MovieDetailViewController {
    
    fileprivate func setupView() {
        
        self.view.backgroundColor = .red
        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
        view.addSubview(detailTableView)
        setTableViewContraints()
        fetchData()
    }
    
    fileprivate func fetchData() {
        if let movieId = movieId {
            presenter?.startFechingDetailMovie(id: movieId)
        }
    }
    
    fileprivate func setTableViewContraints() {
        detailTableView.snp.makeConstraints { (make) in
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
extension MovieDetailViewController: DetailPresenterToViewProtocol {
    func successLoadDetail(data: DetailMoviesResponse?) {
        self.data = data
        detailTableView.reloadData()
    }
    
    func fetchFailed(error: String) {
        showAlert(title: "Error", message: error)
    }
    
    func isLoading(isLoading: Bool) {
        // to do show loading
    }
}


// MARK: - DATASOURCE AND DELEGATE
extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = MovieDetailHeaderTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: MovieDetailHeaderTableViewCell.identifier)
            cell.configureData(data: self.data)
            return cell
        case 1:
            let cell = MovieDetailDescTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: MovieDetailDescTableViewCell.identifier)
            cell.configureData(data: self.data)
            return cell
        default: return UITableViewCell()
        }
    }
}
