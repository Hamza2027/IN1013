
CREATE TABLE petPet(petname VARCHAR(20), PRIMARY KEY (petname), owner VARCHAR(45), species VARCHAR(45), gender CHAR(1), birth DATE, death DATE);

CREATE TABLE petEvent(petname VARCHAR(20), eventdate DATE, eventType VARCHAR(15), remark VARCHAR(255), PRIMARY KEY (petname, eventdate), FOREIGN KEY (petname) REFERENCES petPet (petname));
  
