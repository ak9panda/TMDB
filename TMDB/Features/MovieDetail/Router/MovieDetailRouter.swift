//
//  MovieDetailRouter.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import UIKit

class MovieDetailRouter: DetailPresenterToRouterProtocol {
    static func createModule(movieId: Int) -> MovieDetailViewController {
        let presenter: DetailViewToPresenterProcol & DetailInteractorToPresenterProtocol = MovieDetailPresenter()
        let interactor: DetailPresenterToInteractorProtocol = MovieDetailInteractor()
        let router: DetailPresenterToRouterProtocol = MovieDetailRouter()
        
        let controller = MovieDetailViewController()
        controller.movieId = movieId
        controller.presenter = presenter
        controller.title = "Movie Detail"
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
