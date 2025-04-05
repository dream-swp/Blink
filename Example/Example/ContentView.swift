//
//  ContentView.swift
//  Example
//
//  Created by Dream on 2025/4/5.
//




import Blink

import SwiftUI

struct ContentView: View {
    @State private var showTopToast = false
    @ObservedObject var `default`: Config =
        .init(title: "Default", message: "Default Message")
        .display { .init(isHidden: true, isAutoHidden: false) }
        .style { .init(position: .top) }
    
    var body: some View {
        HStack(spacing: 30) {
            Button("`default`") {
                Blink.bk.display { `default` }
            }

            Button("`top`") {
            }

            Button("`center`") {
            
            }

            Button("`bottom`") {
            
            }

        }
        #if os(macOS)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
            .blink(`default`)
//            .blink(`default`.display.isHidden) {
////                Text("111")
//                Blink(config: `default`)
//            }
    }
}

#Preview {
    ContentView()
}
