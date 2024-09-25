-- CreateTable
CREATE TABLE `User` (
    `UUID` VARCHAR(36) NOT NULL,
    `user_id` VARCHAR(36) NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `first_name` VARCHAR(50) NOT NULL,
    `surname` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `mobile_number` VARCHAR(20) NULL,
    `city_of_residence` VARCHAR(255) NULL,
    `country_of_residence` VARCHAR(255) NULL,
    `country_of_interest` VARCHAR(255) NULL,
    `facebook_account_url` VARCHAR(2048) NULL,
    `instagram_url` VARCHAR(2048) NULL,
    `telegram_number` VARCHAR(20) NULL,
    `whatsapp_number` VARCHAR(20) NULL,
    `tiktok_url` VARCHAR(2048) NULL,
    `role` ENUM('USER', 'SHOP_PROVIDER', 'BUYER', 'ADMIN', 'COMMUNITY_MANAGER') NOT NULL DEFAULT 'USER',

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`UUID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shop_provider` (
    `shop_provider_id` VARCHAR(36) NOT NULL,
    `USID` VARCHAR(36) NOT NULL,
    `UUID` VARCHAR(36) NOT NULL,
    `shop_name` VARCHAR(255) NULL,
    `shop_group_name` VARCHAR(255) NULL,
    `shop_products_types` ENUM('goods', 'digital', 'services') NOT NULL,
    `shop_address` VARCHAR(255) NULL,
    `shop_phone_number` VARCHAR(20) NULL,
    `shop_city` VARCHAR(255) NULL,
    `shop_neighbourhood` VARCHAR(255) NULL,
    `shop_country` VARCHAR(255) NULL,
    `shop_geolocation` VARCHAR(255) NULL,
    `shop_african_location` VARCHAR(255) NULL,
    `shop_website` VARCHAR(2048) NULL,
    `shop_email` VARCHAR(255) NULL,
    `shop_facebook_page` VARCHAR(2048) NULL,
    `shop_instagram` VARCHAR(2048) NULL,
    `shop_whatsapp_number` VARCHAR(20) NULL,
    `shop_telegram_number` VARCHAR(20) NULL,
    `shop_dizzitup_e_store` VARCHAR(2048) NULL,

    UNIQUE INDEX `shop_provider_shop_email_key`(`shop_email`),
    PRIMARY KEY (`USID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactions` (
    `transactions_id` VARCHAR(36) NOT NULL,
    `UTID` VARCHAR(36) NOT NULL,
    `UUID` VARCHAR(36) NOT NULL,
    `USID` VARCHAR(36) NOT NULL,
    `service` ENUM('Pay_bill', 'Buy_goods', 'Buy_gift_cards', 'Send_money', 'Buy_voucher', 'Subscribe_Visa_Mastercard', 'Save_money', 'Borrow_money', 'Lend_money') NOT NULL,
    `shop_provider_name` VARCHAR(255) NULL,
    `beneficiary_UUID` VARCHAR(36) NULL,
    `beneficiary_first_name` VARCHAR(255) NULL,
    `beneficiary_city` VARCHAR(255) NULL,
    `beneficiary_country` VARCHAR(255) NULL,
    `transaction_medium` VARCHAR(255) NULL,
    `transaction_value` DECIMAL(10, 2) NULL,

    UNIQUE INDEX `transactions_UTID_key`(`UTID`),
    INDEX `transactions_service_idx`(`service`),
    PRIMARY KEY (`UTID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `admin` (
    `admin_id` VARCHAR(36) NOT NULL,
    `UUID` VARCHAR(36) NOT NULL,

    PRIMARY KEY (`admin_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `community_manager` (
    `community_manager_id` VARCHAR(36) NOT NULL,
    `UUID` VARCHAR(36) NOT NULL,

    PRIMARY KEY (`community_manager_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buyer` (
    `buyer_id` VARCHAR(36) NOT NULL,
    `UUID` VARCHAR(36) NOT NULL,
    `UTID` VARCHAR(36) NOT NULL,

    PRIMARY KEY (`buyer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `shop_provider` ADD CONSTRAINT `shop_provider_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User`(`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User`(`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_USID_fkey` FOREIGN KEY (`USID`) REFERENCES `shop_provider`(`USID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `admin` ADD CONSTRAINT `admin_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User`(`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `community_manager` ADD CONSTRAINT `community_manager_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User`(`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `buyer` ADD CONSTRAINT `buyer_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User`(`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `buyer` ADD CONSTRAINT `buyer_UTID_fkey` FOREIGN KEY (`UTID`) REFERENCES `transactions`(`UTID`) ON DELETE RESTRICT ON UPDATE CASCADE;
