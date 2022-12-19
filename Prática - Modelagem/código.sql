CREATE TABLE "states" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL
);
CREATE TABLE "cities" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" integer NOT NULL REFERENCES "states"(id)
);
CREATE TABLE "addresses" (
	"id" serial NOT NULL PRIMARY KEY,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT,
	"postalCode" TEXT NOT NULL,
	"cityId" integer NOT NULL REFERENCES "cities"(id)
);
CREATE TABLE "categories" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);
CREATE TABLE "sizes" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);
CREATE TABLE "users" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"addressId" integer NOT NULL REFERENCES "addresses"(id)
);
CREATE TABLE "products" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"currentPrice" integer NOT NULL,
	"categoryId" integer NOT NULL REFERENCES "categories"(id),
	"sizeId" integer NOT NULL REFERENCES "sizes"(id)
);
CREATE TABLE "pictures" (
	"id" serial NOT NULL PRIMARY KEY,
	"imageUrl" TEXT NOT NULL,
	"productId" integer NOT NULL REFERENCES "products"(id)
);
CREATE TABLE "orders" (
	"id" serial NOT NULL PRIMARY KEY,
	"date" DATE NOT NULL DEFAULT NOW(),
	"userId" integer NOT NULL REFERENCES "users"(id),
	"state" TEXT NOT NULL,
	"addressId" integer NOT NULL REFERENCES "addresses"(id)
);
CREATE TABLE "ordersProducts" (
	"id" serial NOT NULL PRIMARY KEY,
	"orderId" integer NOT NULL REFERENCES "orders"(id),
	"productId" integer NOT NULL REFERENCES "products"(id),
	"quantity" integer NOT NULL,
	"paidPrice" integer NOT NULL
);