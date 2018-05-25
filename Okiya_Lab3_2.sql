use library;

-- 1
select Name
from borrower
where Card_no not in(select ID_Card from book_loans);

-- 2
select book.Title, borrower.Name, borrower.Address
from book, borrower, book_loans, library_branch
where library_branch.Branch_name = 'Minglanilla' and library_branch.Branch_ID = book_loans.ID_Branch and
book_loans.Due_date = '2018-05-02' and book_loans.ID_Card = borrower.Card_no and book_loans.ID_Book = book.Book_ID;

-- 3
select library_branch.Branch_name, count(*) 
as 'Number of Loaned-Out Books'
from library_branch
inner join book_loans 
on library_branch.Branch_ID = book_loans.ID_Branch
group by library_branch.Branch_name;

-- 4 
select Title, No_of_Copies, Branch_name
from book_copies
inner join library_branch on book_copies.Branch_id_no = library_branch.Branch_ID
inner join book on book_copies.Book_id_no = book.Book_ID
where Title = 'The Little Prince' and Branch_name = 'Talisay'; 

-- 5
select * from book_copies
inner join library_branch on book_copies.Branch_id_no = library_branch.Branch_ID
inner join book on book_copies.Book_id_no = book.Book_ID
where Title = 'The Little Prince';
