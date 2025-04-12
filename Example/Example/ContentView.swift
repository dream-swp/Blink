//
//  ContentView.swift
//  Example
//
//  Created by Dream on 2025/4/5.
//

import Blink
import SwiftUI

struct ContentView: View {

    @ObservedObject var `default`: Config =
        .default { ("Data Request", "Network loading, request data....") }
        .display { .default }
        .style { .default }
        .blur { .default }

    @ObservedObject var info: Config = .info { ("Information", "数据请求成功，请刷新数据！") }
    @ObservedObject var infoFill: Config = .infoFill { ("Information Fill", "数据请求成功，请刷新数据！") }.blur { .default }

    @ObservedObject var success: Config = .success { ("Success", "数据校验成功！请继续下一步操作！") }
    @ObservedObject var successFill: Config = .successFill { ("Success Fill", "数据校验成功！请继续下一步操作！") }

    @ObservedObject var error: Config = .error { ("Error", "数据操作失败！，请输入正确数据！") }
    @ObservedObject var errorFill: Config = .errorFill { ("Error Fill", "数据操作失败！，请输入正确数据！") }

    var body: some View {

        VStack(spacing: 30) {

            HStack {

                Button("default") {
                    Blink.bk.display { `default` }
                }

            }

            HStack {
                Button("Info") {
                    Blink.bk.display { info }
                }

                Button("`InfoFill`") {
                    Blink.bk.display { infoFill }
                }
            }

            HStack {
                Button("Success") {
                    Blink.bk.display { success }
                }

                Button("`SuccessFill`") {
                    Blink.bk.display { successFill }
                }
            }

            HStack {
                Button("Error") {
                    Blink.bk.display { error }
                }

                Button("`ErrorFill`") {
                    Blink.bk.display { errorFill }
                }
            }

        }
        #if os(macOS)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
        .blink(`default`)
        .blink(info)
        .blink(infoFill)
        .blink(success)
        .blink(successFill)
        .blink(error)
        .blink(errorFill)
    }
}

#Preview {
    ContentView()
}
