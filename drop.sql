--ALTER TABLE posts
--DROP CONSTRAINT IF EXISTS posts_owneruserid_fkey,
--DROP CONSTRAINT IF EXISTS posts_lasteditoruserid_fkey;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS badges;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS post_history;
DROP TABLE IF EXISTS post_links;
DROP TABLE IF EXISTS votes;
DROP TABLE IF EXISTS tags;