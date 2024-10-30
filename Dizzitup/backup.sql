

-- // This is your Prisma schema file,
-- // learn more about it in the docs: https://pris.ly/d/prisma-schema

-- // Looking for ways to speed up your queries, or scale easily with your serverless or edge functions?
-- // Try Prisma Accelerate: https://pris.ly/cli/accelerate-init

-- generator client {
--   provider = "prisma-client-js"
-- }

-- datasource db {
--   provider = "mysql"
--   url      = env("DATABASE_URL")
-- }


-- model User {
--   user_id             String            @db.VarChar(36)
--   UUID                String            @id @db.VarChar(36)
--   title               String            @db.VarChar(50)
--   first_name          String            @db.VarChar(50)
--   surname             String            @db.VarChar(50)
--   email               String            @unique @db.VarChar(100)
--   mobile_number       String?           @db.VarChar(20)
--   city_of_residence   String?           @db.VarChar(255)
--   country_of_residence String?           @db.VarChar(255)
--   country_of_interest String?           @db.VarChar(255)
--   facebook_account_url String?          @db.VarChar(2048)
--   instagram_url       String?           @db.VarChar(2048)
--   telegram_number     String?           @db.VarChar(20)
--   whatsapp_number     String?           @db.VarChar(20)
--   tiktok_url          String?           @db.VarChar(2048)
--   role                Role              @default(USER)

--   shopProviders       ShopProvider[]
--   transactions        Transaction[]
--   admins              Admin[]
--   communityManagers   CommunityManager[]
--   buyers              Buyer[]

-- }


-- // model User {
-- //   user_id             Int               @id @default(autoincrement()) // Auto-incrementing user_id
-- //   UUID                String            @unique @db.VarChar(36) @default(uuid()) // Unique UUID with default value
-- //   title               String            @db.VarChar(50)
-- //   first_name          String            @db.VarChar(50)
-- //   surname             String            @db.VarChar(50)
-- //   email               String            @unique @db.VarChar(100)
-- //   mobile_number       String?           @db.VarChar(20)
-- //   city_of_residence   String?           @db.VarChar(255)
-- //   country_of_residence String?          @db.VarChar(255)
-- //   country_of_interest String?           @db.VarChar(255)
-- //   facebook_account_url String?          @db.VarChar(2048)
-- //   instagram_url       String?           @db.VarChar(2048)
-- //   telegram_number     String?           @db.VarChar(20)
-- //   whatsapp_number     String?           @db.VarChar(20)
-- //   tiktok_url          String?           @db.VarChar(2048)
-- //   role                Role              @default(USER)

-- //   shopProviders       ShopProvider[]
-- //   transactions        Transaction[]
-- //   admins              Admin[]
-- //   communityManagers   CommunityManager[]
-- //   buyers              Buyer[]
-- // }

-- enum Role {
--   USER
--   SHOP_PROVIDER
--   BUYER
--   ADMIN
--   COMMUNITY_MANAGER
-- }


-- // model ShopProvider {
-- //   shop_provider_id    Int      @id @default(autoincrement()) // Auto-incrementing primary key
-- //   USID                String   @db.VarChar(36)               // USID as unique string identifier
-- //   UUID                String   @db.VarChar(36) @default(uuid()) // UUID with default uuid()
-- //   shop_name           String?  @db.VarChar(255)
-- //   shop_group_name     String?  @db.VarChar(255)
-- //   shop_products_types ShopProductsTypes
-- //   shop_address        String?  @db.VarChar(255)
-- //   shop_phone_number   String?  @db.VarChar(20)
-- //   shop_city           String?  @db.VarChar(255)
-- //   shop_neighbourhood  String?  @db.VarChar(255)
-- //   shop_country        String?  @db.VarChar(255)
-- //   shop_geolocation    String?  @db.VarChar(255)
-- //   shop_african_location String?  @db.VarChar(255)
-- //   shop_website        String?  @db.VarChar(2048)
-- //   shop_email          String?  @unique @db.VarChar(255)
-- //   shop_facebook_page  String?  @db.VarChar(2048)
-- //   shop_instagram      String?  @db.VarChar(2048)
-- //   shop_whatsapp_number String? @db.VarChar(20)
-- //   shop_telegram_number String? @db.VarChar(20)
-- //   shop_dizzitup_e_store String? @db.VarChar(2048)

-- //   user                User     @relation(fields: [UUID], references: [UUID]) // Relation to User model using UUID
-- //   transactions        Transaction[] // Related transactions

-- //   @@map("shop_provider")
-- // }



