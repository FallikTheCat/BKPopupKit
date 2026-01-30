//
//  OfferPopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct OfferPopup: View {
    @Binding var show: PopupType?
    @State private var timeRemaining = 600 // 10 minutes in seconds
    @State private var timer: Timer?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                VStack(spacing: 7){
                    Text("🔥")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Text("50% OFF")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text("only for a short time!")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                }
                Text(timeString(from: timeRemaining))
                    .font(.system(size: 64, weight: .bold, design: .monospaced))
                    .monospacedDigit()
                    .foregroundColor(.white)
                HStack(spacing: 15){
                    Button(action:{
                        withAnimation(.easeInOut(duration: 0.5)) {
                            show = nil
                        }
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 125, height: 50)
                                .foregroundColor(.white)
                            Text("Later")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                    Button(action:{
                        ///TODO: Action
                        withAnimation(.easeInOut(duration: 0.5)) {
                            show = nil
                        }
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 125, height: 50)
                                .foregroundColor(.white)
                            Text("Get Offer")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
