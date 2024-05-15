import SwiftUI

/* This is the main entry point for the app.*/
@main
/* This is a data type that uses the App protocol */
struct MemeCreatorApp: App {
    /* The StateObject Property Wrapper establishes state fo the app */
    @StateObject private var fetcher = PandaCollectionFetcher()
    /* */
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MemeCreator()
                    .environmentObject(fetcher)
            }
        }
    }
}
