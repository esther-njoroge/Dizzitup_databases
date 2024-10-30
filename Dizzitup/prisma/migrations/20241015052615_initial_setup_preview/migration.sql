/*
  Warnings:

  - The primary key for the `admin` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `admin_id` on the `admin` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - The primary key for the `buyer` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `buyer_id` on the `buyer` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - The primary key for the `community_manager` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `community_manager_id` on the `community_manager` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.

*/
-- AlterTable
ALTER TABLE `admin` DROP PRIMARY KEY,
    MODIFY `admin_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`admin_id`);

-- AlterTable
ALTER TABLE `buyer` DROP PRIMARY KEY,
    MODIFY `buyer_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`buyer_id`);

-- AlterTable
ALTER TABLE `community_manager` DROP PRIMARY KEY,
    MODIFY `community_manager_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`community_manager_id`);
