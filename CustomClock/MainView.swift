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
                .font(.title)
                .fontWeight(.thin)
                .foregroundColor(Color("ThemeAccent"))
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black)
                        .opacity(0.5)
                }
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("ThemeAccent"), lineWidth: 5))
        }
    }
}

struct MainView: View {
    @StateObject var vm = ViewModel()
        
    var body: some View {
        TabView {
            CityImage(imageName: "Disney", timeString: vm.nyTimeString)
                .tabItem {
                    Image(systemName: "globe.americas.fill")
                    Text("Orlando")
                        .font(.headline)
                }
            CityImage(imageName: "HollywoodSign", timeString: vm.laTimeString)
                .tabItem {
                    Image(systemName: "globe.americas.fill")
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
