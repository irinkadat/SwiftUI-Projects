//
//  WatcherApp.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import SwiftUI
import SwiftData

@main
struct WatcherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [FavoriteMovie.self])
        }
    }
}
