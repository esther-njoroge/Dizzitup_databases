-- /*
--   Warnings:

--   - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
--   - You are about to alter the column `user_id` on the `User` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
--   - The primary key for the `admin` table will be changed. If it partially fails, the table could be left without primary key constraint.
--   - You are about to alter the column `admin_id` on the `admin` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
--   - The primary key for the `buyer` table will be changed. If it partially fails, the table could be left without primary key constraint.
--   - You are about to drop the column `UTID` on the `buyer` table. All the data in the column will be lost.
--   - You are about to alter the column `buyer_id` on the `buyer` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
--   - The primary key for the `community_manager` table will be changed. If it partially fails, the table could be left without primary key constraint.
--   - You are about to alter the column `community_manager_id` on the `community_manager` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
--   - The primary key for the `shop_provider` table will be changed. If it partially fails, the table could be left without primary key constraint.
--   - You are about to alter the column `shop_provider_id` on the `shop_provider` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
--   - The primary key for the `transactions` table will be changed. If it partially fails, the table could be left without primary key constraint.
--   - You are about to drop the column `UTID` on the `transactions` table. All the data in the column will be lost.
--   - You are about to drop the column `beneficiary_city` on the `transactions` table. All the data in the column will be lost.
--   - You are about to drop the column `beneficiary_country` on the `transactions` table. All the data in the column will be lost.
--   - You are about to drop the column `beneficiary_first_name` on the `transactions` table. All the data in the column will be lost.
--   - You are about to drop the column `transaction_medium` on the `transactions` table. All the data in the column will be lost.
--   - You are about to drop the column `transactions_id` on the `transactions` table. All the data in the column will be lost.
--   - You are about to alter the column `USID` on the `transactions` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
--   - A unique constraint covering the columns `[UUID]` on the table `User` will be added. If there are existing duplicate values, this will fail.
--   - Added the required column `transaction_id` to the `buyer` table without a default value. This is not possible if the table is not empty.
--   - Added the required column `transaction_id` to the `transactions` table without a default value. This is not possible if the table is not empty.

-- */
-- -- DropForeignKey
-- ALTER TABLE `buyer` DROP FOREIGN KEY `buyer_UTID_fkey`;

-- -- DropForeignKey
-- ALTER TABLE `transactions` DROP FOREIGN KEY `transactions_USID_fkey`;

-- -- DropIndex
-- DROP INDEX `transactions_UTID_key` ON `transactions`;

-- -- DropIndex
-- DROP INDEX `transactions_service_idx` ON `transactions`;

-- -- AlterTable
-- ALTER TABLE `User` DROP PRIMARY KEY,
--     MODIFY `user_id` INTEGER NOT NULL AUTO_INCREMENT,
--     ADD PRIMARY KEY (`user_id`);

-- -- AlterTable
-- ALTER TABLE `admin` DROP PRIMARY KEY,
--     MODIFY `admin_id` INTEGER NOT NULL AUTO_INCREMENT,
--     ADD PRIMARY KEY (`admin_id`);

-- -- AlterTable
-- ALTER TABLE `buyer` DROP PRIMARY KEY,
--     DROP COLUMN `UTID`,
--     ADD COLUMN `transaction_id` INTEGER NOT NULL,
--     MODIFY `buyer_id` INTEGER NOT NULL AUTO_INCREMENT,
--     ADD PRIMARY KEY (`buyer_id`);

-- -- AlterTable
-- ALTER TABLE `community_manager` DROP PRIMARY KEY,
--     MODIFY `community_manager_id` INTEGER NOT NULL AUTO_INCREMENT,
--     ADD PRIMARY KEY (`community_manager_id`);

-- -- AlterTable
-- ALTER TABLE `shop_provider` DROP PRIMARY KEY,
--     MODIFY `shop_provider_id` INTEGER NOT NULL AUTO_INCREMENT,
--     ADD PRIMARY KEY (`shop_provider_id`);

-- -- AlterTable
-- ALTER TABLE `transactions` DROP PRIMARY KEY,
--     DROP COLUMN `UTID`,
--     DROP COLUMN `beneficiary_city`,
--     DROP COLUMN `beneficiary_country`,
--     DROP COLUMN `beneficiary_first_name`,
--     DROP COLUMN `transaction_medium`,
--     DROP COLUMN `transactions_id`,
--     ADD COLUMN `transaction_id` INTEGER NOT NULL AUTO_INCREMENT,
--     MODIFY `USID` INTEGER NOT NULL,
--     ADD PRIMARY KEY (`transaction_id`);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `User_UUID_key` ON `User`(`UUID`);

-- -- AddForeignKey
-- ALTER TABLE `transactions` ADD CONSTRAINT `transactions_USID_fkey` FOREIGN KEY (`USID`) REFERENCES `shop_provider`(`shop_provider_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- -- AddForeignKey
-- ALTER TABLE `buyer` ADD CONSTRAINT `buyer_transaction_id_fkey` FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`transaction_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
