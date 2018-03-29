DELIMITER $$

DROP PROCEDURE IF EXISTS App_Contacts_Export $$
CREATE PROCEDURE App_Contacts_Export()
BEGIN
   SELECT id, fname, lname, phone
     FROM ContactList;
END $$




DELIMITER ;
