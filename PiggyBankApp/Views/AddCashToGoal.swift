//
//  AddCashToGoal.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 21.06.2023.
//

import SwiftUI

struct AddCashToGoal: View {
    
    private var  sizeScreen = UIScreen.main.bounds
    @State var enterAmount = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                let size = geometry.size
                Image("Rectangle 11")
                    .resizable()
                    .frame(minWidth: size.width * 1, minHeight: size.height * 1)
                Image("AddCashCloud2")
                    .padding(.leading, sizeScreen.width * (0.6))
                    .padding(.top, sizeScreen.height * (0.07))
                
                Button(action: {
                    
                }, label: {
                    Image("back")
                        .resizable()
                        .frame(maxWidth: size.width * (0.1), maxHeight: size.width * (0.09))
                }).padding(.top, sizeScreen.height * (0.07))
                    .padding(.leading, sizeScreen.width * (0.06))
                
            }.ignoresSafeArea(.all)
            
            ZStack{
                Image("AddCashCloud")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding(.bottom, sizeScreen.height * (0.28))
                .ignoresSafeArea(.all)
            
            ZStack {
                Image("Cloud4GoalScreen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action: {
                    
                }, label: {
                    Text("OK")
                        .font(.custom("Polka", size: sizeScreen.width / 7))
                        .foregroundStyle(.white)
                })
                
                ZStack {
                    Image("sun")
                        .resizable()
                    
                    VStack {
                        TextField(text: $enterAmount) {
                            Text("Enter Amount")
                                .font(.custom("MullerMedium", size: sizeScreen.width / 15))
                                .lineLimit(1)
                        }
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: sizeScreen.width * (0.006))
                            .foregroundColor(Color("2670AD"))
                        
                    }.padding(.horizontal, sizeScreen.width * (0.177))
                    
                }.frame(maxWidth: sizeScreen.width * (0.8), maxHeight: sizeScreen.width * (0.8))
                 .padding(.top, sizeScreen.height * (-0.65))
                
            }
            
        }.ignoresSafeArea(.all)
    }
}

struct AddCashToGoal_Preview: PreviewProvider {
    static var previews: some View {
        AddCashToGoal()
    }
}
