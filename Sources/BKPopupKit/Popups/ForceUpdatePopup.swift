//
//  ForceUpdatePopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct ForceUpdatePopup: View {
    @Environment(\.openURL) var openURL
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Text("New Version Available")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("To have the best experience,\nyou need to update the app.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Button(action:{
                    ///TODO: Action
//                        withAnimation{
//                            openURL(URL(string: appURLs)!)
//                        }
                    withAnimation(.easeInOut(duration: 0.5)) {
                        show = nil
                    }
                }) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 50)
                            .foregroundColor(.white)
                        Text("Update")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
