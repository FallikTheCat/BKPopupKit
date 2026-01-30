//
//  RatingPopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI
import StoreKit

public struct RatingPopup: View {
    @Environment(\.requestReview) var requestReview
    @State private var waitingForRating = false
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Text("Do you like the app?")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("Your like is our motivation 😍")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                HStack(spacing: 50){
                    Button(action:{
                        handleDislikeButton()
                    }) {
                        Image("dislike")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                    }
                    Button(action:{
                        handleLikeButton()
                    }) {
                        Image("like")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                    }
                }
            }
        }
        .overlay{
            if waitingForRating {
                LoadingView()
            }
        }
    }
    
    private func LoadingView() -> some View {
        ZStack{
            Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
            ProgressView()
                .tint(.white)
        }
    }
        
    func handleLikeButton() {
        requestReview()
        waitingForRating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            withAnimation(.easeInOut(duration: 0.5)) {
                waitingForRating = false
                show = nil
            }
        })
    }
        
    func handleDislikeButton() {
        ///TODO: Action
        requestReview()
        waitingForRating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            withAnimation(.easeInOut(duration: 0.5)) {
                waitingForRating = false
                show = nil
            }
        })
    }
}
