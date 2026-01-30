//
//  BasePopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct BasePopup<Content: View>: View {
    @Binding var show: PopupType?
    let type: PopupType
    let content: Content
    
    public init(show: Binding<PopupType?>, type: PopupType, @ViewBuilder content: () -> Content) {
        self._show = show
        self.type = type
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            Color.black.opacity(0.75)
                .ignoresSafeArea()
                .onTapGesture { dismiss() }
            
            content
                .padding(.horizontal)
                .padding(.vertical, 50)
                .background(
                    RoundedRectangle(cornerRadius: 35)
                        .fill(Color.black)
                )
                .transition(.opacity.combined(with: .scale))
        }
    }
    
    private func dismiss() {
        withAnimation(.easeInOut(duration: 0.5)) {
            show = nil
        }
    }
}
