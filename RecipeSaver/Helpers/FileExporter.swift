//
//  FileExporter.swift
//  RecipeSaver
//
//  Created by Dhruv Rasikbhai Jivani on 10/15/25.
//

import Foundation
internal import CoreData


class FileExporter {
    static func exportRecipe(_ recipe: Recipe) -> Bool {
        let fileName = "\(recipe.name ?? "Recipe").txt"
        let content = """
        Name: \(recipe.name ?? "")
        Category: \(recipe.category ?? "")
        Prep Time: \(recipe.prepTime) minutes

        Ingredients:
        \(recipe.ingredients ?? "")

        Notes:
        \(recipe.notes ?? "")
        """
        
        do {
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = path.appendingPathComponent(fileName)
            try content.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            return true
        } catch {
            print("Export failed: \(error.localizedDescription)")
            return false
        }
    }
}