-- model ShopProvider {
--   shop_provider_id    String   @db.VarChar(36)
--   USID                String   @id @db.VarChar(36)
--   UUID                String   @db.VarChar(36) @default(uuid())
--   shop_name           String?  @db.VarChar(255)
--   shop_group_name     String?  @db.VarChar(255)
--   shop_products_types ShopProductsTypes
--   shop_address        String?  @db.VarChar(255)
--   shop_phone_number   String?  @db.VarChar(20)
--   shop_city           String?  @db.VarChar(255)
--   shop_neighbourhood  String?  @db.VarChar(255)
--   shop_country        String?  @db.VarChar(255)
--   shop_geolocation    String?  @db.VarChar(255)
--   shop_african_location String?  @db.VarChar(255)
--   shop_website        String?  @db.VarChar(2048)
--   shop_email          String?  @unique @db.VarChar(255)
--   shop_facebook_page  String?  @db.VarChar(2048)
--   shop_instagram      String?  @db.VarChar(2048)
--   shop_whatsapp_number String? @db.VarChar(20)
--   shop_telegram_number String? @db.VarChar(20)
--   shop_dizzitup_e_store String? @db.VarChar(2048)

--   user                User     @relation(fields: [UUID], references: [UUID])
--   transactions        Transaction[]

--   @@map("shop_provider")
-- }


-- enum ShopProductsTypes {
--   goods
--   digital
--   services
-- }



-- // model Transaction {
-- //   transaction_id      Int      @id @default(autoincrement()) // Auto-incrementing primary key
-- //   USID                Int      // Foreign key referencing ShopProvider's auto-incrementing primary key
-- //   UUID                String   @db.VarChar(36) @default(uuid()) // UUID with default uuid()
-- //   service             Service
-- //   shop_provider_name  String?  @db.VarChar(255)
-- //   beneficiary_UUID    String?  @db.VarChar(36)
-- //   transaction_value   Decimal? @db.Decimal(10, 2)

-- //   user                User     @relation(fields: [UUID], references: [UUID]) // Relation to User model using UUID
-- //   shopProvider        ShopProvider @relation(fields: [USID], references: [shop_provider_id]) // Correct relation using primary key
-- //   buyers              Buyer[] // Related buyers

-- //   @@map("transactions")
-- // }


-- model Transaction {
--   transactions_id      String   @db.VarChar(36)
--   UTID                 String   @id @unique @db.VarChar(36)
--   UUID                 String   @db.VarChar(36) @default(uuid())
--   USID                 String   @db.VarChar(36)
--   service              Service
--   shop_provider_name   String?  @db.VarChar(255)
--   beneficiary_UUID     String?  @db.VarChar(36)
--   beneficiary_first_name String? @db.VarChar(255)
--   beneficiary_city     String?  @db.VarChar(255)
--   beneficiary_country  String?  @db.VarChar(255)
--   transaction_medium   String?  @db.VarChar(255)
--   transaction_value    Decimal? @db.Decimal(10, 2)

--   user                User     @relation(fields: [UUID], references: [UUID])
--   shopProvider        ShopProvider @relation(fields: [USID], references: [USID])
--   buyers              Buyer[]

--   @@index([service])
--   @@map("transactions")
-- }



-- enum Service {
--   Pay_bill
--   Buy_goods
--   Buy_gift_cards
--   Send_money
--   Buy_voucher
--   Subscribe_Visa_Mastercard
--   Save_money
--   Borrow_money
--   Lend_money
-- }

-- model Admin {
--   admin_id Int      @id @default(autoincrement())
--   UUID     String   @db.VarChar(36) @default(uuid())
--   user     User     @relation(fields: [UUID], references: [UUID])

--   @@map("admin")
-- }

-- model CommunityManager {
--   community_manager_id Int      @id @default(autoincrement())
--   UUID                 String   @db.VarChar(36) @default(uuid())
--   user                 User     @relation(fields: [UUID], references: [UUID])

--   @@map("community_manager")
-- }

-- model Buyer {
--   buyer_id Int      @id @default(autoincrement())
--   UUID     String   @db.VarChar(36) @default(uuid())
--   UTID     String   @db.VarChar(36)

--   user      User     @relation(fields: [UUID], references: [UUID])
--   transaction Transaction @relation(fields: [UTID], references: [UTID])

--   @@map("buyer")
-- }


-- // model Buyer {
-- //   buyer_id     Int      @id @default(autoincrement()) 
-- //   UUID         String   @db.VarChar(36) @default(uuid())
-- //   transaction_id Int    // Corrected field for referencing Transaction model's ID

-- //   user          User     @relation(fields: [UUID], references: [UUID])
-- //   transaction   Transaction @relation(fields: [transaction_id], references: [transaction_id]) // Correct relation

-- //   @@map("buyer")
-- // }
