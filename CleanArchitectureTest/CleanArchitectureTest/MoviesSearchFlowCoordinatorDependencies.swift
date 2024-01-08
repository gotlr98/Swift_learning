//
//  MoviesSearchFlowCoordinatorDependencies.swift
//  CleanArchitectureTest
//
//  Created by HaeSik Jang on 1/8/24.
//

import Foundation

protocol MoviesSearchFlowCoordinatorDependencies  {
    func makeMoviesListViewController() -> UIViewController
    func makeMoviesDetailsViewController(movie: Movie) -> UIViewController
}

final class MoviesSearchFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: MoviesSearchFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: MoviesSearchFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // Note: here we keep strong reference with actions closures, this way this flow do not need to be strong referenced
        let actions = MoviesListViewModelActions(showMovieDetails: showMovieDetails)
        let vc = dependencies.makeMoviesListViewController(actions: actions)
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func showMovieDetails(movie: Movie) {
        let vc = dependencies.makeMoviesDetailsViewController(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
}
