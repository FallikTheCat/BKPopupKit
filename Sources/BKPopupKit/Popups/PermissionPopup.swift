//
//  PermissionPopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct PermissionPopup: View {
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Text("Need Permission")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("We need this permission to use some features.")
                    .font(.body)
                    .multilineTextAlignment(.center)
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
                            Text("Cancel")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                    Button(action:{
                        if let url = URL(string: UIApplication.openSettingsURLString),
                           UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                        withAnimation(.easeInOut(duration: 0.5)) {
                            show = nil
                        }
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 125, height: 50)
                                .foregroundColor(.white)
                            Text("Go to Settings")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}
