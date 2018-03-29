-- setup/tables_contacts.sql

SET default_storage_engine=InnoDB;
CREATE TABLE IF NOT EXISTS ContactList
(
   id    INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   fname VARCHAR(32),
   lname VARCHAR(32),
   phone VARCHAR(25)
);
