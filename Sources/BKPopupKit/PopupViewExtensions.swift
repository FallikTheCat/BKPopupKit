//
//  PopupViewExtensions.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public extension View {
    func presentPopup(_ type: PopupType) {
        PopupManager.shared.present(type)
    }
}
