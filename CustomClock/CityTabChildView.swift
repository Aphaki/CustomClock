//
//  CityTabChildView.swift
//  CustomClock
//
//  Created by Sy Lee on 2022/07/15.
//

import SwiftUI

struct CityTabChildView: View {
    let imageName: String
    var timeString: String?
    let cityName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .edgesIgnoringSafeArea(.top)
            VStack(spacing: 30) {
                Text(cityName)
                    .font(.system(size: 38, weight: .heavy, design: .monospaced))
                    .foregroundColor(Color.theme.whitePink)
                    .shadow(color: .black, radius: 10, y: 10)
                    .shadow(color: .black, radius: 10, y: 15)
                    .padding(10)
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
}

struct CityTabChildView_Previews: PreviewProvider {
    static var previews: some View {
        CityTabChildView(imageName: "Disney", cityName: "Orlando")
    }
}
