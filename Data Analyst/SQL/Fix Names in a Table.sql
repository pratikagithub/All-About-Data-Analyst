--You are given a table named “Names” that contains a column named “Name” which stores the names of individuals. However, the names in this column have some inconsistencies, such as incorrect capitalization or spacing errors. 
--Your task is to fix these issues and update the table with the corrected names.
--To solve this problem, we need to write a script that uses SQL queries to fix the names in the “Name” column. Here our approach should involve string manipulation functions to correct the capitalization and spacing errors.
CREATE TABLE Names (
    Name VARCHAR(100)
);

INSERT INTO Names (Name)
VALUES ('rAVI kUMAR'), ('priya sharma'), ('amit PATEL'), ('NEHA gupta');

select * from names;

--Now here’s how to fix names in a table using SQL:
UPDATE Names
SET Name = CONCAT(
    UPPER(SUBSTRING(Name, 1, 1)),
    LOWER(SUBSTRING(Name, 2, INSTR(Name, ' ') - 2)),
    ' ',
    UPPER(SUBSTRING(Name, INSTR(Name, ' ') + 1, 1)),
    LOWER(SUBSTRING(Name, INSTR(Name, ' ') + 2))
);
        
select * from names;

--Here’s how the above query works:
--1. UPDATE Names: This statement indicates we want to update the “Names” table.
--2. SET Name = CONCAT(…): It specifies that we want to update the “Name” column with the concatenated result of the following expressions.
--3. UPPER(SUBSTRING(Name, 1, 1)): This expression extracts the first character of the name using the SUBSTRING function and converts it to uppercase using the UPPER function. It ensures that the first letter of the first name will be capitalized.
--4. LOWER(SUBSTRING(Name, 2, INSTR(Name, ‘ ‘) – 2)): This expression extracts the portion of the name after the first character and before the space. It uses the SUBSTRING function to achieve this and converts the extracted substring to lowercase using the LOWER function. This step ensures that the remaining characters of the first name are in lowercase.
--5. ‘ ‘: This is a space character that will be added between the first name and last name during the concatenation process.
--6. UPPER(SUBSTRING(Name, INSTR(Name, ‘ ‘) + 1, 1)): This expression extracts the first character of the last name. It uses the SUBSTRING function along with the INSTR function to find the position of the space and then extracts the character following the space. The UPPER function converts the character to uppercase.
--7. LOWER(SUBSTRING(Name, INSTR(Name, ‘ ‘) + 2)): This expression extracts the portion of the name after the first character of the last name. It uses the SUBSTRING function and the INSTR function to find the position of the space and then extracts the substring starting from the second character after the space. The LOWER function converts the extracted substring to lowercase.
--8. Finally, all the above expressions are concatenated together using the CONCAT function, creating the corrected name with the first letter of both the first name and last name capitalized.
  
