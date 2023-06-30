//
//  Goals'sScreen.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 21.06.2023.
//
import SwiftUI
import RealmSwift

struct GoalsScreen: View {
    
    @ObservedResults(PersonsGoals.self) var personsGoals
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ZStack(alignment: .topLeading){
                Image("Rectangle 11")
                    .resizable()
                    .frame(minWidth: size.width * (1), minHeight: size.height * (1))
                
                ExtractedView4()
                
                ZStack (alignment: .trailing){
                    
                    Image("Cloud2GoalScreen")
                        .resizable()
                        .frame(width: size.width * (0.7), height: size.width * (0.37))
                        .offset(x: size.width * (0.45), y: size.height * (0.06))
                    
                    Image("Cloud3GoalScreen")
                        .resizable()
                        .frame(width: size.width * (0.9), height: size.width * (0.47))
                        .offset(x: size.width * (-0.2), y: size.height * (0.02))
                    
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            Image("sun")
                                .resizable()
                                .frame(width: size.width * (0.4), height: size.width * (0.4))
                            Image("plus icon")
                                .resizable()
                                .frame(width: size.width * (0.17), height: size.width * (0.17))
                        }
                    }).padding(.bottom, size.height * (0.07))
                    
                }.frame(maxWidth: .infinity, maxHeight: size.height * (1))
                
                GeometryReader { geometry in
                    let size = geometry.size
                    
                    Image("Cloud1GoalScreen")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(0..<9){
                            if $0 < 8 {
                                HStack(spacing: size.width * (0.24)) {
                                    Text("+50" + "$")
                                        .font(.custom("MullerMedium", size: size.width / 8))
                                        .foregroundStyle(.white)
                                    
                                    Text("Data")
                                        .font(.custom("MullerMedium", size: size.width / 8))
                                        .foregroundStyle(.white)
                                }
                            } else {
                                Image("StartGoalRectangle")
                                    .resizable()
                                    .padding(.horizontal, size.width * (0.07))
                            }
                            Spacer(minLength: size.height * (0.04))
                        }
                    }.padding(.top, size.height * (0.3))
                }.padding(.top, size.height * (0.475))
            }
        }.ignoresSafeArea(.all)
    }
}

struct GoalsScreen_Preview: PreviewProvider {
    static var previews: some View {
        GoalsScreen()
    }
}

struct ExtractedView4: View {
    
    @ObservedObject var arrayOfItem = RealmManager()
    @State var backToggle = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack(alignment: .leading, spacing: size.height * (0.04)){
                HStack(alignment: .center, spacing: size.width * (0.11)){
                    Button(action: {
                        backToggle.toggle()
                    }, label: {
                        Image("back")
                            .resizable()
                            .frame(maxWidth: size.width * (0.09), maxHeight: size.width * (0.08))
                    }).fullScreenCover(isPresented: $backToggle, content: { NewMainScreen()})
                    
                    Text(arrayOfItem.getNameWithId(id: arrayOfItem.id))
                        .lineLimit(2)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("Polka", fixedSize: size.width / 9))
                }.padding(.top, size.height * (0.08))
                
                HStack(spacing: size.width * (-0.001)){
                    Text(" $")
                        .foregroundStyle(.white)
                        .font(.custom("MullerBold", size: size.width / 7))
                    
                    Text("/  $")
                        .foregroundStyle(.white)
                        .font(.custom("MullerMedium", size: size.width / 10))
                }.padding(.leading, size.width * (0.04))
                
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: size.width * (0.865) , height: size.height * (0.02))
                        .foregroundColor(Color("7EBEF3"))
                    
                    Rectangle()
                        .frame(width: (50/1300 * size.width), height: size.height * (0.02))
                        .foregroundColor(.white)

                }.cornerRadius(45.0)
                
            }.padding(.leading, size.width * (0.06))
        }
    }
}
