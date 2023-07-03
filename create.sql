-- Create tables
CREATE TABLE IF NOT EXISTS users (
    Id INT PRIMARY KEY,
    Reputation INT,
    CreationDate TIMESTAMP,
    DisplayName VARCHAR(255),
    LastAccessDate TIMESTAMP,
    WebsiteUrl VARCHAR(255),
    Location VARCHAR(255),
    AboutMe TEXT,
    Views INT,
    UpVotes INT,
    DownVotes INT,
    AccountId INT
);

CREATE TABLE IF NOT EXISTS badges (
    Id INT PRIMARY KEY,
    UserId INT,
    Name VARCHAR(255),
    Date TIMESTAMP,
    Class INT,
    TagBased BOOLEAN,
    FOREIGN KEY (UserId) REFERENCES users(Id)
);

CREATE TABLE IF NOT EXISTS posts (
    Id INT PRIMARY KEY,
    PostTypeId INT,
    ParentId INT,
    CreationDate TIMESTAMP,
    Score INT,
    ViewCount INT,
    Body TEXT,
    OwnerUserId INT,
    FavoriteCount INT,
    OwnerDisplayName VARCHAR(255),
    ClosedDate TIMESTAMP,
    CommunityOwnedDate TIMESTAMP,
    LastEditorDisplayName VARCHAR(255),
    LastEditorUserId INT,
    LastEditDate TIMESTAMP,
    LastActivityDate TIMESTAMP,
    Title VARCHAR(255),
    Tags VARCHAR(255),
    AnswerCount INT,
    CommentCount INT,
    ContentLicense VARCHAR(255),
    AcceptedAnswerId INT,
    FOREIGN KEY (OwnerUserId) REFERENCES users(Id),
    FOREIGN KEY (LastEditorUserId) REFERENCES users(Id)
);

CREATE TABLE IF NOT EXISTS post_history (
    Id INT PRIMARY KEY,
    PostHistoryTypeId INT,
    PostId INT,
    RevisionGUID VARCHAR(255),
    CreationDate TIMESTAMP,
    Comment TEXT,
    UserDisplayName VARCHAR(255),
    UserId INT,
    Text TEXT,
    ContentLicense VARCHAR(255),
    FOREIGN KEY (PostId) REFERENCES posts(Id),
    FOREIGN KEY (UserId) REFERENCES users(Id)
);

CREATE TABLE IF NOT EXISTS post_links (
    Id INT PRIMARY KEY,
    CreationDate TIMESTAMP,
    PostId INT,
    RelatedPostId INT,
    LinkTypeId INT,
    FOREIGN KEY (PostId) REFERENCES posts(Id),
    FOREIGN KEY (RelatedPostId) REFERENCES posts(Id)
);

CREATE TABLE IF NOT EXISTS votes (
    Id INT PRIMARY KEY,
    PostId INT,
    VoteTypeId INT,
    CreationDate TIMESTAMP,
    FOREIGN KEY (PostId) REFERENCES posts(Id)
);

CREATE TABLE IF NOT EXISTS tags (
    Id INTEGER,
    TagName TEXT,
    Count INTEGER,
    IsRequired BOOLEAN,
    IsModeratorOnly BOOLEAN,
    ExcerptPostId INTEGER,
    WikiPostId INTEGER
);
