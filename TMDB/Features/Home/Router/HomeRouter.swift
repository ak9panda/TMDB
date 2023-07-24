//
//  HomeRouter.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import RxSwift

class HomeRouter: PresenterToRouterProtocol {
    static func createModule() -> HomeViewController {
        let controller = HomeViewController()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router:PresenterToRouterProtocol = HomeRouter()
        
        controller.presenter = presenter
        controller.title = "Movie DB"
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
    
    func showDetailMovieController(navigationController: UINavigationController, movieId: Int) {
        let detailModule = MovieDetailRouter.createModule(movieId: movieId)
        navigationController.pushViewController(detailModule, animated: true)
    }
}
