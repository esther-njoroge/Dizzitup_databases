/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `user_id` on the `User` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - The primary key for the `shop_provider` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `shop_provider_id` on the `shop_provider` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - You are about to alter the column `transactions_id` on the `transactions` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.

*/
-- AlterTable
ALTER TABLE `User` DROP PRIMARY KEY,
    MODIFY `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`user_id`);

-- AlterTable
ALTER TABLE `shop_provider` DROP PRIMARY KEY,
    MODIFY `shop_provider_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`shop_provider_id`);

-- AlterTable
ALTER TABLE `transactions` MODIFY `transactions_id` INTEGER NOT NULL AUTO_INCREMENT;
