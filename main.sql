CREATE TABLE contacts (
  id        serial NOT NULL PRIMARY KEY,
  firstname varchar(40) NOT NULL,
  lastname  varchar(40) NOT NULL,
  email     varchar(40) NOT NULL
);

INSERT INTO contacts (firstname, lastname, email) VALUES ('Daniel', 'Susetyo', 'daniel@daniel.com');
INSERT INTO contacts (firstname, lastname, email) VALUES ('Vicki', 'Dancau', 'vicki@vicki.com');
INSERT INTO contacts (firstname, lastname, email) VALUES ('Banana', 'Yellow', 'banana@yellow.com');