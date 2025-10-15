//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by Dhruv Rasikbhai Jivani on 10/15/25.
//

import SwiftUI
internal import CoreData

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var category = "Main"
    @State private var prepTime = 10
    @State private var ingredients = ""
    @State private var notes = ""
    @State private var showAlert = false

    let categories = ["Main", "Dessert", "Snack", "Appetizer"]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.98, green: 0.97, blue: 0.95),
                        Color(red: 1.0, green: 0.99, blue: 0.98)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        VStack(spacing: 12) {
                            Label("Create New Recipe", systemImage: "sparkles")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 8)
                        }
                        
                        VStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Label("Recipe Name", systemImage: "text.quote")
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                                
                                TextField("Enter recipe name", text: $name)
                                    .font(.system(.body, design: .rounded))
                                    .padding(14)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 0.1, green: 0.5, blue: 0.8).opacity(0.3), lineWidth: 1.5))
                                    .textInputAutocapitalization(.words)
                                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Label("Category", systemImage: "tag.fill")
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                                
                                Picker("", selection: $category) {
                                    ForEach(categories, id: \.self) { cat in
                                        Text(cat).tag(cat)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .tint(Color(red: 0.1, green: 0.5, blue: 0.8))
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Label("Prep Time", systemImage: "clock.fill")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                                    
                                    Spacer()
                                    
                                    Text("\(prepTime) min")
                                        .font(.system(.caption, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 0.6, blue: 0.2), Color(red: 1.0, green: 0.5, blue: 0.1)]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(8)
                                }
                                
                                Stepper("", value: $prepTime, in: 1...120, step: 5)
                                    .padding(.vertical, 8)
                            }
                        }
                        .padding(16)
                        .background(Color.white)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 0.1, green: 0.5, blue: 0.8).opacity(0.15), lineWidth: 1))
                        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Ingredients", systemImage: "list.bullet.circle.fill")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                            
                            TextEditor(text: $ingredients)
                                .font(.system(.body, design: .rounded))
                                .frame(minHeight: 140)
                                .scrollContentBackground(.hidden)
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(12)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 0.6, green: 0.2, blue: 0.8).opacity(0.3), lineWidth: 1.5))
                        }
                        .padding(16)
                        .background(Color(red: 0.98, green: 0.96, blue: 1.0))
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 0.6, green: 0.2, blue: 0.8).opacity(0.15), lineWidth: 1))
                        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Notes (Optional)", systemImage: "note.text")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                            
                            TextEditor(text: $notes)
                                .font(.system(.body, design: .rounded))
                                .frame(minHeight: 100)
                                .scrollContentBackground(.hidden)
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(12)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 0.2, green: 0.7, blue: 0.3).opacity(0.3), lineWidth: 1.5))
                        }
                        .padding(16)
                        .background(Color(red: 0.96, green: 1.0, blue: 0.96))
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 0.2, green: 0.7, blue: 0.3).opacity(0.15), lineWidth: 1))
                        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
                    }
                    .padding(20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                        .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                        .fontWeight(.semibold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if name.trimmingCharacters(in: .whitespaces).isEmpty ||
                            ingredients.trimmingCharacters(in: .whitespaces).isEmpty {
                            showAlert = true
                        } else {
                            saveRecipe()
                        }
                    }
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.5, blue: 0.8), Color(red: 0.05, green: 0.4, blue: 0.7)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(8)
                }
            }
            .alert("Please fill in all required fields.", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
    
    private func saveRecipe() {
        let newRecipe = Recipe(context: viewContext)
        newRecipe.id = UUID()
        newRecipe.name = name
        newRecipe.category = category
        newRecipe.prepTime = Int16(prepTime)
        newRecipe.ingredients = ingredients
        newRecipe.notes = notes
        
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print("Failed to save recipe: \(error.localizedDescription)")
        }
    }
}
