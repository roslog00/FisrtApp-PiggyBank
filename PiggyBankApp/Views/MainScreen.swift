//
//  MainScreen.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//


import SwiftUI
import RealmSwift

struct NewMainScreen: View {
    
    
    @ObservedResults(PersonsGoals.self) var personGoals
    @ObservedObject var realmManager = RealmManager()
    @State var currencyOfPerson = GeometryReader1()
    @State var finishedMenuToggle = false
    @State var menuToggle = false
    @State var plusGoals = false
    @State var goalToggle = false
    
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
                        ForEach(personGoals, id: \.id) { line in
                            ZStack(alignment: .topTrailing){
                                Button(action: {
                                    goalToggle.toggle()
                                    realmManager.saveId(id1: line.id)
                                }, label: {
                                    ZStack(alignment: .topTrailing){
                                        Image("card bg")
                                            .resizable()
                                            .padding(.horizontal, size.width * 0.07)
                                        
                                        Text("\(line.goalsNames)")
                                            .lineLimit(1)
                                            .foregroundColor(Color("2670AD"))
                                            .font(.custom("MullerMedium", size: size.width / 13))
                                            .padding(.trailing, size.width * (0.7))
                                            .padding(.top, size.height * (0.028))
                                        HStack(spacing: size.width * (0.0000)) {
                                            Text(line.goalsCosts)
                                                .lineLimit(1)
                                                .foregroundColor(Color("2670AD"))
                                                .font(.custom("MullerBold",size: size.width / 7.2))
                                            Image(systemName: currencyOfPerson.currency)
                                                .foregroundColor(Color("2670AD"))
                                                .font(.custom("MullerBold",size: size.width / 7.2))
                                            
                                        }.padding(.trailing, size.width * (0.63))
                                        .padding(.top, size.height * (0.065))
                                        
                                        Text(Words().massiveOfNiceWords.randomElement()!)
                                            .foregroundColor(Color("DEF0FF"))
                                            .font(.custom("Polka", size: size.width / 7.2))
                                            .padding(.trailing, size.width * (0.13))
                                            .padding(.top, size.height * (0.065))
                                    }
                                }).fullScreenCover(isPresented: $goalToggle){ GoalsScreen() }
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
                                
                                Button(action: {
                                    finishedMenuToggle.toggle()
                                }, label: {
                                    Image("finished goals icon")
                                        .resizable()
                                        .frame(maxWidth: size.width * (0.07), maxHeight: size.width * (0.08))
                                        .padding(.trailing, size.width * (-0.001))
                                        .padding(.top, size.height * (-0.005))
                                    
                                }).fullScreenCover(isPresented: $finishedMenuToggle, content: {
                                    FinishedGoals()
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
