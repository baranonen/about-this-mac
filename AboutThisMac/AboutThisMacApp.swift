//
//  AboutThisMacApp.swift
//  AboutThisMac
//
//  Created by Baran Önen on 17.02.2021.
//

import SwiftUI

@main
struct AboutThisMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
