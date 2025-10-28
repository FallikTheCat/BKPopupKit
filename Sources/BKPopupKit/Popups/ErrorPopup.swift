//
//  ErrorPopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct ErrorPopup: View {
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundStyle(.red)
                    .font(.largeTitle)
                Text("There has been an error.")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("Please try again later.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Button(action:{
                    ///TODO: Action
                    withAnimation(.easeInOut(duration: 0.5)) {
                        show = nil
                    }
                }) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 50)
                            .foregroundColor(.white)
                        Text("Okay")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
