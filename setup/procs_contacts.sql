-- setup/procs_contacts.sql

DELIMITER $$

-- "L" part of L-CRUD
DROP PROCEDURE IF EXISTS App_Contact_List $$
CREATE PROCEDURE App_Contact_List(id INT UNSIGNED)
BEGIN
   SELECT c.id, c.fname, c.lname, c.phone
   FROM ContactList c
   WHERE id IS NULL OR c.id=id;
END $$

-- "C" part of L-CRUD
DROP PROCEDURE IF EXISTS App_Contact_Create $$
CREATE PROCEDURE App_Contact_Create(fname VARCHAR(32),
                                    lname VARCHAR(32),
                                    phone VARCHAR(25))
BEGIN
   DECLARE new_id INT UNSIGNED;

   INSERT
     INTO ContactList (fname, lname, phone)
   VALUES (fname, lname, phone);

   IF ROW_COUNT() > 0 THEN
      SET new_id = LAST_INSERT_ID();
      CALL App_Contact_List(new_id);
   END IF;
END $$

-- "R" part of L-CRUD
DROP PROCEDURE IF EXISTS App_Contact_Value $$
CREATE PROCEDURE App_Contact_Value(id INT UNSIGNED)
BEGIN
   SELECT c.id, c.fname, c.lname, c.phone
     FROM ContactList c
    WHERE c.id = id;
END $$

-- "U" part of L-CRUD
DROP PROCEDURE IF EXISTS App_Contact_Update $$
CREATE PROCEDURE App_Contact_Update(id INT UNSIGNED,
                                    fname VARCHAR(32),
                                    lname VARCHAR(32),
                                    phone VARCHAR(25))
BEGIN
   UPDATE ContactList c
      SET c.fname = fname,
          c.lname = lname,
          c.phone = phone
    WHERE c.id = id;

   IF ROW_COUNT() > 0 THEN
      CALL App_Contact_List(id);
   END IF;
END $$

-- "D" part of L-CRUD
DROP PROCEDURE IF EXISTS App_Contact_Delete $$
CREATE PROCEDURE App_Contact_Delete(id INT UNSIGNED, fname VARCHAR(32))
BEGIN
   DELETE
     FROM c USING ContactList AS c
    WHERE c.id = id and c.fname = fname;

   SELECT ROW_COUNT() AS deleted;
END $$

DELIMITER ;
