//
//  MainScreen.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//


import SwiftUI

struct NewMainScreen: View {
    
    @State var menuToggle = false
    @State var plusGoals = false
    
    var body: some View {
        GeometryReader{ geometry in
            let size = geometry.size
            ZStack{
                ZStack(alignment: .bottom){
                    Image("backgroundColor")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("sun")
                        .offset(x: size.width * 0.4, y: size.height * (-0.75))
                    Image("cloud 3 main screen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                ZStack{
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(0..<10) { line in
                            ZStack(alignment: .topTrailing){
                                if line >  10 {
                                    Image("bad solution")
                                } else{
                                    Button(action: {
                                        
                                    }, label: {
                                        ZStack(alignment: .topTrailing){
                                            Image("card bg")
                                                .resizable()
                                                .padding(.horizontal, size.width * 0.07)
                    
                                            Text("Hello")
                                                .lineLimit(1)
                                                .foregroundColor(Color("2670AD"))
                                                .font(.custom("MullerMedium", size: size.width / 13))
                                                .padding(.trailing, size.width * (0.7))
                                                .padding(.top, size.height * (0.028))
                                            Text("50" + "$")
                                                .foregroundColor(Color("2670AD"))
                                                .font(.custom("MullerBold",size: size.width / 7.2))
                                                .padding(.trailing, size.width * (0.63))
                                                .padding(.top, size.height * (0.065))
                                            Text(Words().massiveOfNiceWords.randomElement()!)
                                                .foregroundColor(Color("DEF0FF"))
                                                .font(.custom("Polka", size: size.width / 7.2))
                                                .padding(.trailing, size.width * (0.13))
                                                .padding(.top, size.height * (0.065))
                                        }
                                    })
                                }
                            }
                            Spacer(minLength: size.height * 0.02)
                        }
                    }.safeAreaInset(edge: .top) {
                        ZStack{
                            Image("cloud 1 main screen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 0)
                            HStack(spacing: size.width * (0.09)){
                                Button(action: { menuToggle.toggle() }, label: {
                                    Image("menu icon")
                                        .resizable()
                                        .frame(maxWidth: size.width * (0.07), maxHeight: size.width * (0.07))
                                        .padding(.leading, size.width * (-0.001))
                                        .padding(.top, size.height * (-0.005))
                                }).fullScreenCover(isPresented: $menuToggle){ GeometryReader1() }
                                
                                Text("Piggy Bank")
                                    .font(.custom("Polka", size: size.width / 9))
                                    .foregroundColor(.white)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image("finished goals icon")
                                        .resizable()
                                        .frame(maxWidth: size.width * (0.07), maxHeight: size.width * (0.08))
                                        .padding(.trailing, size.width * (-0.001))
                                        .padding(.top, size.height * (-0.005))
                                    
                                })
                            }
                        }
                    }.safeAreaInset(edge: .bottom) {
                        ZStack {
                            Image("cloud 2 main screen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Button(action: {
                                plusGoals.toggle()
                            }, label: {
                                Image("plus button")
                            }).padding(.bottom, size.height * (-0.07))
                                .fullScreenCover(isPresented: $plusGoals){ NewGoal() }
                        }
                    }
                    
                }
                
            }
        }.ignoresSafeArea(.all)
    }
}

struct NewMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewMainScreen()
    }
}
