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

    @ObservedObject var `default`: Config = .info { ("Default", "Default Message") }

    @ObservedObject var top: Config = .top { ("Default", "Default Message") }

    @ObservedObject var leading: Config = .leading { ("Default", "Default Message") }

    var body: some View {
        HStack(spacing: 30) {
            Button("`default`") {
                Blink.bk.display { `default` }
            }

            Button("`top`") {
                Blink.bk.display { top }
            }

            Button("`center`") {
                Blink.bk.display { leading }
            }

            Button("`bottom`") {

            }

        }
        #if os(macOS)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
        .blink(`default`)
        .blink(top)
        .blink(leading)
        //            .blink(`default`.display.isHidden) {
        ////                Text("111")
        //                Blink(config: `default`)
        //            }
    }
}

#Preview {
    ContentView()
}
