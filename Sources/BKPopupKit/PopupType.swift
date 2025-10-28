//
//  PopupType.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

public enum PopupType: Identifiable {
    case connection
    case error
    case forceUpdate
    case maintenance
    case offer
    case permission
    case rating
    case warning
    case whatsNew
    
    public var id: String {
        switch self {
        case .connection: return "connection"
        case .error: return "error"
        case .forceUpdate: return "forceUpdate"
        case .maintenance: return "maintenance"
        case .offer: return "offer"
        case .permission: return "permission"
        case .rating: return "rating"
        case .warning: return "warning"
        case .whatsNew: return "whatsNew"
        }
    }
}
