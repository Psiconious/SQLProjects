spool output_file.txt
  -- this will put a file named output_file.txt in the default directory
  -- for me this is C:\Users\kelly\AppData\Roaming\SQL Developer

spool C:\Users\kelly\data\output.txt
  -- I can specify exactly where I want my output file to go by including a path such as above
  -- The folder must already exists for the file to be written there, otherwise you will get an error SP2-0556: Invalid file name.
  -- You also much have write permission on the location you are attempting to write to

spool C:\Users\kelly\data\output.txt REPLACE
  -- the REPLACE option will replace the contents of an existing file.  If the file does not exist, REPLACE creates the file.  This is the default behavior.

spool C:\Users\kelly\data\output.txt APPEND
  -- the APEND option will add the contents of the buffer to the end of the file you specify

select * from books;
select * from customers;
select * from orders;
select * from author;

spool off;
  -- this stops or turns off spooling

SHOW pagesize;
  -- PAGESIZE is the number of lines to print on a 'page'.  
  -- It's not just the number of rows a query returns as results, but you also count blank lines, column headers, etc.
  -- If PAGESIZE is 14 (the default) and a query returns 15 rows, that will produce more than one page of results.
SET pagesize 250;
  -- You can change the pagesize with the SET command
  -- SET pagesize specifies the number of printable lines per page

SHOW linesize;
  -- LINESIZE is the number of characthers to print on one line of output
  -- Default LINESIZE is 80
SET linesize 120;
  -- You can change the pagesize with the SET command
  -- In Chapter 9 when we perform JOINS to combine the contents of multiple tables, you may see your lines of output wrap around to additional lines

SHOW heading;
  -- HEADING controls whether column headings are displayed when selecing data
  -- Default is ON
SET heading off;
SET heading on;

SHOW colsep;
  -- COLSEP controls the text used to separate coumns of data.  The default is to separate columns using one space.
SET colsep '|';

SHOW numformat;
  --NUMFORMAT sets the default display format for numbers.  There is no default format.
SET numformat 999999999
SET numformat $999,999.99
