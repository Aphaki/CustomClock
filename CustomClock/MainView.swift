//
//  MainView.swift
//  CustomClock
//
//  Created by Sy Lee on 2022/07/14.
//

import SwiftUI

struct CityImage: View {
    let imageName: String
    var timeString: String?
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .edgesIgnoringSafeArea(.top)
            Text(timeString ?? "")
                .font(.system(size: 18, weight: .heavy, design: .monospaced))
                .foregroundColor(Color.theme.whitePink)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: 330, height: 60, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.theme.whitePink, lineWidth: 5))
                }
                .frame(width: 330, height: 60, alignment: .center)
        }
    }
}

struct MainView: View {
    @StateObject var vm = ViewModel()
    @State var showLoadingView = true
    var body: some View {
        
        ZStack {
            TabView {
                CityImage(imageName: "Disney", timeString: vm.nyTimeString)
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("Orlando")
                            .font(.headline)
                    }
                CityImage(imageName: "HollywoodSign", timeString: vm.laTimeString)
                    .tabItem {
                        Image(systemName: "globe.americas")
                        Text("LA")
                            .font(.headline)
                    }
                CityImage(imageName: "TheStatueOfLiberty", timeString: vm.nyTimeString)
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("NewYork")
                            .font(.headline)
                    }
                CityImage(imageName: "Seoul", timeString: vm.krTimeString)
                    .tabItem {
                        Image(systemName: "globe.asia.australia.fill")
                        Text("Seoul")
                            .font(.headline)
                    }
            }
            
            ZStack {
                if showLoadingView {
                    LoadingView(showLoadingView: $showLoadingView)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
