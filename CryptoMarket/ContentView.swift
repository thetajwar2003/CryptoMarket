//
//  ContentView.swift
//  CryptoMarket
//
//  Created by Tajwar Rahman on 6/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack{
            if self.isActive{
                Text("Hello, world!")
                    .padding()
            } else {
                ZStack{
                    Color(UIColor(red: 0/255, green: 72/255, blue: 203/255, alpha: 1)).edgesIgnoringSafeArea(.all)
                    Image("CryptoMarket")
                .resizable()
                }

            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation{
                    self.isActive = true
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
