//
//  ConnectionPopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct ConnectionPopup: View {
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Image(systemName: "network.slash")
                    .foregroundStyle(.red)
                    .font(.largeTitle)
                Text("No internet connection.")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("Please check your connection and\ntry again.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
        }
    }
}
