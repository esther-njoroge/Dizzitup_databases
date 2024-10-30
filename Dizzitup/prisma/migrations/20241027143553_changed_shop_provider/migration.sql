/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `user_id` on the `User` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - The primary key for the `shop_provider` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `shop_provider_id` on the `shop_provider` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - You are about to alter the column `transactions_id` on the `transactions` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - A unique constraint covering the columns `[UUID]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[USID]` on the table `shop_provider` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[transactions_id]` on the table `transactions` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable

-- ALTER TABLE `User` DROP PRIMARY KEY,
--     MODIFY `user_id` INTEGER NOT NULL AUTO_INCREMENT,
--     ADD PRIMARY KEY (`user_id`);
-- h
-- -- AlterTable
-- ALTER TABLE `shop_provider` DROP PRIMARY KEY,
--     MODIFY `shop_provider_id` INTEGER NOT NULL AUTO_INCREMENT,
--     ADD PRIMARY KEY (`shop_provider_id`);

-- -- AlterTable
-- ALTER TABLE `transactions` MODIFY `transactions_id` INTEGER NOT NULL AUTO_INCREMENT;



-- changed

-- CreateIndex
-- CREATE UNIQUE INDEX `User_UUID_key` ON `User`(`UUID`);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `shop_provider_USID_key` ON `shop_provider`(`USID`);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `transactions_transactions_id_key` ON `transactions`(`transactions_id`);




-- -- CreateIndex
-- CREATE UNIQUE INDEX `User_UUID_key` ON `User`(`UUID`);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `shop_provider_USID_key` ON `shop_provider`(`USID`);

-- -- CreateIndex
-- CREATE UNIQUE INDEX `transactions_transactions_id_key` ON `transactions`(`transactions_id`);




-- Create unique index for UUID in User table
CREATE UNIQUE INDEX `User_UUID_key` ON `User`(`UUID`);

-- Create unique index for USID in shop_provider table
CREATE UNIQUE INDEX `shop_provider_USID_key` ON `shop_provider`(`USID`);

-- Create unique index for transactions_id in transactions table
CREATE UNIQUE INDEX `transactions_transactions_id_key` ON `transactions`(`transactions_id`);
