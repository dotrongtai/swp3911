/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Brand;
import Model.Category;
import Model.Color;
import Model.Product;
import Model.ProductVariant;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProductDao extends DBContext {

    PreparedStatement ps;

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setDescription(rs.getString("description"));
                p.setStock(rs.getInt("stock"));
                p.setChip(rs.getString("chip"));
                p.setRam(rs.getString("ram"));
                p.setRom(rs.getString("rom"));
                p.setGpu(rs.getString("gpu"));
                // Assuming Category and Brand are fetched and set separately
                // You might need to add logic here to fetch and set the Category and Brand objects
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductDetail() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id AS product_id, p.name AS product_name, p.image AS product_image, p.price AS product_price, p.description AS product_description, p.stock AS product_stock, "
                + "b.bid AS brand_id, b.name AS brand_name, "
                + "c.cid AS category_id, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Brand b ON p.bid = b.bid "
                + "JOIN Category c ON p.cid = c.cid";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt("brand_id"), rs.getString("brand_name"));
                Category category = new Category(rs.getInt("category_id"), rs.getString("category_name"));

                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setImage(rs.getString("product_image"));
                p.setPrice(rs.getInt("product_price"));
                p.setDescription(rs.getString("product_description"));
                p.setStock(rs.getInt("product_stock"));
                p.setBrand(brand);
                p.setCategory(category);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO Product (cid, bid, name, image, price, description, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product.getCategory().getId());
            st.setInt(2, product.getBrand().getId());
            st.setString(3, product.getName());
            st.setString(4, product.getImage());
            st.setDouble(5, product.getPrice()); // Use setDouble for the 'real' type in SQL
            st.setString(6, product.getDescription());
            st.setInt(7, product.getStock());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Edit an existing product
    public void editProduct(Product product) {
        String sql = "UPDATE Product SET name = ?, image = ?, price = ?, description = ?, stock = ?, bid = ?, cid = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getName());
            st.setString(2, product.getImage());
            st.setInt(3, product.getPrice());
            st.setString(4, product.getDescription());
            st.setInt(5, product.getStock());
            st.setInt(6, product.getBrand().getId());
            st.setInt(7, product.getCategory().getId());
            st.setInt(8, product.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Delete a product by id
    public int hideProduct(int productId) {
        String sql = "UPDATE Product SET isHidden = 1 WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0 ? 1 : 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int showProduct(int productId) {
        String sql = "UPDATE Product SET isHidden = 0 WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0 ? 1 : 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT \n"
                + "    p.id AS product_id, \n"
                + "    p.name AS product_name, \n"
                + "    p.image AS product_image, \n"
                + "    p.price AS product_price,\n"
                + "    p.description AS product_description, \n"
                + "    p.stock AS product_stock,\n"
                + "    p.chip AS product_chip, \n"
                + "    p.ram AS product_ram, \n"
                + "    p.rom AS product_rom, \n"
                + "    p.gpu AS product_gpu,\n"
                + "    b.id AS brand_id, \n"
                + "    b.name AS brand_name, \n"
                + "    c.id AS category_id, \n"
                + "    c.name AS category_name \n"
                + "FROM \n"
                + "    Product p \n"
                + "JOIN \n"
                + "    Brand b ON p.bid = b.id \n"
                + "JOIN \n"
                + "    Category c ON p.cid = c.id \n"
                + "WHERE \n"
                + "    p.id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Brand brand = new Brand(rs.getInt("brand_id"), rs.getString("brand_name"));
                    Category category = new Category(rs.getInt("category_id"), rs.getString("category_name"));

                    product = new Product();
                    product.setId(rs.getInt("product_id"));
                    product.setName(rs.getString("product_name"));
                    product.setImage(rs.getString("product_image"));

                    // Xử lý giá trị product_price
                    String priceStr = rs.getString("product_price");
                    if (priceStr != null) {
                        priceStr = priceStr.replace(".", ""); // Loại bỏ dấu chấm
                        try {
                            int price = Integer.parseInt(priceStr);
                            product.setPrice(price);
                        } catch (NumberFormatException e) {
                            System.out.println("Lỗi chuyển đổi giá trị price: " + e.getMessage());
                            product.setPrice(0); // Hoặc giá trị mặc định khác nếu cần
                        }
                    } else {
                        product.setPrice(0); // Hoặc giá trị mặc định khác nếu cần
                    }

                    product.setDescription(rs.getString("product_description"));
                    product.setStock(rs.getInt("product_stock"));
                    product.setChip(rs.getString("product_chip"));
                    product.setRam(rs.getString("product_ram"));
                    product.setRom(rs.getString("product_rom"));
                    product.setGpu(rs.getString("product_gpu"));
                    product.setBrand(brand);
                    product.setCategory(category);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public int sumStockByProductId(int pId) {
        int totalStock = 0;
        String sql = "SELECT SUM(stock) AS total_stock FROM ProductVariant WHERE pId = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, pId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalStock = rs.getInt("total_stock");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return totalStock;
    }

    // Utility method to fetch a category by its ID
    private Category getCategoryById(int categoryId) throws SQLException {
        String sql = "SELECT * FROM Category WHERE cid = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, categoryId);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new Category(rs.getInt("cid"), rs.getString("name"));
        }
        return null;
    }

// Utility method to fetch a brand by its ID
    private Brand getBrandById(int brandId) throws SQLException {
        String sql = "SELECT * FROM Brand WHERE bid = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, brandId);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new Brand(rs.getInt("bid"), rs.getString("name"));
        }
        return null;
    }

    public List<Product> searchByNameProduct(String keyword) {
        List<Product> searchResult = new ArrayList<>();
        String sql = "SELECT \n"
                + "    p.id AS product_id, \n"
                + "    p.name AS product_name, \n"
                + "    p.image AS product_image, \n"
                + "    p.price AS product_price, \n"
                + "    p.isHidden AS product_isHidden, \n"
                + "    p.description AS product_description, \n"
                + "    p.stock AS product_stock,\n"
                + "    b.id AS brand_id, \n"
                + "    b.name AS brand_name,\n"
                + "    c.id AS category_id, \n"
                + "    c.name AS category_name\n"
                + "FROM \n"
                + "    Product p\n"
                + "JOIN \n"
                + "    Brand b ON p.bid = b.id\n"
                + "JOIN \n"
                + "    Category c ON p.cid = c.id\n"
                + "WHERE \n"
                + "    p.name LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt("brand_id"), rs.getString("brand_name"));
                Category category = new Category(rs.getInt("category_id"), rs.getString("category_name"));

                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setImage(rs.getString("product_image"));
                p.setPrice(rs.getInt("product_price"));
                p.setDescription(rs.getString("product_description"));
                p.setStock(rs.getInt("product_stock"));
                p.setIsHidden(rs.getInt("product_isHidden"));
                p.setBrand(brand);
                p.setCategory(category);
                searchResult.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return searchResult;
    }

    public List<Product> searchByCategory(int categoryId) {
        List<Product> searchResult = new ArrayList<>();
        String sql = "SELECT p.id AS product_id, p.name AS product_name, p.image AS product_image, p.price AS product_price, "
                + "p.description AS product_description, p.stock AS product_stock, p.chip AS product_chip, "
                + "p.ram AS product_ram, p.rom AS product_rom, p.gpu AS product_gpu, p.isHidden AS product_isHidden, "
                + "b.id AS brand_id, b.name AS brand_name, "
                + "c.id AS category_id, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Brand b ON p.bid = b.id "
                + "JOIN Category c ON p.cid = c.id "
                + "WHERE c.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt("brand_id"), rs.getString("brand_name"));
                Category category = new Category(rs.getInt("category_id"), rs.getString("category_name"));

                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setImage(rs.getString("product_image"));
                p.setPrice(rs.getInt("product_price"));
                p.setDescription(rs.getString("product_description"));
                p.setStock(rs.getInt("product_stock"));
                p.setChip(rs.getString("product_chip"));
                p.setRam(rs.getString("product_ram"));
                p.setRom(rs.getString("product_rom"));
                p.setGpu(rs.getString("product_gpu"));
                p.setIsHidden(rs.getInt("product_isHidden"));
                p.setBrand(brand);
                p.setCategory(category);

                searchResult.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return searchResult;
    }

    public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product WHERE price >= ? AND price <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDouble(1, minPrice);
            stm.setDouble(2, maxPrice);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setDescription(rs.getString("description"));
                p.setStock(rs.getInt("stock"));
                p.setIsHidden(rs.getInt("isHidden"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductVariant> getProductVariant(int pId) {
        List<ProductVariant> list = new ArrayList<>();
        try {
            String sql = "SELECT pv.id AS variant_id, pv.pId AS product_id, pv.colorId AS color_id, pv.stock, "
                    + "c.id AS color_id, c.colorName AS color_name "
                    + "FROM ProductVariant pv "
                    + "JOIN Color c ON c.id = pv.colorId "
                    + "WHERE pv.pId = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_id"));

                Color color = new Color();
                color.setId(rs.getInt("color_id"));
                color.setColorName(rs.getString("color_name"));

                ProductVariant p = new ProductVariant();
                p.setId(rs.getInt("variant_id"));
                p.setProduct(product);
                p.setColor(color);
                p.setStock(rs.getInt("stock"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where Product.cid =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setDescription(rs.getString("description"));
                p.setStock(rs.getInt("stock"));
                p.setIsHidden(rs.getInt("isHidden"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByBrandId(int BrandId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where Product.bid =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, BrandId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setDescription(rs.getString("description"));
                p.setStock(rs.getInt("stock"));
                p.setIsHidden(rs.getInt("isHidden"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductsLast() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP 4 * FROM product ORDER BY ID DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setDescription(rs.getString("description"));
                p.setStock(rs.getInt("stock"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select *  from Product order by id\n"
                    + "offset (?-1)*? row fetch next ? rows only";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("price"));
                p.setDescription(rs.getString("description"));
                p.setStock(rs.getInt("stock"));
                p.setIsHidden(rs.getInt("isHidden"));
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public int getTotalProducts() {
        try {
            String sql = "select count(id)  from Product ";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public void addProduct(String name, String image, int price, String description, int stock,
            int cid, int bid, String chip, String ram, String rom, String gpu, int isHidden) {
        String sql = "INSERT INTO Product (cid, bid, name, image, price, description, stock, chip, ram, rom, gpu, isHidden) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid); // Set Category ID
            st.setInt(2, bid); // Set Brand ID
            st.setString(3, name);
            st.setString(4, image);
            st.setInt(5, price);
            st.setString(6, description);
            st.setInt(7, stock);
            st.setString(8, chip);
            st.setString(9, ram);
            st.setString(10, rom);
            st.setString(11, gpu);
            st.setInt(12, isHidden);
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred while adding product: " + e.getMessage());
            e.printStackTrace(); // Print the full stack trace for debugging purposes
        }
    }

    public void updateProduct(String name, String image, int price, String description, int stock, int brandId, int categoryId, String chip, String ram, String rom, String gpu, int id) {
        String sql = "UPDATE Product SET name = ?, image = ?, price = ?, description = ?, stock = ?, bid = ?, cid = ?, chip = ?, ram = ?, rom = ?, gpu = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setInt(3, price);
            st.setString(4, description);
            st.setInt(5, stock);
            st.setInt(6, brandId);
            st.setInt(7, categoryId);
            st.setString(8, chip);
            st.setString(9, ram);
            st.setString(10, rom);
            st.setString(11, gpu);
            st.setInt(12, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id AS product_id, p.name AS product_name, p.image AS product_image, p.price AS product_price, "
                + "p.description AS product_description, p.stock AS product_stock, "
                + "p.chip AS product_chip, p.ram AS product_ram, p.rom AS product_rom, p.gpu AS product_gpu, p.isHidden AS product_isHidden, "
                + "b.id AS brand_id, b.name AS brand_name, "
                + "c.id AS category_id, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Brand b ON p.bid = b.id "
                + "JOIN Category c ON p.cid = c.id";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Brand brand = new Brand(rs.getInt("brand_id"), rs.getString("brand_name"));
                Category category = new Category(rs.getInt("category_id"), rs.getString("category_name"));

                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                p.setImage(rs.getString("product_image"));

                p.setPrice(rs.getInt("product_price"));
                p.setDescription(rs.getString("product_description"));
                p.setStock(rs.getInt("product_stock"));
                p.setChip(rs.getString("product_chip"));
                p.setRam(rs.getString("product_ram"));
                p.setRom(rs.getString("product_rom"));
                p.setGpu(rs.getString("product_gpu"));
                p.setIsHidden(rs.getInt("product_isHidden"));
                p.setBrand(brand);
                p.setCategory(category);

                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addOrUpdateProductVariant(int productId, int colorId, int stock) {
        String sqlCheck = "SELECT id, stock FROM ProductVariant WHERE pId = ? AND colorId = ?";
        String sqlInsert = "INSERT INTO ProductVariant (pId, colorId, stock) VALUES (?, ?, ?)";
        String sqlUpdate = "UPDATE ProductVariant SET stock = ? WHERE id = ?";

        try {
            // Check if the color variant already exists for the product
            PreparedStatement checkStatement = connection.prepareStatement(sqlCheck);
            checkStatement.setInt(1, productId);
            checkStatement.setInt(2, colorId);
            ResultSet rs = checkStatement.executeQuery();

            if (rs.next()) {
                // Color variant already exists, update the stock quantity
                int existingVariantId = rs.getInt("id");
                int currentStock = rs.getInt("stock");
                int newStock = currentStock + stock;

                PreparedStatement updateStatement = connection.prepareStatement(sqlUpdate);
                updateStatement.setInt(1, newStock);
                updateStatement.setInt(2, existingVariantId);
                updateStatement.executeUpdate();
            } else {
                // Color variant does not exist, insert a new record
                PreparedStatement insertStatement = connection.prepareStatement(sqlInsert);
                insertStatement.setInt(1, productId);
                insertStatement.setInt(2, colorId);
                insertStatement.setInt(3, stock);
                insertStatement.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error occurred while adding or updating product variant: " + e.getMessage());
            e.printStackTrace(); // Print the full stack trace for debugging purposes
        }
    }

    public List<Color> getAllColor() {
        List<Color> list = new ArrayList<>();

        try {
            String sql = "SELECT id, colorName FROM Color";  // Adjust column name here
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Color color = new Color();
                color.setId(rs.getInt("id"));
                color.setColorName(rs.getString("colorName"));  // Adjust column name here
                list.add(color);
            }
        } catch (SQLException e) {
            System.out.println("Error occurred while fetching colors: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    public ProductVariant getProductVariantByID(int id) {
        ProductVariant productVariant = null;
        String query = "SELECT * FROM ProductVariant WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int pId = resultSet.getInt("pId");
                    int colorId = resultSet.getInt("colorId");
                    int stock = resultSet.getInt("stock");

                    productVariant = new ProductVariant(id, pId, colorId, stock);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productVariant;
    }

    public List<Product> getProductVariantById(int id) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT p.id, p.name, p.image, p.price, p.description, p.stock, p.chip, p.ram, p.rom, p.gpu, "
                    + "b.id AS brand_id, b.name AS brand_name, "
                    + "c.id AS category_id, c.name AS category_name, "
                    + "pv.id AS productVariantId "
                    + "FROM Product p "
                    + "JOIN Brand b ON p.bid = b.id "
                    + "JOIN Category c ON p.cid = c.id "
                    + "JOIN ProductVariant pv ON p.id = pv.pId "
                    + "WHERE p.id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));

                // Xử lý giá trị product_price
                String priceStr = rs.getString("price");
                if (priceStr != null) {
                    priceStr = priceStr.replace(".", ""); // Loại bỏ dấu chấm
                    try {
                        int price = Integer.parseInt(priceStr);
                        product.setPrice(price);
                    } catch (NumberFormatException e) {
                        System.out.println("Lỗi chuyển đổi giá trị price: " + e.getMessage());
                        product.setPrice(0); // Hoặc giá trị mặc định khác nếu cần
                    }
                } else {
                    product.setPrice(0); // Hoặc giá trị mặc định khác nếu cần
                }

                product.setDescription(rs.getString("description"));
                product.setStock(rs.getInt("stock"));
                product.setChip(rs.getString("chip"));
                product.setRam(rs.getString("ram"));
                product.setRom(rs.getString("rom"));
                product.setGpu(rs.getString("gpu"));

                // Thiết lập Category
                Category category = new Category();
                category.setId(rs.getInt("category_id"));
                category.setName(rs.getString("category_name"));
                product.setCategory(category);

                // Thiết lập Brand
                Brand brand = new Brand();
                brand.setId(rs.getInt("brand_id"));
                brand.setName(rs.getString("brand_name"));
                product.setBrand(brand);

                // Thiết lập thông tin ProductVariant
                ProductVariant productVariant = new ProductVariant();
                productVariant.setId(rs.getInt("productVariantId"));
                product.setProductVariant(productVariant);

                // Thêm sản phẩm vào danh sách
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return products;
    }

    public void updateProductQuantity(int productVariantId, int quantity) {
        String sql = "UPDATE ProductVariant SET stock = stock - ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, productVariantId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int getTotalProduct(){
    int count = 0;
    String sql = "SELECT COUNT(*) FROM Product";
    try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            count = rs.getInt(1);
        }
    } catch (SQLException e) {
        System.out.println("SQL Error: " + e.getMessage());
    }
    return count;
}

    public static void main(String[] args) {
        ProductDao pdao = new ProductDao();
        int total = pdao.getTotalProduct();
        System.out.println(total);
    }
    

}
