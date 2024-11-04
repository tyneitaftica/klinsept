CREATE TABLE "products"(
    "id" TEXT NOT NULL,
    "Supplier_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" FLOAT(53) NOT NULL,
    "images" JSON NOT NULL,
    "discount" INTEGER NOT NULL,
    "description" JSON NOT NULL,
    "star_rating" INTEGER NOT NULL,
    "condition" VARCHAR(255) CHECK
        (
            "condition" IN('new', 'old', 'refurbish', 'fresh')
        ) NOT NULL,
        "location" TEXT NOT NULL
);
ALTER TABLE
    "products" ADD PRIMARY KEY("id");
CREATE TABLE "categories"(
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "categories" ADD PRIMARY KEY("id");
CREATE TABLE "Cart Items"(
    "user_id" BIGINT NOT NULL,
    "product_id" BIGINT NOT NULL,
    "quantity" BIGINT NOT NULL
);
ALTER TABLE
    "Cart Items" ADD PRIMARY KEY("user_id");
CREATE TABLE "sub_categories"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "category_id" TEXT NOT NULL
);
ALTER TABLE
    "sub_categories" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phone-number" INTEGER NOT NULL,
    "profilepic" TEXT NULL,
    "address" JSON NOT NULL,
    "role" VARCHAR(255) CHECK
        ("role" IN('')) NOT NULL,
        "status" VARCHAR(255)
    CHECK
        ("status" IN('')) NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "discounts"(
    "id" BIGINT NOT NULL,
    "product_id" BIGINT NOT NULL,
    "amount" FLOAT(53) NOT NULL,
    "due" DATE NOT NULL
);
ALTER TABLE
    "discounts" ADD PRIMARY KEY("id");
CREATE TABLE "products_category"(
    "category_id" TEXT NOT NULL,
    "products_id" TEXT NOT NULL
);
ALTER TABLE
    "products_category" ADD PRIMARY KEY("category_id");
CREATE TABLE "order_items"(
    "order_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL
);
CREATE TABLE "Transactions"(
    "id" TEXT NOT NULL,
    "Order_id" TEXT NOT NULL,
    "mode" VARCHAR(255) CHECK
        ("mode" IN('')) NOT NULL,
        "status" VARCHAR(255)
    CHECK
        ("status" IN('')) NOT NULL
);
ALTER TABLE
    "Transactions" ADD PRIMARY KEY("id");
COMMENT
ON COLUMN
    "Transactions"."mode" IS 'POD, Mpesa, Airtel-money, T-kas, credit-card, paypal';
CREATE TABLE "orders"(
    "id" TEXT NOT NULL,
    "User_id" BIGINT NOT NULL,
    "taxes" JSON NOT NULL,
    "delivery_mode" VARCHAR(255) CHECK
        (
            "delivery_mode" IN('instant', 'later')
        ) NOT NULL,
        "message" TEXT NOT NULL
);
ALTER TABLE
    "orders" ADD PRIMARY KEY("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_user_id_foreign" FOREIGN KEY("User_id") REFERENCES "users"("id");
ALTER TABLE
    "Transactions" ADD CONSTRAINT "transactions_order_id_foreign" FOREIGN KEY("Order_id") REFERENCES "orders"("id");
ALTER TABLE
    "sub_categories" ADD CONSTRAINT "sub_categories_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "categories"("id");
ALTER TABLE
    "order_items" ADD CONSTRAINT "order_items_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "products"("id");
ALTER TABLE
    "products" ADD CONSTRAINT "products_supplier_id_foreign" FOREIGN KEY("Supplier_id") REFERENCES "users"("id");
ALTER TABLE
    "Cart Items" ADD CONSTRAINT "cart items_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "products"("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "Cart Items"("user_id");
ALTER TABLE
    "order_items" ADD CONSTRAINT "order_items_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "orders"("id");
ALTER TABLE
    "products_category" ADD CONSTRAINT "products_category_products_id_foreign" FOREIGN KEY("products_id") REFERENCES "products"("id");
ALTER TABLE
    "discounts" ADD CONSTRAINT "discounts_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "products"("id");
ALTER TABLE
    "categories" ADD CONSTRAINT "categories_id_foreign" FOREIGN KEY("id") REFERENCES "products_category"("category_id");