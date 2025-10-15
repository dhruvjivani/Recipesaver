<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>RecipeSaver README</title>
<style>
  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
      Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
    line-height: 1.6;
    margin: 20px;
    color: #334477;
    background: #F8F7F5;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
  }
  h1, h2, h3 {
    color: #1A80CC;
    font-weight: 700;
  }
  h1 {
    font-size: 2.5rem;
  }
  h2 {
    margin-top: 2rem;
    border-bottom: 2px solid #FF9933;
    padding-bottom: 0.2rem;
  }
  h3 {
    margin-top: 1.5rem;
    color: #334477;
  }
  a {
    color: #1A80CC;
    text-decoration: none;
  }
  a:hover {
    text-decoration: underline;
  }
  hr {
    border: none;
    border-top: 1px solid #E0E0E0;
    margin: 2rem 0;
  }
  ul, ol {
    margin-left: 1.2rem;
  }
  table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 1rem;
  }
  table, th, td {
    border: 1px solid #E0E0E0;
  }
  th, td {
    padding: 8px 12px;
    text-align: left;
  }
  th {
    background-color: #FF9933;
    color: white;
  }
  pre {
    background: #fff;
    border: 1px solid #E0E0E0;
    padding: 10px;
    border-radius: 6px;
    overflow-x: auto;
  }
  code {
    background: #eee;
    padding: 2px 6px;
    border-radius: 4px;
    font-family: monospace;
  }

  /* Header with images */
  .header-container {
    display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    gap: 40px;
    margin-bottom: 30px;
  }
  .header-text {
    flex: 1 1 350px;
    max-width: 600px;
  }
  .header-text p {
    font-size: 1.1rem;
    margin-top: 0.3rem;
  }
  .image-gallery {
    flex: 1 1 400px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
    gap: 16px;
  }
  .image-gallery img {
    width: 100%;
    height: auto;
    border-radius: 12px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
  }
  .image-gallery img:hover {
    transform: scale(1.05);
  }
</style>
</head>
<body>

<div class="header-container">
  <div class="header-text">
    <h1>RecipeSaver 📱</h1>
    <p>A beautiful and intuitive iOS recipe management app built with SwiftUI. Store, organize, and manage all your favorite recipes in one elegant place.</p>
    <p><strong>Repository:</strong> 
      <a href="https://github.com/dhruvjivani/Recipesaver" target="_blank" rel="noopener noreferrer">
        https://github.com/dhruvjivani/Recipesaver
      </a>
    </p>
  </div>
  <div class="image-gallery">
    <img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/add_recipe.png" alt="Add Recipe" />
    <img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/list_view.png" alt="Recipe List" />
    <img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/edit_recipe.png" alt="Edit Recipe" />
    <img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/detail_view.png" alt="Recipe Details" />
    <img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/full_list.png" alt="Full Recipe List" />
  </div>
</div>

<hr>

<h2>✨ Features</h2>
<ul>
  <li>✅ <strong>Create & Edit Recipes</strong> - Add new recipes with ingredients, prep time, and notes</li>
  <li>✅ <strong>Organize by Category</strong> - Sort recipes into Main, Dessert, Snack, or Appetizer</li>
  <li>✅ <strong>Beautiful Light Theme</strong> - Modern, clean design with professional color scheme</li>
  <li>✅ <strong>Quick Preview</strong> - View recipe details with one tap</li>
  <li>✅ <strong>Delete Recipes</strong> - Remove recipes with swipe-to-delete gesture</li>
  <li>✅ <strong>Export Recipes</strong> - Share your recipes with others</li>
  <li>✅ <strong>Core Data Integration</strong> - Persistent storage for all recipes</li>
  <li>✅ <strong>Responsive UI</strong> - Smooth animations and transitions</li>
</ul>

<hr>

