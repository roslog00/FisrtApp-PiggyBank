//
//  GaolScreen.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//

import SwiftUI
import RealmSwift

struct NewGoal: View {
    
    @State var OKMenuButton = false
    @State var backToMenuToggle = false
    @State var newGoalsName = ""
    @State var newGoaslCost = ""
    @ObservedObject var realmManager = RealmManager()
    @ObservedResults(PersonsGoals.self) var personsGoals
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader(content: { geometry in
                let size = geometry.size
                ZStack(alignment: .top){
                    Image("backgroundColor")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Image("sun")
                        .padding(.leading, size.width * 0.63)
                        .padding(.top, size.width * 0.165)
                    Image("cloud 1 main screen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, size.height * 0)
                    Image("BigCloud")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.top, size.height * 0.45)
                }
                
            }).ignoresSafeArea(.all)
            
            GeometryReader(content: { geometry in
                let size = geometry.size
                
                VStack{
                    HStack(spacing: size.width * (0.07)){
                        Button(action: {
                            backToMenuToggle.toggle()
                        }, label: {
                            Image("back")
                                .resizable()
                                .frame(maxWidth: size.width * (0.09), maxHeight: size.width * (0.08))
                                .padding(.top, size.height * (-0.01))
                                .padding(.horizontal, size.width * (0.05))
                        }).fullScreenCover(isPresented: $backToMenuToggle) {
                            NewMainScreen()
                        }
                        
                        Text("New Goal")
                            .font(.custom("Polka", size: size.width / 9))
                            .foregroundStyle(.white)
                    }.padding(.top, size.height * (-0.24))
                        .padding(.leading, size.width * (-0.2))
                    
                    Button(action: {
                        OKMenuButton.toggle()
                        if newGoalsName.isEmpty, newGoaslCost.isEmpty {
                            
                        } else {
                            realmManager.writeData(newGoalsName, goalsCost: newGoaslCost)
                        }
                    }, label: {
                        Text("OK")
                            .font(.custom("Polka", size: size.width / 7))
                            .foregroundColor(Color("2670AD"))
                            .padding(.top, size.height * 0.4)
                    }).fullScreenCover(isPresented: $OKMenuButton){ NewMainScreen() }
                    
                }.frame(minWidth: size.width * 1, minHeight: size.height * 1)
            })
            
            GeometryReader{ geometry in
                let size = geometry.size
                
                TextField(text: $newGoalsName, label: {
                    Text("Name")
                        .font(.custom("MullerMedium", size: size.width / 13))
                        .foregroundColor(Color("82B0D6"))
                }).font(.custom("MullerMedium", size: size.width / 13))
                    .textFieldStyle(.plain)
                    .frame(maxWidth: size.width * (0.7))
                    .padding(.top, size.height * (0.2))
                    .padding(.leading, size.width * (0.06))
                Rectangle()
                    .frame(maxWidth: size.width * (0.55), maxHeight: size.height * (0.004))
                    .foregroundColor(Color("2670AD"))
                    .padding(.leading, size.width * (0.06))
                    .padding(.top, size.height * (0.24))
                
                
                TextField(text: $newGoaslCost) {
                    Text("How much to accumulate")
                        .font(.custom("MullerMedium", size: size.width / 13))
                        .foregroundColor(Color("82B0D6"))
                }.font(.custom("MullerMedium", size: size.width / 13))
                    .textFieldStyle(.plain)
                    .frame(maxWidth: size.width * (0.7))
                    .padding(.top, size.height * (0.31))
                    .padding(.leading, size.width * (0.06))
                Rectangle()
                    .frame(maxWidth: size.width * (0.7), maxHeight: size.height * (0.004))
                    .foregroundColor(Color("2670AD"))
                    .padding(.leading, size.width * (0.06))
                    .padding(.top, size.height * (0.348))
            }
        }.ignoresSafeArea(.keyboard, edges: .bottom)
        //Main ZStack is ended
    }
    
}

struct NewGoal_Previews: PreviewProvider {
    static var previews: some View {
        NewGoal()
    }
}

