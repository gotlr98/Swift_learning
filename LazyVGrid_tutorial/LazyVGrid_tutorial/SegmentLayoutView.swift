//
//  SegmentLayoutView.swift
//  LazyVGrid_tutorial
//
//  Created by HaeSik Jang on 2023/03/02.
//

import Foundation
import SwiftUI

enum LayoutType: CaseIterable{
    case table, grid, multiple
}

extension LayoutType{
    
    // Layout Type에 대한 컬럼이 자동으로 설정되도록
    
    var columns: [GridItem] {
        switch self{
        case .table:
            return [
                GridItem(.flexible())
            ]
        case .grid:
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .multiple:
            return [
                GridItem(.adaptive(minimum: 100))
            ]
        }
    }
}

struct SegmentLayoutView: View{
    
    var dummyData = MyModel.dummyDataArray
    
    @State var selectedLayoutType: LayoutType = .table
    
    
    var body: some View{
        VStack{
            Picker(selection: $selectedLayoutType, label: Text("Picker View"), content: {
                ForEach(LayoutType.allCases, id: \.self, content: { layoutType in
                    switch layoutType{
                    case .table:
                        Image(systemName: "list.dash")
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                    case .multiple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                })
            })
            .frame(width: 250)
            .pickerStyle(SegmentedPickerStyle())
            
            ScrollView{
                
                // Stack vs Lazy - Stack은 한번에 그리고, Lazy는 동적으로 그린다. 메모리에 유리할 듯
                LazyVGrid(columns: selectedLayoutType.columns, content:{
                    ForEach(dummyData){ dataItem in
                        
                        switch selectedLayoutType{
                        case .table:
                            Rectangle()
                                .foregroundColor(Color.blue)
                                .frame(height: 100)
                        case .grid:
                            Rectangle()
                                .foregroundColor(Color.red)
                                .frame(height: 100)
                        case .multiple:
                            Rectangle()
                                .foregroundColor(Color.green)
                                .frame(height: 100)
                        }
                    }
                    
                })
            }
            .animation(.easeInOut)
            .padding(.horizontal, 10)
        }
    }
}


struct SegmentLayoutView_Previews: PreviewProvider{
    static var previews: some View{
        SegmentLayoutView()
    }
}
