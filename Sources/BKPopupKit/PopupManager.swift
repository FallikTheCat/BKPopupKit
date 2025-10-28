//
//  PopupManager.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

@MainActor
public class PopupManager: ObservableObject {
    public static let shared = PopupManager()
    
    @Published public var activePopup: PopupType? = nil
    
    private init() {}
    
    public func present(_ type: PopupType) {
        withAnimation(.spring()) {
            activePopup = type
        }
    }
    
    public func dismiss() {
        withAnimation(.easeInOut(duration: 0.3)) {
            activePopup = nil
        }
    }
}
