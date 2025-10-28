//
//  MaintenancePopup.swift
//  BKPopupKit
//
//  Created by Baturay Koc on 10/16/25.
//

import SwiftUI

public struct MaintenancePopup: View {
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
                Text("Maintenance")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("Please come back later.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
        }
    }
}
