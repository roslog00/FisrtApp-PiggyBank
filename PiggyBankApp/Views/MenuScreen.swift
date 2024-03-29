//
//  MenuScreen.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//
import SwiftUI
import RealmSwift

struct GeometryReader1: View {
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("name") var nameOfStorage = ""
    @AppStorage("currency", store: UserDefaults(suiteName: "group.com.currency.unwrap")) var currency: String = Currency.dollar.rawValue
    @State var sheetShown = false
    @State var nameDisableToggle = true
    @State var backToggle = false
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            ZStack(alignment: .top){
                Image("BackGround_MediumBlue")
                    .resizable()
                    .frame(width: size.width * 1, height: size.height * 1)
                VStack{
                    HStack(spacing: size.width * 0.13){
                        Button{
                            backToggle.toggle()
                        } label: {
                            Image("back")
                                .resizable()
                                .frame(maxWidth: size.width * (0.09), maxHeight: size.width * (0.08))
                                .padding(.horizontal, size.width * 0.07)

                        }
                        .fullScreenCover(isPresented: $backToggle){ NewMainScreen() }
                        
                        Text("Menu")
                            .font(.custom("Polka", size: size.width / 9))
                            .foregroundColor(.white)
                            .padding(.trailing, size.width * 0.37)
                        
                    }.padding(.top, size.height * 0.07)
                    
                    Spacer(minLength: size.height * 0.04)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack{
                            Image("Rectangle 14")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, size.width * 0.07)
                            HStack{
                                Text("Name:")
                                    .font(.custom("MullerMedium", size: 20))
                                    .foregroundColor(Color("2670AD"))
                                    .padding(.leading, size.width * (-0.01))
                                
                                TextField(text: $nameOfStorage) {
                                    Text(nameOfStorage)
                                        .font(.custom("MullerMedium", size: size.width / 19 ))
                                }.disabled(nameDisableToggle)
                                    .frame(maxWidth: size.width * (0.48))
                                    .font(.custom("MullerBold", size: size.width / 16 ))
                                    .foregroundColor(Color("2670AD"))
                                
                                Button(action: {
                                    nameDisableToggle.toggle()
                                    print(Realm.Configuration.defaultConfiguration.fileURL!)
                                }, label: {
                                    Image("pencil")
                                        .padding(.trailing, size.width * (0.01))
                                })
                                
                            }
                        }
                        
                        Spacer(minLength: size.height * 0.03)
                        
                        ZStack{
                            Image("Rectangle 14")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, size.width * 0.07)
                            
                            HStack{
                                Text("Currency")
                                    .font(.custom("MullerMedium", size: 20))
                                    .foregroundColor(Color("2670AD"))
                                    .padding(.trailing, size.width * (0.03))
                                
                                
                                Button (action: {
                                    sheetShown.toggle()
                                }, label: {
                                    Image(systemName: currency)
                                        .font(.custom("MullerMedium", size: size.width * (0.05)))
                                        .foregroundColor(Color("2670AD"))
                                        .padding(.leading, size.width * (0.38))
                                    Image("Currency Choise Arrow")
                                        .padding(.leading, size.width * (-0.02))
                                }).sheet(isPresented: $sheetShown) {
                                    ZStack {
                                        Color("7EBEF3")
                                        VStack(spacing: 10) {
                                            
                                            Button(action: {
                                                currency = Currency.dollar.rawValue
                                            }, label: {
                                                Image(systemName: "dollarsign")
                                                    .foregroundStyle(.white)
                                                    .font(.custom("MullerMedium", size: size.width / 10))
                                            })
                                            
                                            Button(action: {
                                                currency = Currency.euro.rawValue
                                            }, label: {
                                                Image(systemName: "eurosign")
                                                    .foregroundStyle(.white)
                                                    .font(.custom("MullerMedium", size: size.width / 10))
                                            })
                                            
                                            Button(action: {
                                                currency = Currency.yenAndYuan.rawValue
                                            }, label: {
                                                Image(systemName: "yensign")
                                                    .foregroundStyle(.white)
                                                    .font(.custom("MullerMedium", size: size.width / 10))
                                            })
                                            
                                            Button(action: {
                                                currency = Currency.pounds.rawValue
                                            }, label: {
                                                Image(systemName: "sterlingsign")
                                                    .foregroundStyle(.white)
                                                    .font(.custom("MullerMedium", size: size.width / 10))
                                            })
                                            
                                            Button(action: {
                                                currency = Currency.rubles.rawValue
                                            }, label: {
                                                Image(systemName: "rublesign")
                                                    .foregroundStyle(.white)
                                                    .font(.custom("MullerMedium", size: size.width / 10))
                                            })
                                        }.presentationDetents([.fraction(0.4), .height(size.height * (0.5))])
                                            .background(Color("7EBEF3"))
                                    }.ignoresSafeArea(.all)
                                }
                                
                            }
                        }
                        
                        Spacer(minLength: size.height * 0.06)
                        
                        
                        VStack{
                            Image("day theme")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, size.width * 0.07)
                                .padding(.bottom, size.height * 0.012)
                            Image("night theme")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, size.width * 0.07)
                                .padding(.bottom, size.height * 0.012)
                            Image("Forest theme")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, size.width * 0.07)
                                .padding(.bottom, size.height * 0.012)
                            Image("ocean theme")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, size.width * 0.07)
                                .padding(.bottom, size.height * 0.012)
                            
                        }
                    }
                }
            }
        }.ignoresSafeArea(.all)
    }
}

struct GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader1()
    }
}
