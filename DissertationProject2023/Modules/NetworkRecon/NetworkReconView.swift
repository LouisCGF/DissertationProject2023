//
//  NetworkReconView\.swift
//  DissertationProject2023
//
//  Created by Louis on 14/03/2023.
//

import SwiftUI

struct NetworkReconView: View {
    
    @State private var selectedItem = 1
    @State private var fullscreen = false
    
    var body: some View {
        
        VStack {
            
            ZStack (alignment: .leading){
                
                Rectangle()
                    .fill(.pink)
                    .frame(width: 130)
                    .ignoresSafeArea()
                
                TabView (selection: $selectedItem) {

                    NRPage1()
                        .tag(1)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                    
                    
                    NRPage2()
                        .tag(2)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                    
                    
                    NRPage3()
                        .tag(3)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                    
                    /*
                    NRPage4()
                        .tag(4)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                     */
                    
                }
                .padding()
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                CircleImage(image: Image("network-recon-module-img"))
                    .frame(height: 100)
                    .offset(x: 140, y: -300)
                    .padding()
                
                Image(systemName: "viewfinder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .offset(x: 330, y: 300)
                    .foregroundColor(.black)
                    .onTapGesture {
                        fullscreen.toggle()
                    }
                
                ProgressView("", value: (Double(selectedItem) / 3) * 100, total: 100)
                    .foregroundColor(.white)
                    .tint(.green)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 100)
                    .offset(y: 380)
                
            }
            .sheet(isPresented: $fullscreen) {
                switch (selectedItem){
                case 1:
                    NRPage1()
                case 2:
                    NRPage2()
                case 3:
                    NRPage3()
                //case 4:
                    //NRPage4()
                default:
                    NRPage1()
                }
            }
        }
    }
}

struct NetworkReconView__Previews: PreviewProvider {
    static var previews: some View {
        NetworkReconView()
    }
}
