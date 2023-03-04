//
//  AppStore.swift
//  Redux_test
//
//  Created by HaeSik Jang on 2023/03/04.
//

import Foundation


typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject{
    
    // 외부에서 읽을수만 있도록 설정
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    init(state: State, reducer: @escaping Reducer<State, Action>){
        self.state = state
        self.reducer = reducer
    }
}
