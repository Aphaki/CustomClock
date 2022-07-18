//
//  LoadingView.swift
//  CustomClock
//
//  Created by Sy Lee on 2022/07/15.
//

import SwiftUI

struct LoadingView: View {
    @State private var loadingText: [String] = "now loading...".uppercased().map { String($0) }
    @State private var count = 0
    @Binding var showLoadingView: Bool
    @State private var loop = 0
    
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            HStack(spacing: 0) {
                ForEach(loadingText.indices, id: \.self) { index in
                    Text(loadingText[index])
                        .font(.headline)
                        .foregroundColor(Color.theme.accent)
                        .offset(y: index == count ? -15 : 0)
                }
            }
            .onReceive(timer) { _ in
                withAnimation(.spring()) {
                    let lastIndex = loadingText.count - 1
                    if count == lastIndex {
                        count = 0
                        loop += 1
                        if loop >= 2 {
                            showLoadingView = false
                        }
                    } else {
                        count += 1
                    }
                }
            }
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(showLoadingView: .constant(true))
    }
}
