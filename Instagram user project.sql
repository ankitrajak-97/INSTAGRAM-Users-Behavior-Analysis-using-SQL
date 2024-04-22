use ig_clone

select * from comments
select * from follows
select * from likes
select * from photo_tags
select * from photos
select * from tags
select * from users



-- (2). We want to reward the user who has been around the longest, Find the 5 oldest users.

select * from users order by created_at limit 5

-- (3). To target inactive users in an email ad campaign, find the users who have never posted a photo.

select * from users where id not in (select distinct user_id from users u join photos p on u.id=p.user_id)

-- (4). Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?

with 
photo_likes as (select photo_id,count(*)no_of_likes from likes group by photo_id),
max_likes as (select max(no_of_likes) from photo_likes),
photo_max_like as (select  * from photo_likes where no_of_likes = (select * from max_likes)),
user_max_like as (select * from photo_max_like pm join photos p on pm.photo_id=p.id),
user_details as (select photo_id,no_of_likes,u.id,username from user_max_like um join users u on um.user_id=u.id) 
select * from user_details




with 
photo_likes as (select photo_id,count(*)no_of_likes from likes group by photo_id),
photo_max_like as (select  photo_id from photo_likes where no_of_likes = (select max(no_of_likes) from photo_likes)),
user_max_like as (select * from photos where id=(select * from photo_max_like)),
user_details as (select * from users where id=(select user_id from user_max_like))
select * from user_details





with 
photo_p as(select p.user_id,photo_id from likes l join photos p on l.photo_id=p.id),
photo_likes as (select photo_id,count(*)no_of_likes from likes l join photos p on l.photo_id=p.id group by photo_id),
max_likes as (select max(no_of_likes) from photo_likes),
photo_max_like as (select * from photo_likes where no_of_likes=(select * from max_likes)),
id_max_like as (select distinct user_id from photo_p where photo_id=(select photo_id from photo_max_like)),
user_det as (select * from users where id= (select * from id_max_like))
select * from user_det

-- (5). The investors want to know how many times does the average user post.

with user_post as
(select user_id,count(*)no_of_posts from photos group by user_id),
avg_post as ( select avg (no_of_posts) from user_post)
select * from avg_post  

-- (6). A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.

select id,tag_name,count(*)no_of_used from tags t join photo_tags pt on t.id=pt.tag_id group by id,tag_name 
order by no_of_used desc limit 5


-- (7). To find out if there are bots, find users who have liked every single photo on the site.


with 
bot_id as (select user_id,count(*)no_of_likes from likes group by user_id having no_of_likes=
(select count(id) from photos)),
user_bot_details as ( select * from bot_id b join users u on b.user_id=u.id)
select * from user_bot_details


-- (8). Find the users who have created instagramid in may and select top 5 newest joinees from it?

select * from users where month(created_at)=05 order by created_at desc limit 5

-- (9). Can you help me find the users whose name starts with c and ends with any number
-- and have posted the photos as well as liked the photos?

select * from users where username regexp '^c' and username regexp '[0-9]$'
and id in (select id from photos) and id in (select user_id from likes)

-- (10). Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5.

with 
user_photos as 
(select user_id,count(*)no_of_posts from photos group by user_id having no_of_posts between 3 and 5),
user_detail as (select * from users where id in (select user_id from user_photos))
select * from user_detail limit 30



with 
user_photos as 
(select user_id,count(*)no_of_posts from photos group by user_id having no_of_posts between 3 and 5),
user_detail as (select * from user_photos up join users u on up.user_id=u.id)
select * from user_detail limit 30





















