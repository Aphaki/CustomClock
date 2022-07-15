//
//  MainView.swift
//  CustomClock
//
//  Created by Sy Lee on 2022/07/14.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = ViewModel()
    @State var showLoadingView = true
    @State var tabSelection = 4
    var body: some View {
        
        ZStack {
            // 탭뷰
            TabView(selection: $tabSelection) {
                CityImage(imageName: "Disney", timeString: vm.nyTimeString, cityName: "Orlando")
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("Orlando")
                            .font(.headline)
                    }
                    .tag(1)
                    
                CityImage(imageName: "HollywoodSign", timeString: vm.laTimeString, cityName: "Los Angeles")
                    .tabItem {
                        Image(systemName: "globe.americas")
                        Text("LA")
                            .font(.headline)
                    }
                    .tag(2)

                CityImage(imageName: "TheStatueOfLiberty", timeString: vm.nyTimeString, cityName: "New York")
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("NewYork")
                            .font(.headline)
                    }
                    .tag(3)

                CityImage(imageName: "Seoul", timeString: vm.krTimeString, cityName: "Seoul")
                    .tabItem {
                        Image(systemName: "globe.asia.australia.fill")
                        Text("Seoul")
                            .font(.headline)
                    }
                    .tag(4)

            }// tabView

            // 로딩뷰
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
