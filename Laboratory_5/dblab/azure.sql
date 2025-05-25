
CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name NVARCHAR(100),
    affiliation NVARCHAR(100),
    email NVARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title NVARCHAR(255),
    author_id INT FOREIGN KEY REFERENCES Authors(author_id),
    publication_year INT,
    isbn NVARCHAR(20),
    publisher NVARCHAR(100),
    edition NVARCHAR(50)
);

CREATE TABLE Articles (
    article_id INT PRIMARY KEY,
    title NVARCHAR(255),
    author_id INT FOREIGN KEY REFERENCES Authors(author_id),
    journal_name NVARCHAR(100),
    publication_year INT,
    volume NVARCHAR(20),
    issue NVARCHAR(20),
    doi NVARCHAR(100)
);

INSERT INTO Authors (author_id, author_name, affiliation, email)
VALUES 
    (1, 'John Doe', 'University of Example', 'john.doe@example.com'),
    (2, 'Jane Smith', 'Research Institute', 'jane.smith@example.com');

INSERT INTO Books (book_id, title, author_id, publication_year, isbn, publisher, edition)
VALUES 
    (1, 'Introduction to Database Systems', 1, 2020, '978-0131873254', 'Pearson', '5th'),
    (2, 'Data Science for Beginners', 2, 2021, '978-1718500452', 'O''Reilly Media', '1st');

INSERT INTO Articles (article_id, title, author_id, journal_name, publication_year, volume, issue, doi)
VALUES 
    (1, 'Machine Learning Techniques', 1, 'Journal of AI Research', 2022, '12', '3', '10.1016/j.jair.2022.01.001'),
    (2, 'Quantum Computing Applications', 2, 'Quantum Information Processing', 2023, '8', '1', '10.1007/s11128-023-03994-6');

USE master;
GO
CREATE LOGIN andres WITH PASSWORD = 'Reco123.';
CREATE LOGIN david WITH PASSWORD = 'Reco123.';
GO

USE LibraryDB;
GO
CREATE USER user1 FOR LOGIN andres;
CREATE USER user2 FOR LOGIN david;
GO

ALTER ROLE db_owner ADD MEMBER andres;
ALTER ROLE db_owner ADD MEMBER david;
GO
