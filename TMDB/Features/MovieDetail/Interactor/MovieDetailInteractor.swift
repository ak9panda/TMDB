//
//  MovieDetailInteractor.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation
import RxSwift

final class MovieDetailInteractor: DetailPresenterToInteractorProtocol {
    var presenter: DetailInteractorToPresenterProtocol?
    private let service: NetworkManager
    private let disposeBag = DisposeBag()

    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func startFechingDetailMovie(id: Int) {
        
        service.fetchDetailMovie(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] tasks in
                guard let `self` = self, let tasks = tasks else { return }
                self.presenter?.successLoadDetail(data: tasks)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
            
            
    }
}
