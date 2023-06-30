//
//  MainScreen.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//


import SwiftUI
import RealmSwift

struct NewMainScreen: View {
    
    @ObservedResults(PersonsGoals.self) var personsGoals
    @EnvironmentObject var realmManager: RealmManager
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
                        ForEach(personsGoals, id: \.id) { line in
                            ZStack(alignment: .topTrailing){
                                Button(action: {
                                    goalToggle.toggle()
                                    UserDefaults.standard.setValue(line.goalsNames, forKey: "name")
                                    UserDefaults.standard.setValue(line.goalsCosts, forKey: "cost")
                                    UserDefaults.standard.setValue(line.savedMoney, forKey: "savedMoney")
                                    UserDefaults.standard.setValue(line.date, forKey: "date")
                                    UserDefaults.standard.setValue(line.id.stringValue, forKey: "id")
                                    
                                }, label: {
                                    ZStack(alignment: .topTrailing){
                                        Image("card bg")
                                            .resizable()
                                            .padding(.horizontal, size.width * 0.07)
                                    
                                        
                                        Text(line.goalsNames)
                                            .lineLimit(1)
                                            .foregroundColor(Color("2670AD"))
                                            .font(.custom("MullerMedium", size: size.width / 13))
                                            .padding(.top, size.height * (0.028))
                                            .frame(width: size.width * 0.9, alignment: .leading)

                                        
                                        HStack {
                                            HStack{
                                                Text(line.goalsCosts)
                                                    .lineLimit(1)
                                                    .foregroundColor(Color("2670AD"))
                                                    .font(.custom("MullerBold",size: size.width / 8.2))
                                                    
                                                
                                                Image(systemName: UserDefaults.standard.string(forKey: "currency") ?? "not currerncy")
                                                    .foregroundColor(Color("2670AD"))
                                                    .font(.custom("MullerBold",size: size.width / 8.2))
                                                    .padding(.top, size.width * (-0.01))
                                                    .padding(.leading, size.width * (-0.035))
                                                
                                            }.frame(width: size.width * (0.4), alignment: .leading)
                                            
                                            Text(Words().massiveOfNiceWords.randomElement()!)
                                                .foregroundColor(Color("DEF0FF"))
                                                .font(.custom("Polka", size: size.width / 9.2))
                                                .frame(width: size.width * (0.35))
                                        }.padding(.top, size.height * (0.074))
                                        .frame(width: size.width * (0.90), alignment: .leading)
                                        
                                        ZStack {
                                            Rectangle()
                                                .frame(minWidth: (CGFloat(0.8) * (0.8) * size.width))
                                                .frame(maxWidth: (0.8 * size.width), maxHeight: size.height * (0.013))
                                                .foregroundColor(Color("2670AD"))
                                            Rectangle()
                                                .frame(width: size.width * (0.8) , height: size.height * (0.013))
                                                .foregroundColor(Color("DEF0FF"))
                                            
                                        }.cornerRadius(45.0)
                                        .padding(.horizontal, size.width * (0.1))
                                        .padding(.top, size.height * (0.145))
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
            .environmentObject(RealmManager())
    }
}
