//
//  Reducer.swift
//  Redux_test
//
//  Created by HaeSik Jang on 2023/03/04.
//

import Foundation


typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(_ state: inout AppState, _ action: AppAction) -> Void{
    
    // 들어오는 액션에 따라 분기 처리 - 필터링
    
    switch action{
    case .rollTheDice:
        
        state.currentDice = ["🀲", "🀳", "🀴", "🀵", "🀶", "🀷"]
    }
}
🀳
