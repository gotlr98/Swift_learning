//
//  MoviesListViewController.swift
//  CleanArchitectureTest
//
//  Created by HaeSik Jang on 1/5/24.
//

import Foundation
import UIKit

final class MoviesListViewController: UIViewController, StoryboardInstantiable, UISearchBarDelegate {
    
    private var viewModel: MoviesListViewModel!
    
    final class func create(with viewModel: MoviesListViewModel) -> MoviesListViewController {
        let vc = MoviesListViewController.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
    }
    
    private func bind(to viewModel: MoviesListViewModel) {
        viewModel.items.observe(on: self) { [weak self] items in
            self?.moviesTableViewController?.items = items
        }
        viewModel.error.observe(on: self) { [weak self] error in
            self?.showError(error)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        viewModel.didSearch(query: searchText)
    }
}
