//
//  WarningPopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct WarningPopup: View {
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Text("Are you sure about\nthis action?")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("There is no undo.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                HStack(spacing: 15){
                    Button(action:{
                        handleNoButton()
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 125, height: 50)
                                .foregroundColor(.white)
                            Text("No")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.red)
                        }
                    }
                    Button(action:{
                        handleYesButton()
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 125, height: 50)
                                .foregroundColor(.white)
                            Text("Yes")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
        
    func handleYesButton() {
        ///TODO: Action
        withAnimation(.easeInOut(duration: 0.5)) {
            show = nil
        }
    }
        
    func handleNoButton() {
        withAnimation(.easeInOut(duration: 0.5)) {
            show = nil
        }
    }
}
