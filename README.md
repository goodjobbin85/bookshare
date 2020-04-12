BookShare Application

Ruby version 2.6.1

An online booksharing application where users can "give a book, take a book". This application is built with Sinatra, using ActiveRecord for database management.  We use the Shotgun server.  This is a simple application where users can sign up, login in, create an account, edit their account, and add books for public use.  This is it's current state. A user only has access to their own account page, as well as the list of all users and list of all books. On the user's homepage their is a form to add books to the site that are meant to be shared.  Books can only be added from a users homepage, in order to maintain the relationship between owner and book.

Future Improvements:

  -add Admin to user. This will be a boolean.  The admin user will be allowed to add books and access to delete users if needed.

  -buttons that will allow user to borrow a book. This may require polymorphism.  When a user borrows a book, it's status will change, thus not allowing other users to check that particular book out, until it's status back to available.  

  -add categories to books, where a user can search books by category

  -add general search functionality for books and users

  -add password confirmation

  -email verification
