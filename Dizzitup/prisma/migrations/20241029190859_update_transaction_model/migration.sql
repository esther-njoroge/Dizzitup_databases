/*
  Warnings:

  - You are about to drop the column `service` on the `transactions` table. All the data in the column will be lost.
  - You are about to drop the column `shop_provider_name` on the `transactions` table. All the data in the column will be lost.
  - You are about to drop the column `transaction_value` on the `transactions` table. All the data in the column will be lost.
  - Added the required column `date` to the `transactions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `time_UT` to the `transactions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type_of_service` to the `transactions` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `transactions_service_idx` ON `transactions`;

-- AlterTable
ALTER TABLE `transactions` DROP COLUMN `service`,
    DROP COLUMN `shop_provider_name`,
    DROP COLUMN `transaction_value`,
    ADD COLUMN `buyer_city` VARCHAR(255) NULL,
    ADD COLUMN `buyer_country` VARCHAR(255) NULL,
    ADD COLUMN `buyer_firstname` VARCHAR(255) NULL,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `date` DATETIME(3) NOT NULL,
    ADD COLUMN `date_range` VARCHAR(255) NULL,
    ADD COLUMN `on_chain_off_chain` VARCHAR(255) NULL,
    ADD COLUMN `service_provider` VARCHAR(255) NULL,
    ADD COLUMN `time_UT` VARCHAR(191) NOT NULL,
    ADD COLUMN `tx_value_dizzy` DECIMAL(10, 2) NULL,
    ADD COLUMN `type_of_service` ENUM('Pay_Bills', 'Top_Up', 'Buy_Gift_Cards', 'Send_Money', 'Buy_Goods', 'Subscribe_Visa_Mastercard', 'Buy_Vouchers') NOT NULL;

-- CreateIndex
CREATE INDEX `transactions_type_of_service_idx` ON `transactions`(`type_of_service`);
