//
//  RecipeDetailView.swift
//  RecipeSaver
//
//  Created by Dhruv Rasikbhai Jivani on 10/15/25.
//

import SwiftUI
internal import CoreData

struct RecipeDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var recipe: Recipe
    
    @State private var showingDeleteAlert = false
    @State private var showingEditView = false
    @State private var showingExportAlert = false
    @State private var exportSuccess = false

    var body: some View {
        ZStack {
            backgroundView
            
            ScrollView {
                VStack(spacing: 20) {
                    headerCardView
                    ingredientsCardView
                    if let notes = recipe.notes, !notes.isEmpty {
                        notesCardView(notes)
                    }
                }
                .padding(20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                editButton
                deleteButton
                exportButton
            }
        }
        .alert("Delete Recipe?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteRecipe)
            Button("Cancel", role: .cancel) {}
        }
        .alert(exportSuccess ? "✓ Export Successful" : "✗ Export Failed", isPresented: $showingExportAlert) {
            Button("OK") {}
        }
        .sheet(isPresented: $showingEditView) {
            EditRecipeView(recipe: recipe)
        }
    }
    
    var backgroundView: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.98, green: 0.97, blue: 0.95),
                Color(red: 1.0, green: 0.99, blue: 0.98)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    var headerCardView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(recipe.name ?? "Untitled")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
            
            HStack(spacing: 12) {
                categoryBadge
                Spacer()
                timeBadge
            }
        }
        .padding(16)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.85, green: 0.93, blue: 1.0),
                    Color(red: 0.9, green: 0.95, blue: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 0.1, green: 0.5, blue: 0.8).opacity(0.2), lineWidth: 1.5))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
    
    var categoryBadge: some View {
        Label {
            Text(recipe.category ?? "Unknown")
                .fontWeight(.semibold)
        } icon: {
            Image(systemName: "bookmark.circle.fill")
        }
        .font(.system(.callout, design: .rounded))
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.5, blue: 0.8), Color(red: 0.05, green: 0.4, blue: 0.7)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
    var timeBadge: some View {
        Label {
            Text("\(recipe.prepTime) mins")
                .fontWeight(.semibold)
        } icon: {
            Image(systemName: "clock.circle.fill")
        }
        .font(.system(.callout, design: .rounded))
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 0.6, blue: 0.2), Color(red: 1.0, green: 0.5, blue: 0.1)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
    var ingredientsCardView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label("Ingredients", systemImage: "list.bullet.circle.fill")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                Spacer()
            }
            
            Text(recipe.ingredients ?? "")
                .font(.system(.body, design: .rounded))
                .lineSpacing(6)
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .padding(14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 0.6, green: 0.2, blue: 0.8).opacity(0.2), lineWidth: 1))
        }
        .padding(16)
        .background(Color(red: 0.98, green: 0.96, blue: 1.0))
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 0.6, green: 0.2, blue: 0.8).opacity(0.15), lineWidth: 1))
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 3)
    }
    
    func notesCardView(_ notes: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label("Notes", systemImage: "note.text")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                Spacer()
            }
            
            Text(notes)
                .font(.system(.body, design: .rounded))
                .lineSpacing(6)
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .padding(14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 0.2, green: 0.7, blue: 0.3).opacity(0.2), lineWidth: 1))
        }
        .padding(16)
        .background(Color(red: 0.96, green: 1.0, blue: 0.96))
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 0.2, green: 0.7, blue: 0.3).opacity(0.15), lineWidth: 1))
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 3)
    }
    
    var editButton: some View {
        Button(action: { showingEditView = true }) {
            Image(systemName: "pencil.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
        }
    }
    
    var deleteButton: some View {
        Button(role: .destructive) {
            showingDeleteAlert = true
        } label: {
            Image(systemName: "trash.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.3))
        }
    }
    
    var exportButton: some View {
        Button(action: exportRecipe) {
            Image(systemName: "square.and.arrow.up.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 1.0, green: 0.6, blue: 0.2))
        }
    }
    
    private func deleteRecipe() {
        viewContext.delete(recipe)
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print("Failed to delete recipe: \(error.localizedDescription)")
        }
    }
    
    private func exportRecipe() {
        let success = FileExporter.exportRecipe(recipe)
        exportSuccess = success
        showingExportAlert = true
    }
}
