//
//  PresentationLayer.swift
//  CleanArchitectureTest
//
//  Created by HaeSik Jang on 1/3/24.
//

protocol MoviesListViewModelInput {
    func didSearch(query: String)
    func didSelect(at indexPath: IndexPath)
}

protocol MoviesListViewModelOutput {
    var items: Observable<[MoviesListItemViewModel]> { get }
    var error: Observable<String> { get }
}

protocol MoviesListViewModel: MoviesListViewModelInput, MoviesListViewModelOutput { }

struct MoviesListViewModelActions {
    // Note: if you would need to edit movie inside Details screen and update this
    // MoviesList screen with Updated movie then you would need this closure:
    //  showMovieDetails: (Movie, @escaping (_ updated: Movie) -> Void) -> Void
    let showMovieDetails: (Movie) -> Void
}

final class DefaultMoviesListViewModel: MoviesListViewModel {
    
    private let searchMoviesUseCase: SearchMoviesUseCase
    private let actions: MoviesListViewModelActions?
    
    private var movies: [Movie] = []
    
    // MARK: - OUTPUT
    let items: Observable<[MoviesListItemViewModel]> = Observable([])
    let error: Observable<String> = Observable("")
    
    init(searchMoviesUseCase: SearchMoviesUseCase,
         actions: MoviesListViewModelActions) {
        self.searchMoviesUseCase = searchMoviesUseCase
        self.actions = actions
    }
    
    private func load(movieQuery: MovieQuery) {
        
        searchMoviesUseCase.execute(movieQuery: movieQuery) { result in
            switch result {
            case .success(let moviesPage):
                // Note: We must map here from Domain Entities into Item View Models. Separation of Domain and View
                self.items.value += moviesPage.movies.map(MoviesListItemViewModel.init)
                self.movies += moviesPage.movies
            case .failure:
                self.error.value = NSLocalizedString("Failed loading movies", comment: "")
            }
        }
    }
}

// MARK: - INPUT. View event methods
extension MoviesListViewModel {
    
    func didSearch(query: String) {
        load(movieQuery: MovieQuery(query: query))
    }
    
    func didSelect(at indexPath: IndexPath) {
        actions?.showMovieDetails(movies[indexPath.row])
    }
}

// Note: This item view model is to display data and does not contain any domain model to prevent views accessing it
struct MoviesListItemViewModel: Equatable {
    let title: String
}

extension MoviesListItemViewModel {
    init(movie: Movie) {
        self.title = movie.title ?? ""
    }
}
