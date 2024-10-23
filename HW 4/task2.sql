1. INSERT INTO petEvent (petname, eventdate, eventType, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

2. INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'M', 'M', '2010-10-30', NULL);

INSERT INTO petEvent (petname, eventdate, eventType, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

3. INSERT INTO petEvent (petname, eventdate, eventType, remark)
VALUES ('Fluffy', '2020-10-15', 'birth', 'Fluffy had 5 kittens, 2 males');

4. INSERT INTO petEvent (petname, eventdate, eventType, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'Broke a rib');

5. UPDATE petPet SET death = "2020-09-01" WHERE petname = 'Puffball';

6.DELETE FROM petEvent WHERE petname = 'Buffy';
DELETE FROM petPet WHERE petname = 'Buffy';
