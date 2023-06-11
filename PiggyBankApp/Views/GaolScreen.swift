//
//  GaolScreen.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//

import SwiftUI

struct NewGoal: View {
    @ObservedObject var newGoalsName = User()
    @ObservedObject var newGoaslCost = User()
    
    var body: some View {
        ZStack(alignment: .top){
            ExtractedView()
            
            
            
            ExtractedView2()
            
            GeometryReader{ geometry in
                let size = geometry.size
                
                TextField(text: $newGoalsName.goalsName, label: {
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
                
                
                TextField(text: $newGoaslCost.goalsCost) {
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

struct ExtractedView: View {
    var body: some View {
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
    }
}


struct ExtractedView2: View {
    
    var dataBridge = User()
    @State var OKMenuButton = false
    
    var body: some View {
        GeometryReader(content: { geometry in
            let size = geometry.size
            VStack{
                HStack(spacing: size.width * (0.13)){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("back")
                            .resizable()
                            .frame(maxWidth: size.width / 10, maxHeight: size.width / 11)
                            .padding(.top, size.height * (-0.01))
                    })
                    
                    Text("New Goal")
                        .font(.custom("Polka", size: size.width / 9))
                        .foregroundStyle(.white)
                }.padding(.top, size.height * (-0.24))
                 .padding(.leading, size.width * (-0.2))
                
                Button(action: {
                    OKMenuButton.toggle()
                    dataBridge.saveGoalsName(usersGoalsName: dataBridge.goalsOfPerson, goalsName: dataBridge.goalsName)
                    dataBridge.saveGoalsCost(usersGoalsCost: dataBridge.goalsOfPerson, goalsCost: dataBridge.goalsCost)
                }, label: {
                    Text("OK")
                        .font(.custom("Polka", size: size.width / 7))
                        .foregroundColor(Color("2670AD"))
                        .padding(.top, size.height * 0.4)
                }).fullScreenCover(isPresented: $OKMenuButton){ NewMainScreen() }
                
            }.frame(minWidth: size.width * 1, minHeight: size.height * 1)
        })
    }
}
