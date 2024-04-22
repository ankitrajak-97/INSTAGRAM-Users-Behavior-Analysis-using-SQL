# INSTAGRAM-Users-Behavior-Analysis-using-SQL

 Loaded SQL data in MYSQL Workbench to extract crucial insights. 
 • Demonstrated SQL expertise by utilizing ER Diagram and Schema Creation, aggregate functions, Joins, and data manipulation for insightful analysis of a dataset.

A .Users Table:
    Fields: id (Primary Key), username (Unique), created_at (Timestamp).
    Stores user information with a unique username and creation timestamp.
B.Photos Table:
    Fields: id (Primary Key), image_url, user_id (Foreign Key), created_at (Timestamp).
    Stores information about user-uploaded photos with image URL, linked to the Users table.
C.Comments Table:
    Fields: id (Primary Key), comment_text, photo_id (Foreign Key), user_id (Foreign Key), created_at (Timestamp).
    Stores user comments on photos, linked to both Users and Photos tables.
D.Likes Table:
    Fields: user_id (Foreign Key), photo_id (Foreign Key), created_at (Timestamp).
    Records likes on photos, with a composite primary key linking Users and Photos tables.
E.Follows Table:
    Fields: follower_id (Foreign Key), followee_id (Foreign Key), created_at (Timestamp).
    Represents user follow relationships, with a composite primary key linking Users table.
F.Tags Table:
    Fields: id (Primary Key), tag_name (Unique), created_at (Timestamp).
    Stores unique tags for categorizing photos.
G.Photo_Tags Table:
    Fields: photo_id (Foreign Key), tag_id (Foreign Key).
    Connects photos with associated tags, forming a composite primary key.
