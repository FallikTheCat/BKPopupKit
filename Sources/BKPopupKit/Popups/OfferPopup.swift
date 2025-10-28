//
//  OfferPopup.swift
//  BK-PopupKit
//
//  Created by Baturay Koc on 10/11/25.
//

import SwiftUI

public struct OfferPopup: View {
    @Binding var show: PopupType?
    
    public var body: some View {
        BasePopup(show: $show, type: .connection) {
            VStack(spacing: 25) {
                Text("🔥 50% off for the next 24 hours!")
                    .font(.title2)
                    .bold()
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
                            Text("Later")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                    Button(action:{
                        ///TODO: Action
                        withAnimation(.easeInOut(duration: 0.5)) {
                            show = nil
                        }
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 125, height: 50)
                                .foregroundColor(.white)
                            Text("Get Offer")
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
