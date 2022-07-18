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
                CityTabChildView(imageName: "Disney", timeString: vm.nyTimeString, cityName: "Orlando")
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("Orlando")
                            .font(.headline)
                    }
                    .tag(1)
                    
                CityTabChildView(imageName: "HollywoodSign", timeString: vm.laTimeString, cityName: "Los Angeles")
                    .tabItem {
                        Image(systemName: "globe.americas")
                        Text("LA")
                            .font(.headline)
                    }
                    .tag(2)

                CityTabChildView(imageName: "TheStatueOfLiberty", timeString: vm.nyTimeString, cityName: "New York")
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("NewYork")
                            .font(.headline)
                    }
                    .tag(3)

                CityTabChildView(imageName: "Seoul", timeString: vm.krTimeString, cityName: "Seoul")
                    .tabItem {
                        Image(systemName: "globe.asia.australia.fill")
                        Text("Seoul")
                            .font(.headline)
                    }
                    .tag(4)

            }// tabView
            .onChange(of: tabSelection) { newValue in
                print("tabnSelection: \(newValue)")
            }
//            .tabViewStyle(.page)
//            .edgesIgnoringSafeArea(.top)

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
