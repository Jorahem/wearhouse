# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
OrderItem.destroy_all
Order.destroy_all
CartItem.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

print "Creating categories..."

# Create Categories
categories = [
  {
    name: "Men's Clothing",
    description: "Stylish and comfortable clothing for men"
  },
  {
    name: "Women's Clothing", 
    description: "Trendy and fashionable clothing for women"
  },
  {
    name: "T-Shirts",
    description: "Casual and comfortable t-shirts for everyone"
  },
  {
    name: "Jeans",
    description: "Classic and modern jeans for all occasions"
  },
  {
    name: "Dresses",
    description: "Elegant and beautiful dresses for special occasions"
  },
  {
    name: "Shoes",
    description: "Comfortable and stylish footwear"
  },
  {
    name: "Accessories",
    description: "Fashion accessories to complete your look"
  }
]

created_categories = Category.create!(categories)
print " #{created_categories.count} categories created.\n"

print "Creating products..."

# Sample products
products = [
  # Men's Clothing
  {
    name: "Classic White Shirt",
    description: "A timeless white dress shirt perfect for business and formal occasions. Made from high-quality cotton with a comfortable fit.",
    price: 45.99,
    category: created_categories.find { |c| c.name == "Men's Clothing" },
    size: "L",
    color: "White",
    stock_quantity: 25,
    image_url: "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=500"
  },
  {
    name: "Men's Casual Blazer",
    description: "Smart casual blazer perfect for work or weekend outings. Comfortable fabric with modern slim fit.",
    price: 89.99,
    category: created_categories.find { |c| c.name == "Men's Clothing" },
    size: "M",
    color: "Navy Blue",
    stock_quantity: 15,
    image_url: "https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=500"
  },
  {
    name: "Men's Polo Shirt",
    description: "Classic polo shirt in premium cotton. Perfect for casual and semi-formal occasions.",
    price: 34.99,
    category: created_categories.find { |c| c.name == "Men's Clothing" },
    size: "L",
    color: "Navy",
    stock_quantity: 30,
    image_url: "https://images.unsplash.com/photo-1586790170083-2f9ceadc732d?w=500"
  },

  # Women's Clothing  
  {
    name: "Elegant Black Dress",
    description: "A sophisticated little black dress perfect for evening events and dinner dates. Flattering silhouette with comfortable stretch fabric.",
    price: 79.99,
    category: created_categories.find { |c| c.name == "Women's Clothing" },
    size: "M",
    color: "Black",
    stock_quantity: 20,
    image_url: "https://images.unsplash.com/photo-1566479179817-c0f1e60b0ad9?w=500"
  },
  {
    name: "Women's Silk Blouse",
    description: "Luxurious silk blouse with elegant draping. Perfect for professional and formal settings.",
    price: 65.99,
    category: created_categories.find { |c| c.name == "Women's Clothing" },
    size: "S",
    color: "Cream",
    stock_quantity: 18,
    image_url: "https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=500"
  },
  {
    name: "Casual Summer Cardigan",
    description: "Light and breezy cardigan perfect for layering. Soft knit fabric with button closure.",
    price: 42.99,
    category: created_categories.find { |c| c.name == "Women's Clothing" },
    size: "M",
    color: "Beige",
    stock_quantity: 22,
    image_url: "https://images.unsplash.com/photo-1571513722275-4b9cede0c0e4?w=500"
  },

  # T-Shirts
  {
    name: "Premium Cotton T-Shirt",
    description: "Soft and comfortable 100% cotton t-shirt. Classic fit with crew neck. Perfect for everyday wear.",
    price: 19.99,
    category: created_categories.find { |c| c.name == "T-Shirts" },
    size: "L",
    color: "Black",
    stock_quantity: 50,
    image_url: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500"
  },
  {
    name: "Vintage Band T-Shirt",
    description: "Retro-style band t-shirt with vintage graphics. Soft cotton blend with relaxed fit.",
    price: 24.99,
    category: created_categories.find { |c| c.name == "T-Shirts" },
    size: "M",
    color: "Gray",
    stock_quantity: 35,
    image_url: "https://images.unsplash.com/photo-1588115879953-1f0cbb7b7e0c?w=500"
  },
  {
    name: "Striped Long Sleeve Tee",
    description: "Classic striped long sleeve t-shirt. Comfortable cotton fabric with modern fit.",
    price: 29.99,
    category: created_categories.find { |c| c.name == "T-Shirts" },
    size: "S",
    color: "Navy/White",
    stock_quantity: 40,
    image_url: "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=500"
  },

  # Jeans
  {
    name: "Classic Blue Jeans",
    description: "Timeless straight-leg blue jeans. Made from premium denim with comfortable stretch. Perfect everyday jean.",
    price: 69.99,
    category: created_categories.find { |c| c.name == "Jeans" },
    size: "32x30",
    color: "Blue",
    stock_quantity: 28,
    image_url: "https://images.unsplash.com/photo-1542272454315-7ad9ed38f533?w=500"
  },
  {
    name: "Skinny Fit Jeans",
    description: "Modern skinny fit jeans with stretch denim for comfort and style. Great for both casual and dressed-up looks.",
    price: 64.99,
    category: created_categories.find { |c| c.name == "Jeans" },
    size: "28x30",
    color: "Dark Blue",
    stock_quantity: 32,
    image_url: "https://images.unsplash.com/photo-1582418702059-97ebafb35d09?w=500"
  },
  {
    name: "High-Waisted Mom Jeans",
    description: "Trendy high-waisted mom jeans with relaxed fit. Vintage-inspired design with modern comfort.",
    price: 59.99,
    category: created_categories.find { |c| c.name == "Jeans" },
    size: "26x28",
    color: "Light Blue",
    stock_quantity: 26,
    image_url: "https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=500"
  },

  # Dresses
  {
    name: "Floral Summer Dress",
    description: "Beautiful floral print summer dress with flowing fabric. Perfect for garden parties and casual outings.",
    price: 54.99,
    category: created_categories.find { |c| c.name == "Dresses" },
    size: "M",
    color: "Floral",
    stock_quantity: 24,
    image_url: "https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500"
  },
  {
    name: "Cocktail Party Dress",
    description: "Sophisticated cocktail dress with elegant design. Perfect for evening events and special occasions.",
    price: 95.99,
    category: created_categories.find { |c| c.name == "Dresses" },
    size: "S",
    color: "Red",
    stock_quantity: 16,
    image_url: "https://images.unsplash.com/photo-1566479179817-c0f1e60b0ad9?w=500"
  },
  {
    name: "Maxi Beach Dress",
    description: "Flowing maxi dress perfect for beach vacations and summer festivals. Lightweight and breathable fabric.",
    price: 47.99,
    category: created_categories.find { |c| c.name == "Dresses" },
    size: "L",
    color: "Turquoise",
    stock_quantity: 20,
    image_url: "https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=500"
  },

  # Shoes
  {
    name: "Classic White Sneakers",
    description: "Comfortable white leather sneakers perfect for casual wear. Cushioned sole and breathable interior.",
    price: 79.99,
    category: created_categories.find { |c| c.name == "Shoes" },
    size: "9",
    color: "White",
    stock_quantity: 30,
    image_url: "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500"
  },
  {
    name: "Brown Leather Boots",
    description: "Stylish brown leather ankle boots. Perfect for fall and winter wear. Comfortable and durable.",
    price: 124.99,
    category: created_categories.find { |c| c.name == "Shoes" },
    size: "8",
    color: "Brown",
    stock_quantity: 18,
    image_url: "https://images.unsplash.com/photo-1608256246200-53e635b5b65f?w=500"
  },
  {
    name: "High Heel Pumps",
    description: "Elegant black high heel pumps perfect for professional and formal occasions. Comfortable fit with quality construction.",
    price: 89.99,
    category: created_categories.find { |c| c.name == "Shoes" },
    size: "7",
    color: "Black",
    stock_quantity: 22,
    image_url: "https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=500"
  },

  # Accessories
  {
    name: "Leather Handbag",
    description: "Premium leather handbag with multiple compartments. Perfect size for daily essentials with elegant design.",
    price: 129.99,
    category: created_categories.find { |c| c.name == "Accessories" },
    size: "Medium",
    color: "Black",
    stock_quantity: 15,
    image_url: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500"
  },
  {
    name: "Designer Sunglasses",
    description: "Stylish designer sunglasses with UV protection. Classic aviator style suitable for all face shapes.",
    price: 65.99,
    category: created_categories.find { |c| c.name == "Accessories" },
    size: "One Size",
    color: "Gold Frame",
    stock_quantity: 25,
    image_url: "https://images.unsplash.com/photo-1508296695146-257a814070b4?w=500"
  },
  {
    name: "Silk Scarf",
    description: "Luxurious silk scarf with beautiful patterns. Perfect accessory to elevate any outfit.",
    price: 39.99,
    category: created_categories.find { |c| c.name == "Accessories" },
    size: "One Size",
    color: "Multi-color",
    stock_quantity: 20,
    image_url: "https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=500"
  }
]

created_products = Product.create!(products)
print " #{created_products.count} products created.\n"

# Create a test user
print "Creating test user..."
test_user = User.create!(
  email: "test@example.com",
  password: "password123",
  password_confirmation: "password123"
)
print " Test user created (email: test@example.com, password: password123)\n"

print "\n✅ Seed data created successfully!\n"
print "📊 Summary:\n"
print "   - Categories: #{Category.count}\n"
print "   - Products: #{Product.count}\n"
print "   - Users: #{User.count}\n"
print "\n🔑 Test Account:\n"
print "   Email: test@example.com\n"
print "   Password: password123\n"
