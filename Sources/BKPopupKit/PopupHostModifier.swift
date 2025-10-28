//
//  PopupHostModifier.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct PopupHostModifier: ViewModifier {
    @StateObject private var manager = PopupManager.shared
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                if let type = manager.activePopup {
                    switch type {
                    case .connection:
                        ConnectionPopup(show: $manager.activePopup)
                    case .error:
                        ErrorPopup(show: $manager.activePopup)
                    case .forceUpdate:
                        ForceUpdatePopup(show: $manager.activePopup)
                    case .maintenance:
                        MaintenancePopup(show: $manager.activePopup)
                    case .offer:
                        OfferPopup(show: $manager.activePopup)
                    case .permission:
                        PermissionPopup(show: $manager.activePopup)
                    case .rating:
                        RatingPopup(show: $manager.activePopup)
                    case .warning:
                        WarningPopup(show: $manager.activePopup)
                    case .whatsNew:
                        WhatsNewPopup(show: $manager.activePopup)
                    }
                }
            }
    }
}

public extension View {
    func popupHost() -> some View {
        modifier(PopupHostModifier())
    }
}
