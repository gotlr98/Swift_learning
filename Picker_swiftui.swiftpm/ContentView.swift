import SwiftUI



// ------------------------------ MYCODE

//struct ContentView: View {
//
//
//
//    @State private var selectionValue = 0
//
//    let myColorArray = ["red", "green", "blue"]
//    var body: some View {
//        VStack(alignment: .center) {
//
//
//            if selectionValue == 0{
//                Circle()
//                    .foregroundColor(.red)
//                    .frame(width:50, height: 50)
//                Text("Choiced Color : \(myColorArray[selectionValue])")
//
//            }
//
//            else if selectionValue == 1{
//                Circle()
//                    .foregroundColor(.green)
//                    .frame(width:50, height: 50)
//                Text("Choiced Color : \(myColorArray[selectionValue])")
//
//            }
//
//            else if selectionValue == 2{
//                Circle()
//                    .foregroundColor(.blue)
//                    .frame(width:50, height: 50)
//                Text("Choiced Color : \(myColorArray[selectionValue])")
//
//            }
//
//
//            Text("Segment Value : \(selectionValue)")
//
//
//            Picker("", selection: $selectionValue, content: {
//                Text("Red").tag(0)
//                Text("Green").tag(1)
//                Text("Blue").tag(2)
//            }).pickerStyle(SegmentedPickerStyle())
//
//            Picker("", selection: $selectionValue, content:{
//                Text("Red").tag(0)
//                Text("Green").tag(1)
//                Text("Blue").tag(2)
//            }).pickerStyle(WheelPickerStyle()).frame(width: 150, height: 150)
//        }
//    }
//}


struct ContentView: View{
    
    @State private var selectionValue = 0
    
    func changeColor(index: Int) -> Color{
        switch index{
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.blue
        default:
            return Color.red
        }
    }

    var body: some View{
        
    let myColorArray = ["Red", "Green", "Blue"]
    
    
        VStack(alignment: .center) {
            
            Circle()
                .foregroundColor(self.changeColor(index: selectionValue))
                .frame(width: 50, height: 50)

            Text("Segment Value : \(selectionValue)")
            
            Text("Choiced Color: \(myColorArray[selectionValue])")


            Picker("", selection: $selectionValue, content: {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }).pickerStyle(SegmentedPickerStyle())

            Picker("", selection: $selectionValue, content:{
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }).pickerStyle(WheelPickerStyle()).frame(width: 100, height: 150).border(changeColor(index: selectionValue),
                                                                                     width: 10)
                .clipped()
                .padding(20)
        }.padding(.horizontal, 50)
    }
    
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        
        ContentView()
    }
}
