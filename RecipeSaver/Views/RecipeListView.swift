//
//  RecipeListView.swift
//  RecipeSaver
//
//  Created by Dhruv Rasikbhai Jivani on 10/15/25.
//

import SwiftUI
internal import CoreData

struct RecipeListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.name, ascending: true)],
        animation: .default)
    private var recipes: FetchedResults<Recipe>
    
    @State private var showingAddRecipe = false
    
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
                
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("RecipeSaver")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
                            Text("\(recipes.count) recipes")
                                .font(.system(.caption, design: .rounded))
                                .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                        }
                        Spacer()
                        Button(action: { showingAddRecipe.toggle() }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 28))
                                .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                        }
                    }
                    .padding(20)
                    
                    if recipes.isEmpty {
                        VStack(spacing: 16) {
                            Image(systemName: "book.circle")
                                .font(.system(size: 60))
                                .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8).opacity(0.3))
                            Text("No Recipes Yet")
                                .font(.system(.headline, design: .rounded))
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                            Text("Tap + to add your first recipe")
                                .font(.system(.caption, design: .rounded))
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                        }
                        .frame(maxHeight: .infinity)
                        .frame(maxWidth: .infinity)
                    } else {
                        List {
                            ForEach(recipes) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(recipe.name ?? "Untitled")
                                            .font(.system(.headline, design: .rounded))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
                                        
                                        HStack(spacing: 12) {
                                            Label {
                                                Text(recipe.category ?? "Unknown")
                                            } icon: {
                                                Image(systemName: "bookmark.fill")
                                            }
                                            .font(.system(.caption2, design: .rounded))
                                            .foregroundColor(Color(red: 0.1, green: 0.5, blue: 0.8))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color(red: 0.1, green: 0.5, blue: 0.8).opacity(0.1))
                                            .cornerRadius(6)
                                            
                                            Label {
                                                Text("\(recipe.prepTime) mins")
                                            } icon: {
                                                Image(systemName: "clock.fill")
                                            }
                                            .font(.system(.caption2, design: .rounded))
                                            .foregroundColor(Color(red: 1.0, green: 0.6, blue: 0.2))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color(red: 1.0, green: 0.6, blue: 0.2).opacity(0.1))
                                            .cornerRadius(6)
                                            
                                            Spacer()
                                        }
                                    }
                                    .padding(.vertical, 12)
                                }
                            }
                            .onDelete(perform: deleteRecipes)
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 0.1, green: 0.5, blue: 0.8).opacity(0.15), lineWidth: 1))
                                    .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
                            )
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(.plain)
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showingAddRecipe) {
                AddRecipeView()
            }
        }
    }
    
    private func deleteRecipes(offsets: IndexSet) {
        withAnimation {
            offsets.map { recipes[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                print("Delete failed: \(error.localizedDescription)")
            }
        }
    }
}