<h2>🎨 Design Overview</h2>
<p>RecipeSaver features a premium light theme with:</p>
<ul>
  <li><strong>Primary Color:</strong> Professional Blue (#1A80CC)</li>
  <li><strong>Accent Color:</strong> Warm Orange (#FF9933)</li>
  <li><strong>Background:</strong> Soft cream gradients</li>
  <li><strong>Cards:</strong> Clean white backgrounds with subtle shadows</li>
  <li><strong>Typography:</strong> Rounded, modern font design</li>
</ul>

<hr>

<h2>📸 Screenshots</h2>

<h3>1. Add Recipe Screen</h3>
<p><img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/add_recipe.png" alt="Create New Recipe" style="max-width:100%; height:auto; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);"></p>
<p>Create and add new recipes with:</p>
<ul>
  <li>Recipe name input</li>
  <li>Category selection (Main, Dessert, Snack, Appetizer)</li>
  <li>Prep time adjustment</li>
  <li>Ingredients editor</li>
  <li>Optional notes section</li>
</ul>

<hr>

<h3>2. Recipe List Screen</h3>
<p><img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/list_view.png" alt="Recipe List" style="max-width:100%; height:auto; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);"></p>
<p>Your recipe collection at a glance:</p>
<ul>
  <li>Recipe count display</li>
  <li>Color-coded badges for category and time</li>
  <li>Swipe-to-delete functionality</li>
  <li>Easy navigation to recipe details</li>
</ul>

<hr>

<h3>3. Edit Recipe Screen</h3>
<p><img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/edit_recipe.png" alt="Edit Recipe" style="max-width:100%; height:auto; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);"></p>
<p>Update existing recipes:</p>
<ul>
  <li>Modify recipe name, category, and prep time</li>
  <li>Edit ingredients and notes</li>
  <li>Same beautiful interface as add screen</li>
</ul>

<hr>

<h3>4. Recipe Detail Screen</h3>
<p><img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/detail_view.png" alt="Recipe Details" style="max-width:100%; height:auto; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);"></p>
<p>View complete recipe information:</p>
<ul>
  <li>Full recipe name with styled header</li>
  <li>Category and prep time badges</li>
  <li>Ingredients listed clearly</li>
  <li>Additional notes</li>
</ul>

<hr>

<h3>5. Full Recipe List Screen</h3>
<p><img src="https://raw.githubusercontent.com/dhruvjivani/Recipesaver/main/RecipeSaver/Images/full_list.png" alt="Full Recipe List" style="max-width:100%; height:auto; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);"></p>
<p>All your recipes organized and accessible.</p>

<hr>

<h2>🛠️ Installation</h2>
<pre><code>git clone https://github.com/dhruvjivani/Recipesaver.git
cd Recipesaver
open RecipeSaver.xcodeproj
</code></pre>
<p>Open the project in Xcode 14 or newer and build for iOS devices or simulator.</p>

<hr>

<h2>🚀 Usage</h2>
<ol>
  <li>Launch the app on your iOS device or simulator</li>
  <li>Tap the "+" button to add a new recipe</li>
  <li>Fill in the recipe details and save</li>
  <li>Browse your recipes in the list</li>
  <li>Tap any recipe to view or edit details</li>
  <li>Swipe left to delete recipes</li>
</ol>

<hr>

<h2>📚 Technologies</h2>
<ul>
  <li>Swift 5</li>
  <li>SwiftUI</li>
  <li>Core Data for persistent storage</li>
  <li>Xcode 14+</li>
</ul>

<hr>

<h2>🤝 Contributing</h2>
<p>Feel free to fork the repository and submit pull requests. Please ensure code style consistency and test your changes.</p>

<hr>

<h2>📄 License</h2>
<p>This project is licensed under the MIT License.</p>

<hr>

<h2>📞 Contact</h2>
<p>If you have questions, contact Dhruv Jivani at <a href="mailto:dhruvjivani.ca001@gmail.com">dhruvjivani.ca001@gmail.com</a>.</p>

</body>
</html>
