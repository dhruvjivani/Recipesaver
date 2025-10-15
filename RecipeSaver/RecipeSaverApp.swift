//
//  RecipeSaverApp.swift
//  RecipeSaver
//
//  Created by Dhruv Rasikbhai Jivani on 10/15/25.
//

import SwiftUI
internal import CoreData

@main
struct RecipeSaverApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            RecipeListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
