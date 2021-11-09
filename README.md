## Bookmark Manager

### User Story
Requirement: Show a list of bookmarks

```
As a user
So I can quickly access my bookmarks
I would like to see a list of all my bookmarks
```

### Domain Model
![Domain model for first user story](media/domain_model.png "Domain model")

### Set up the database

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
