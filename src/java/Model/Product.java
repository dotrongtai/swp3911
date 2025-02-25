package Model;

public class Product {

    private int id;
    private int isHidden;
    private String name;
    private String image;
    private int price;
    private String description;
    private int stock;
    private String chip;
    private String ram;
    private String rom;
    private String gpu;
    private Category category;
    private Brand brand;
    private ProductVariant productVariant;

    public Product() {
    }

    public Product(int id, String name, String image, int price, String description, int stock, String chip, String ram, String rom, String gpu, Category category, Brand brand, ProductVariant productVariant) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.chip = chip;
        this.ram = ram;
        this.rom = rom;
        this.gpu = gpu;
        this.category = category;
        this.brand = brand;
        this.productVariant = productVariant;
    }

    public Product(int id, int isHidden, String name, String image, int price, String description, int stock, String chip, String ram, String rom, String gpu, Category category, Brand brand, ProductVariant productVariant) {
        this.id = id;
        this.isHidden = isHidden;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.chip = chip;
        this.ram = ram;
        this.rom = rom;
        this.gpu = gpu;
        this.category = category;
        this.brand = brand;
        this.productVariant = productVariant;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getRom() {
        return rom;
    }

    public void setRom(String rom) {
        this.rom = rom;
    }

    public String getGpu() {
        return gpu;
    }

    public void setGpu(String gpu) {
        this.gpu = gpu;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public ProductVariant getProductVariant() {
        return productVariant;
    }

    public void setProductVariant(ProductVariant productVariant) {
        this.productVariant = productVariant;
    }

    public int getIsHidden() {
        return isHidden;
    }

    public void setIsHidden(int isHidden) {
        this.isHidden = isHidden;
    }

}
