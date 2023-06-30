//
//  AddMoneyScreen.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 30.06.2023.
//

import SwiftUI
import AlertKit
import RealmSwift

struct AddMoneyScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var realmManager = RealmManager()
    @FocusState private var nameIsFocused: Bool
    @State var size = UIScreen.main.bounds.size
    @State var backToggle = false
    @State var addMoney = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            
            ZStack(alignment: .bottom) {
                Image("Rectangle 11")
                    .resizable()
                    .frame(minWidth: size.width * 1, minHeight: size.height * 1 )
                    .ignoresSafeArea(.all)
                
                Image("Cloud2GoalScreen")
                    .resizable()
                    .frame(maxWidth: size.width * 1, maxHeight: size.height * (0.34))
                    .offset(y: size.height * (-0.4))
                    .offset(x: size.height * (-0.16))
                Image("Cloud2GoalScreen")
                    .resizable()
                    .frame(maxWidth: size.width * 1, maxHeight: size.height * (0.4))
                    .offset(y: size.height * (-0.37))
                    .offset(x: size.width * (0.5))
                
                ZStack(alignment: .top) {
                    Image("BigCloud")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: size.width * 1, maxHeight: size.height * 0.55)
                    
                    Button(action: {
                        if realmManager.verificationOnNumber(number: addMoney){
                            dismiss()
                            realmManager.addSavedMoney(id: UserDefaults.standard.object(forKey: "id") as! String, savedmoney: addMoney, goalscost: UserDefaults.standard.string(forKey: "cost")!)
                            realmManager.writeDataToList(id: UserDefaults.standard.string(forKey: "id") ?? "none", money: addMoney)
                        } else {
                            AlertKitAPI.present(
                                title: Errors.stringOrInt.rawValue,
                                icon: .error,
                                style: .iOS17AppleMusic,
                                haptic: .success
                            )
                        }
                    }, label: {
                        Text("OK")
                            .font(.custom("Polka", size: size.width / 6))
                            .foregroundColor(Color("2670AD"))
                    }).padding(.all, size.width * 0.2)
                }
            }.ignoresSafeArea(.all)
                .onTapGesture {
                    nameIsFocused = false
                }
        
            ZStack {
                Image("sun")
                    .resizable()
                TextField(text: $addMoney) {
                    Text("Eneter Amount")
                        .font(.custom("MullerMedium", size: size.width / 16))
                }.font(.custom("MullerBold", size: size.width / 16))
                    .foregroundColor(Color("2670AD"))
                .frame(alignment: .center)
                .padding(.leading, size.width * 0.13)
                .focused($nameIsFocused)
                
                
                RoundedRectangle(cornerSize: CGSize(width: 1, height: 1))
                    .frame(width: size.width * (0.5), height: size.width * (0.01))
                    .offset(y: size.height * (0.02))
                    .foregroundColor(Color("2670AD"))
                
            }.frame(width: size.width * (0.7), height: size.width * (0.7))
                .offset(y: size.height * (-0.23))
                .ignoresSafeArea(.all)
            
            
            ZStack(alignment: .topLeading) {
                Button {
                    backToggle.toggle()
                } label: {
                    Image("back")
                        .resizable()
                        .frame(maxWidth: size.width * (0.09), maxHeight: size.width * (0.08))
                        .padding(.horizontal, size.width * 0.07)

                }.fullScreenCover(isPresented: $backToggle) { GoalsScreen() }
            }.frame(width: size.width * 1, height: size.height * 0.85, alignment: .topLeading)
        }
    }
}

#Preview {
    AddMoneyScreen()
}
