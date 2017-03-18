/* Copied from ado-mysql.sql*/
/* File generated automatically by dynamo */
/* Entity types */
CREATE TABLE entity_type (
  /* the entity type identifier */
  `id` INTEGER  AUTO_INCREMENT,
  /* the entity type name (table name) */
  `name` VARCHAR(127) UNIQUE NOT NULL,
  PRIMARY KEY (`id`)
);
/* Sequence generator */
CREATE TABLE sequence (
  /* the sequence name */
  `name` VARCHAR(127) NOT NULL,
  /* the sequence record version */
  `version` int ,
  /* the sequence value */
  `value` BIGINT ,
  /* the sequence block size */
  `block_size` BIGINT ,
  PRIMARY KEY (`name`)
);
INSERT INTO entity_type (name) VALUES
("entity_type")
,("sequence")
;
/* Copied from awa-mysql.sql*/
/* File generated automatically by dynamo */
/*  */
CREATE TABLE awa_message (
  /* the message identifier */
  `id` BIGINT NOT NULL,
  /* the message creation date */
  `create_date` DATETIME NOT NULL,
  /* the message priority */
  `priority` INTEGER NOT NULL,
  /* the message count */
  `count` INTEGER NOT NULL,
  /* the message parameters */
  `parameters` VARCHAR(255) BINARY NOT NULL,
  /* the server identifier which processes the message */
  `server_id` INTEGER NOT NULL,
  /* the task identfier on the server which processes the message */
  `task_id` INTEGER NOT NULL,
  /* the message status */
  `status` TINYINT NOT NULL,
  /* the message processing date */
  `processing_date` DATETIME ,
  /*  */
  `version` INTEGER NOT NULL,
  /* the entity identifier to which this event is associated. */
  `entity_id` BIGINT NOT NULL,
  /* the entity type of the entity identifier to which this event is associated. */
  `entity_type` INTEGER NOT NULL,
  /* the date and time when the event was finished to be processed. */
  `finish_date` DATETIME ,
  /*  */
  `queue_id` BIGINT NOT NULL,
  /* the message type */
  `message_type_id` BIGINT NOT NULL,
  /* the optional user who triggered the event message creation */
  `user_id` BIGINT ,
  /* the optional user session that triggered the message creation */
  `session_id` BIGINT ,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_message_type (
  /*  */
  `id` BIGINT NOT NULL,
  /* the message type name */
  `name` VARCHAR(255) BINARY NOT NULL,
  PRIMARY KEY (`id`)
);
/* The message queue tracks the event messages that must be dispatched by
a given server. */
CREATE TABLE awa_queue (
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `server_id` INTEGER NOT NULL,
  /* the message queue name */
  `name` VARCHAR(255) BINARY NOT NULL,
  PRIMARY KEY (`id`)
);
/* The application that is granted access to the database.
 */
CREATE TABLE awa_application (
  /* the application identifier. */
  `id` BIGINT NOT NULL,
  /* the application name. */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the application secret key. */
  `secret_key` VARCHAR(255) BINARY NOT NULL,
  /* the application public identifier. */
  `client_id` VARCHAR(255) BINARY NOT NULL,
  /* the optimistic lock version. */
  `version` INTEGER NOT NULL,
  /* the application create date. */
  `create_date` DATETIME NOT NULL,
  /* the application update date. */
  `update_date` DATETIME NOT NULL,
  /* the application title displayed in the OAuth login form. */
  `title` VARCHAR(255) BINARY NOT NULL,
  /* the application description. */
  `description` VARCHAR(255) BINARY NOT NULL,
  /* the optional login URL. */
  `app_login_url` VARCHAR(255) BINARY NOT NULL,
  /* the application logo URL. */
  `app_logo_url` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_callback (
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `url` VARCHAR(255) BINARY NOT NULL,
  /* the optimistic lock version. */
  `version` INTEGER NOT NULL,
  /*  */
  `application_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The session is created when the user has granted an access to an application
or when the application has refreshed its access token. */
CREATE TABLE awa_oauth_session (
  /* the session identifier. */
  `id` BIGINT NOT NULL,
  /* the session creation date. */
  `create_date` DATETIME NOT NULL,
  /* a random salt string to access/request token generation. */
  `salt` VARCHAR(255) BINARY NOT NULL,
  /* the expiration date. */
  `expire_date` DATETIME NOT NULL,
  /* the application that is granted access. */
  `application_id` BIGINT NOT NULL,
  /*  */
  `user_id` BIGINT NOT NULL,
  /*  */
  `session_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The ACL table records permissions which are granted for a user to access a given database entity. */
CREATE TABLE awa_acl (
  /* the ACL identifier */
  `id` BIGINT NOT NULL,
  /* the entity identifier to which the ACL applies */
  `entity_id` BIGINT NOT NULL,
  /* the writeable flag */
  `writeable` TINYINT NOT NULL,
  /*  */
  `user_id` BIGINT NOT NULL,
  /* the entity type concerned by the ACL. */
  `entity_type` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_access_key (
  /* the secure access key. */
  `access_key` VARCHAR(255) BINARY NOT NULL,
  /* the access key expiration date. */
  `expire_date` DATE NOT NULL,
  /* the access key identifier. */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /*  */
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The Email entity defines the user email addresses.
The user has a primary email address that is obtained
from the registration process (either through a form
submission or through OpenID authentication). */
CREATE TABLE awa_email (
  /* the email address. */
  `email` VARCHAR(255) BINARY NOT NULL,
  /* the last mail delivery status (if known). */
  `status` TINYINT NOT NULL,
  /* the date when the last email error was detected. */
  `last_error_date` DATETIME NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the email primary key. */
  `id` BIGINT NOT NULL,
  /* the user. */
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_session (
  /*  */
  `start_date` DATETIME NOT NULL,
  /*  */
  `end_date` DATETIME ,
  /*  */
  `ip_address` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `stype` TINYINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /*  */
  `server_id` INTEGER NOT NULL,
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `auth_id` BIGINT ,
  /*  */
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The User entity represents a user that can access and use the application.
 */
CREATE TABLE awa_user (
  /* the user first name. */
  `first_name` VARCHAR(255) BINARY NOT NULL,
  /* the user last name. */
  `last_name` VARCHAR(255) BINARY NOT NULL,
  /* the user password hash. */
  `password` VARCHAR(255) BINARY NOT NULL,
  /* the user OpenID identifier. */
  `open_id` VARCHAR(255) BINARY NOT NULL,
  /* the user country. */
  `country` VARCHAR(255) BINARY NOT NULL,
  /* the user display name. */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* version number. */
  `version` INTEGER NOT NULL,
  /* the user identifier. */
  `id` BIGINT NOT NULL,
  /* the password salt. */
  `salt` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `email_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_message")
,("awa_message_type")
,("awa_queue")
,("awa_application")
,("awa_callback")
,("awa_oauth_session")
,("awa_acl")
,("awa_access_key")
,("awa_email")
,("awa_session")
,("awa_user")
;
/* Copied from awa-workspaces-mysql.sql*/
/* File generated automatically by dynamo */
/*  */
CREATE TABLE awa_invitation (
  /* the invitation identifier. */
  `id` BIGINT NOT NULL,
  /* version optimistic lock. */
  `version` INTEGER NOT NULL,
  /* date when the invitation was created and sent. */
  `create_date` DATETIME NOT NULL,
  /* the email address to which the invitation was sent. */
  `email` VARCHAR(255) BINARY NOT NULL,
  /* the invitation message. */
  `message` text NOT NULL,
  /* the date when the invitation was accepted. */
  `acceptance_date` DATETIME ,
  /* the workspace where the user is invited. */
  `workspace_id` BIGINT NOT NULL,
  /*  */
  `access_key_id` BIGINT ,
  /* the user being invited. */
  `invitee_id` BIGINT ,
  /*  */
  `inviter_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The workspace controls the features available in the application
for a set of users: the workspace members.  A user could create
several workspaces and be part of several workspaces that other
users have created. */
CREATE TABLE awa_workspace (
  /* the workspace identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /*  */
  `create_date` DATETIME NOT NULL,
  /*  */
  `owner_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_workspace_feature (
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `limit` INTEGER NOT NULL,
  /*  */
  `workspace_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The workspace member indicates the users who
are part of the workspace. */
CREATE TABLE awa_workspace_member (
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `member_id` BIGINT NOT NULL,
  /*  */
  `workspace_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_invitation")
,("awa_workspace")
,("awa_workspace_feature")
,("awa_workspace_member")
;
/* Copied from awa-tags-mysql.sql*/
/* File generated automatically by dynamo */
/* The tag definition. */
CREATE TABLE awa_tag (
  /* the tag identifier */
  `id` BIGINT NOT NULL,
  /* the tag name */
  `name` VARCHAR(255) BINARY NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_tagged_entity (
  /* the tag entity identifier */
  `id` BIGINT NOT NULL,
  /* Title: Tag model
Date: 2013-02-23the database entity to which the tag is associated */
  `for_entity_id` BIGINT NOT NULL,
  /* the entity type */
  `entity_type` INTEGER NOT NULL,
  /*  */
  `tag_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_tag")
,("awa_tagged_entity")
;
/* Copied from awa-comments-mysql.sql*/
/* File generated automatically by dynamo */
/* The Comment table records a user comment associated with a database entity.
The comment can be associated with any other database record. */
CREATE TABLE awa_comment (
  /* the comment publication date */
  `create_date` DATETIME NOT NULL,
  /* the comment message. */
  `message` TEXT NOT NULL,
  /* the entity identifier to which this comment is associated */
  `entity_id` BIGINT NOT NULL,
  /* the comment identifier */
  `id` BIGINT NOT NULL,
  /* the optimistic lock version. */
  `version` INTEGER NOT NULL,
  /* the entity type that identifies the table to which the comment is associated. */
  `entity_type` INTEGER NOT NULL,
  /* the comment status to decide whether the comment is visible (published) or not. */
  `status` integer NOT NULL,
  /* the comment format type. */
  `format` integer NOT NULL,
  /*  */
  `author_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_comment")
;
/* Copied from awa_counters-mysql.sql*/
/* File generated automatically by dynamo */
/*  */
CREATE TABLE awa_counter (
  /* the object associated with the counter. */
  `object_id` BIGINT NOT NULL,
  /* the day associated with the counter. */
  `date` DATE NOT NULL,
  /* the counter value. */
  `counter` INTEGER NOT NULL,
  /* the counter definition identifier. */
  `definition_id` BIGINT NOT NULL,
  PRIMARY KEY (`object_id`, `date`, `definition_id`)
);
/* A counter definition defines what the counter represents. It uniquely identifies
the counter for the Counter table. A counter may be associated with a database
table. In that case, the counter definition has a relation to the corresponding Entity_Type. */
CREATE TABLE awa_counter_definition (
  /* the counter name. */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the counter unique id. */
  `id` INTEGER NOT NULL,
  /* the optional entity type that identifies the database table. */
  `entity_type` INTEGER ,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_visit (
  /* the entity identifier. */
  `object_id` BIGINT NOT NULL,
  /* the number of times the entity was visited by the user. */
  `counter` INTEGER NOT NULL,
  /* the date and time when the entity was last visited. */
  `date` DATETIME NOT NULL,
  /* the user who visited the entity. */
  `user` BIGINT NOT NULL,
  /* the counter definition identifier. */
  `definition_id` BIGINT NOT NULL,
  PRIMARY KEY (`object_id`, `user`, `definition_id`)
);
INSERT INTO entity_type (name) VALUES
("awa_counter")
,("awa_counter_definition")
,("awa_visit")
;
/* Copied from awa-blogs-mysql.sql*/
/* File generated automatically by dynamo */
/*  */
CREATE TABLE awa_blog (
  /* the blog identifier */
  `id` BIGINT NOT NULL,
  /* the blog name */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the version */
  `version` INTEGER NOT NULL,
  /* the blog uuid */
  `uid` VARCHAR(255) BINARY NOT NULL,
  /* the blog creation date */
  `create_date` DATETIME NOT NULL,
  /* the date when the blog was updated */
  `update_date` DATETIME NOT NULL,
  /* The blog base URL. */
  `url` VARCHAR(255) BINARY NOT NULL,
  /* the workspace that this blog belongs to */
  `workspace_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_post (
  /* the post identifier */
  `id` BIGINT NOT NULL,
  /* the post title */
  `title` VARCHAR(255) BINARY NOT NULL,
  /* the post text content */
  `text` TEXT NOT NULL,
  /* the post creation date */
  `create_date` DATETIME NOT NULL,
  /* the post URI */
  `uri` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the post publication date */
  `publish_date` DATETIME ,
  /* the post status */
  `status` TINYINT NOT NULL,
  /*  */
  `allow_comments` TINYINT NOT NULL,
  /* the number of times the post was read. */
  `read_count` INTEGER NOT NULL,
  /*  */
  `author_id` BIGINT NOT NULL,
  /*  */
  `blog_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_blog")
,("awa_post")
;
/* Copied from awa-storages-mysql.sql*/
/* File generated automatically by dynamo */
/* The uri member holds the URI if the storage type is URL.

When storage is FILE, the local file path is built by using
the workspace identifier and the storage identifier. */
CREATE TABLE awa_storage (
  /* the storage type which defines where the content is stored */
  `storage` TINYINT NOT NULL,
  /* the storage creation date */
  `create_date` DATETIME NOT NULL,
  /* the file name */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the file size */
  `file_size` INTEGER NOT NULL,
  /* the mime type */
  `mime_type` VARCHAR(255) BINARY NOT NULL,
  /* the storage URI */
  `uri` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the storage identifier */
  `id` BIGINT NOT NULL,
  /* whether the document is public or not. */
  `is_public` TINYINT NOT NULL,
  /*  */
  `original_id` BIGINT ,
  /*  */
  `store_data_id` BIGINT ,
  /*  */
  `owner_id` BIGINT NOT NULL,
  /*  */
  `workspace_id` BIGINT NOT NULL,
  /*  */
  `folder_id` BIGINT ,
  PRIMARY KEY (`id`)
);
/* The storage data is created only if the storage type
is set to DATABASE.  It holds the file content in the blob. */
CREATE TABLE awa_storage_data (
  /* the storage data identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the storage content */
  `data` LONGBLOB NOT NULL,
  PRIMARY KEY (`id`)
);
/*  */
CREATE TABLE awa_storage_folder (
  /* the storage folder identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the folder creation date */
  `create_date` DATETIME NOT NULL,
  /*  */
  `name` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `workspace_id` BIGINT NOT NULL,
  /*  */
  `owner_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The local store record is created when a copy of the data is needed on the local file system.
The creation date refers to the date when the data was copied to the local file system.
The expiration date indicates a date after which the local file can be removed
from the local file system. */
CREATE TABLE awa_store_local (
  /* the local store identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /*  */
  `store_version` INTEGER NOT NULL,
  /* the shared flag which indicates whether this local store can be shared by several clients. */
  `shared` TINYINT NOT NULL,
  /* the local store path */
  `path` VARCHAR(255) BINARY NOT NULL,
  /* the local store expiration date */
  `expire_date` DATE NOT NULL,
  /* the creation date */
  `create_date` DATETIME NOT NULL,
  /*  */
  `storage_id` BIGINT ,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_storage")
,("awa_storage_data")
,("awa_storage_folder")
,("awa_store_local")
;
/* Copied from awa-jobs-mysql.sql*/
/* File generated automatically by dynamo */
/* The job is associated with a dispatching queue. */
CREATE TABLE awa_job (
  /* the job identifier */
  `id` BIGINT NOT NULL,
  /* the job status */
  `status` TINYINT NOT NULL,
  /* the job name */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the job start date */
  `start_date` DATETIME ,
  /* the job creation date */
  `create_date` DATETIME NOT NULL,
  /* the job finish date */
  `finish_date` DATETIME ,
  /* the job progress indicator */
  `progress` INTEGER NOT NULL,
  /* the job parameters */
  `parameters` TEXT NOT NULL,
  /* the job result */
  `results` TEXT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the job priority */
  `priority` INTEGER NOT NULL,
  /*  */
  `user_id` BIGINT ,
  /*  */
  `event_id` BIGINT ,
  /*  */
  `session_id` BIGINT ,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_job")
;
/* Copied from awa-images-mysql.sql*/
/* File generated automatically by dynamo */
/* - The workspace contains one or several folders.
- Each image folder contains a set of images that have been uploaded by the user.
- An image can be visible if a user has an ACL permission to read the associated folder.
- An image marked as 'public=True' can be visible by anybody
 */
CREATE TABLE awa_image (
  /* the image identifier */
  `id` BIGINT NOT NULL,
  /* the image width */
  `width` INTEGER NOT NULL,
  /* the image height */
  `height` INTEGER NOT NULL,
  /* the thumbnail width */
  `thumb_width` INTEGER NOT NULL,
  /* the thumbnail height */
  `thumb_height` INTEGER NOT NULL,
  /*  */
  `path` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `public` TINYINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /*  */
  `thumbnail_id` BIGINT ,
  /*  */
  `folder_id` BIGINT NOT NULL,
  /*  */
  `owner_id` BIGINT NOT NULL,
  /*  */
  `storage_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_image")
;
/* Copied from awa-questions-mysql.sql*/
/* File generated automatically by dynamo */
/* The answer table gives a list of anwsers to the question.
Ranking is updating according to users voting for the anwser.
 */
CREATE TABLE awa_answer (
  /* the answer creation date. */
  `create_date` DATETIME NOT NULL,
  /* the date when the answer was edited. */
  `edit_date` DATETIME ,
  /* the answer text. */
  `answer` TEXT NOT NULL,
  /* the anwser rank number. */
  `rank` INTEGER NOT NULL,
  /* the answer identifier. */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the user who wrote the answer. */
  `author_id` BIGINT NOT NULL,
  /*  */
  `question_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The question table holds a single question asked by a user to the community.
The short description is used to give an overview of the question in long lists
while the description contains the full question text.  The rating is updating
according to users voting for the question. */
CREATE TABLE awa_question (
  /* the date when the question was created. */
  `create_date` DATETIME NOT NULL,
  /* the question title. */
  `title` VARCHAR(255) BINARY NOT NULL,
  /* the full description. */
  `description` TEXT NOT NULL,
  /* the date when the question was edited. */
  `edit_date` DATETIME ,
  /* Title: Questions and Answers model
Date: 2015-11-15
the question short description. */
  `short_description` VARCHAR(255) BINARY NOT NULL,
  /* the question rating. */
  `rating` INTEGER NOT NULL,
  /* the question identifier. */
  `id` BIGINT NOT NULL,
  /* the optimistic locking version. */
  `version` INTEGER NOT NULL,
  /* the user who asked the question. */
  `author_id` BIGINT NOT NULL,
  /*  */
  `workspace_id` BIGINT NOT NULL,
  /*  */
  `accepted_answer_id` BIGINT ,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_answer")
,("awa_question")
;
/* Copied from awa-votes-mysql.sql*/
/* File generated automatically by dynamo */
/*  */
CREATE TABLE awa_rating (
  /* the rating identifier */
  `id` BIGINT NOT NULL,
  /* the rating taking into account all votes */
  `rating` INTEGER NOT NULL,
  /* the number of votes */
  `vote_count` INTEGER NOT NULL,
  /*  */
  `for_entity_id` BIGINT NOT NULL,
  /* the entity type */
  `for_entity_type` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);
/* The vote table tracks a vote action by a user on a given database entity.
The primary key is made of the user, the entity id and entity type.
 */
CREATE TABLE awa_vote (
  /*  */
  `rating` INTEGER NOT NULL,
  /*  */
  `entity_id` BIGINT NOT NULL,
  /*  */
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`entity_id`, `user_id`)
);
INSERT INTO entity_type (name) VALUES
("awa_rating")
,("awa_vote")
;
/* Copied from awa-wikis-mysql.sql*/
/* File generated automatically by dynamo */
/*  */
CREATE TABLE awa_wiki_content (
  /* the wiki page content identifier */
  `id` BIGINT NOT NULL,
  /* the wiki content creation date */
  `create_date` DATETIME NOT NULL,
  /* the wiki text content */
  `content` TEXT NOT NULL,
  /* the format type used used by the wiki content */
  `format` TINYINT NOT NULL,
  /* the content comment string */
  `save_comment` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the wiki page version */
  `page_version` INTEGER NOT NULL,
  /* the wiki page that this Wiki_Content belongs to */
  `page_id` BIGINT NOT NULL,
  /* the page version author */
  `author_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* The wiki page represents a page with its versions.
It refers to the last version which is currently visible.
It has an optional preview image which defines
the thumbnail preview of the last/current wiki content. */
CREATE TABLE awa_wiki_page (
  /* the wiki page identifier */
  `id` BIGINT NOT NULL,
  /* the wiki page name */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* the last page version number */
  `last_version` INTEGER NOT NULL,
  /* whether the wiki page is public */
  `is_public` TINYINT NOT NULL,
  /* the page title */
  `title` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* a read counter which indicates how many times the page was read. */
  `read_count` INTEGER NOT NULL,
  /* the wiki page preview. */
  `preview_id` BIGINT ,
  /* the wiki space that this page belongs to */
  `wiki_id` BIGINT NOT NULL,
  /* the current content (or last version) */
  `content_id` BIGINT ,
  PRIMARY KEY (`id`)
);
/* Permission is granted to display a wiki page if there is
an ACL entry between the wiki space and the user. */
CREATE TABLE awa_wiki_space (
  /* the wiki space identifier */
  `id` BIGINT NOT NULL,
  /* the wiki name */
  `name` VARCHAR(255) BINARY NOT NULL,
  /* whether the wiki is public */
  `is_public` TINYINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the wiki creation date. */
  `create_date` DATETIME NOT NULL,
  /* the left panel side wiki text for every page. */
  `left_side` TEXT NOT NULL,
  /* the right panel wiki text for every page.
 */
  `right_side` TEXT NOT NULL,
  /* the default wiki page format. */
  `format` TINYINT NOT NULL,
  /*  */
  `workspace_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("awa_wiki_content")
,("awa_wiki_page")
,("awa_wiki_space")
;
/* Copied from atlas-mysql.sql*/
/* File generated automatically by dynamo */
/* The Mblog table holds the message posted by users.
Once posted, the message is not supposed to be changed. */
CREATE TABLE mblog (
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the microblog message */
  `message` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `creation_date` DATETIME NOT NULL,
  /* the post author */
  `author_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* the table that contains the reviews made by users. */
CREATE TABLE atlas_review (
  /* the review identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the review title. */
  `title` VARCHAR(255) BINARY NOT NULL,
  /* the review description */
  `text` TEXT NOT NULL,
  /* the review creation date. */
  `create_date` DATETIME NOT NULL,
  /* whether comments are allowed. */
  `allow_comments` INTEGER NOT NULL,
  /* the site, article or application being reviewed. */
  `site` VARCHAR(255) BINARY NOT NULL,
  /*  */
  `reviewer_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO entity_type (name) VALUES
("mblog")
,("atlas_review")
;
/* Copied from atlas-init-mysql.sql*/
INSERT INTO `awa_workspace` VALUES (1,1,'2012-05-22 19:54:36',1),(101,1,'2012-05-22 20:39:15',101),(102,1,'2012-05-23 18:24:42',102),(103,1,'2012-05-25 12:29:01',104),(104,1,'2012-05-25 12:46:46',105),(105,1,'2012-05-25 18:34:40',106),(106,1,'2012-05-26 05:47:00',107),(107,1,'2012-05-30 17:14:10',108),(108,1,'2012-06-10 02:43:17',109),(109,1,'2012-06-13 18:37:14',110),(110,1,'2012-06-15 10:15:54',111),(111,1,'2012-06-21 10:58:46',112),(112,1,'2012-06-21 18:25:05',113),(113,1,'2012-06-29 01:18:09',114),(201,1,'2012-07-29 21:28:28',201),(202,1,'2012-07-31 22:19:14',202),(301,1,'2012-08-14 06:56:59',301),(302,1,'2012-08-17 12:04:08',303),(303,1,'2012-08-23 05:06:09',304),(304,1,'2012-08-26 18:44:36',305),(305,1,'2012-09-03 18:31:22',306),(306,1,'2012-10-18 19:02:37',307),(307,1,'2012-11-04 17:01:40',309),(308,1,'2012-12-29 06:07:25',310),(401,1,'2013-02-06 22:54:16',401),(501,1,'2013-02-12 21:27:54',501),(601,1,'2013-02-21 16:20:23',601),(602,1,'2013-04-24 12:22:43',602),(603,1,'2013-06-09 07:58:50',603),(604,1,'2013-06-09 10:49:14',604),(605,1,'2013-06-23 00:01:59',605),(701,1,'2013-07-22 18:24:53',701),(801,1,'2013-09-23 17:09:26',802),(802,1,'2013-09-24 13:58:10',803),(901,1,'2014-01-05 18:33:51',901),(1001,1,'2014-02-20 02:44:06',1001),(1002,1,'2014-03-06 06:50:21',1002),(1101,1,'2014-05-31 12:47:07',1101),(1201,1,'2014-05-31 12:59:33',1201),(1202,1,'2014-05-31 13:02:25',1202),(1301,1,'2014-11-11 17:41:10',1310),(1401,1,'2015-10-15 10:17:07',1601),(1402,1,'2015-11-28 11:40:57',1602),(1501,1,'2016-05-28 20:49:33',1801),(1601,1,'2016-08-31 19:36:34',1901);
INSERT INTO `awa_tag` VALUES (1,'demo'),(2,'release'),(3,'Ada'),(101,'releasse'),(201,'Atlas'),(202,'Demo'),(203,'Installation'),(301,'syntax'),(302,'MediaWiki'),(401,'Images'),(402,'AWA'),(501,'Wiki');
INSERT INTO `awa_tagged_entity` VALUES (1,1,14,1),(2,2,14,2),(3,2,14,3),(4,101,14,2),(5,101,14,3),(6,401,14,2),(7,401,14,3),(8,101,27,3),(101,701,14,3),(102,701,14,101),(201,1,32,201),(202,1,32,202),(203,1,32,203),(204,2,32,201),(301,101,32,301),(302,101,32,302),(401,101,32,401),(402,2,32,402),(501,801,14,3),(502,801,14,402),(503,801,14,201),(504,801,14,501);
INSERT INTO `awa_wiki_content` VALUES (1,'2015-12-21 20:19:19','This page explains how you can install the Atlas demonstrator.

== Configure ==

',0,'',1,1,1,1201),(2,'2015-12-21 20:55:13','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

== Atlas configure ==

== Atlas build ==

== Atlas database setup ==

',0,'',1,2,1,1201),(3,'2015-12-21 20:57:18','Atlas is an online application that provides a blogging system, a question & answer area and a document storage space. It shows the different plugins and features provided by the Ada Web Application framework.
',0,'',1,1,2,1201),(101,'2016-04-03 18:27:01','
[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

== Headers ==

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,1,101,1201),(102,'2016-04-03 18:31:07','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==


== Headers ==

Section headers are supported up to 6 levels.

  = Header 1 =
  == Header 2 ==
  === Header 3 ===
  ==== Header 4 ====
  ===== Header 5 =====
  ====== Header 6 ======

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,2,101,1201),(103,'2016-04-03 18:31:24','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,3,101,1201),(104,'2016-04-03 18:32:33','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content _\_TOC_\_ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,4,101,1201),(105,'2016-04-03 18:33:30','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content _~_TOC_~_ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,5,101,1201),(106,'2016-04-03 18:33:42','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC__ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,6,101,1201),(107,'2016-04-03 18:33:55','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,7,101,1201),(201,'2016-04-03 19:33:28','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

Bold

== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

== Links ==

== Images ==
',4,'',1,8,101,1201),(202,'2016-04-04 19:36:01','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

Bold italic


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

== Links ==

== Images ==

',4,'',1,9,101,1201),(203,'2016-04-04 19:43:27','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

Bold italic


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

',4,'',1,10,101,1201),(204,'2016-04-04 19:46:54','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

Bold italic


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

',4,'',1,11,101,1201),(205,'2016-04-04 19:52:32','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

Bold italic


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the {{{''''nnn''''}}} form.

',4,'',1,12,101,1201),(206,'2016-04-04 19:53:14','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

Bold italic


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,13,101,1201),(207,'2016-04-13 19:34:41','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* Bold: <pre>''''''bold item''''''</pre> ''''''bold item''''''
* Italic


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,14,101,1201),(208,'2016-04-13 19:36:05','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* Bold: <pre>''''''bold item''''''</pre> ''''''bold item''''''
* Italic: <pre>''''Italic item''''</pre> ''''italic item''''
* Bold+Italic: <pre>''''''''''bold+italic item''''''''''</pre> ''''''''''bold+italic item''''''''''


== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,15,101,1201),(209,'2016-04-13 19:38:57','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* ''''''Bold:'''''' <pre>''''''bold item''''''</pre>
* ''''Italic:'''' <pre>''''Italic item''''</pre>
* ''''''''''Bold+Italic:'''''''''' <pre>''''''''''bold+italic item''''''''''</pre>

For other text styles, you can use inline HTML:

* <s>Strike</s>: <pre><s>Strike</s></pre>

== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,16,101,1201),(210,'2016-04-13 19:39:44','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* ''''''Bold:'''''' <pre>''''''bold item''''''</pre>
* ''''Italic:'''' <pre>''''Italic item''''</pre>
* ''''''''''Bold+Italic:'''''''''' <pre>''''''''''bold+italic item''''''''''</pre>

For other text styles, you can use inline HTML:

* <s>Strike</s>: <pre>&lt;s>Strike</s></pre>

== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,17,101,1201),(211,'2016-04-13 19:40:05','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* ''''''Bold:'''''' <pre>''''''bold item''''''</pre>
* ''''Italic:'''' <pre>''''Italic item''''</pre>
* ''''''''''Bold+Italic:'''''''''' <pre>''''''''''bold+italic item''''''''''</pre>

For other text styles, you can use inline HTML:

* <s>Strike</s>: <pre>&lt;s>Strike&lt;/s></pre>

== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,18,101,1201),(212,'2016-04-13 19:42:41','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* ''''''Bold:'''''' <pre>''''''bold item''''''</pre>
* ''''Italic:'''' <pre>''''Italic item''''</pre>
* ''''''''''Bold+Italic:'''''''''' <pre>''''''''''bold+italic item''''''''''</pre>

For other text styles, you can use inline HTML:

* <s>Strike</s>: <pre>&lt;s>Strike&lt;/s></pre>
* <u>Underline</u>: <pre>&lt;u>Underline&lt;/u></pre>
* <ins>Inserted</ins>: <pre>&lt;ins>Inserted&lt;/ins></pre>
* <del>Deleted</del>: <pre>&lt;del>Deleted&lt;/del></pre>

== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,19,101,1201),(213,'2016-04-13 19:47:31','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* ''''''Bold:'''''' <pre>''''''bold item''''''</pre>
* ''''Italic:'''' <pre>''''Italic item''''</pre>
* ''''''''''Bold+Italic:'''''''''' <pre>''''''''''bold+italic item''''''''''</pre>

For other text styles, you can use inline HTML:

* <s>Strike</s>: <pre>&lt;s>Strike&lt;/s></pre>
* <u>Underline</u>: <pre>&lt;u>Underline&lt;/u></pre>
* <ins>Inserted</ins>: <pre>&lt;ins>Inserted&lt;/ins></pre>
* <del>Deleted</del>: <pre>&lt;del>Deleted&lt;/del></pre>

== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

Definition lists use the '''';'''' as first character of a line:

<pre>
;item 1
:definition 1
;item 2
:definition 2
</pre>

Example:

;item 1
:definition 1
;item 2
:definition 2
== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'',1,20,101,1201),(301,'2016-04-17 07:29:22','[[https://www.mediawiki.org/wiki/Help:Formatting/en]]

== Style ==

The wiki supports several text styles:

* ''''''Bold:'''''' <pre>''''''bold item''''''</pre>
* ''''Italic:'''' <pre>''''Italic item''''</pre>
* ''''''''''Bold+Italic:'''''''''' <pre>''''''''''bold+italic item''''''''''</pre>

For other text styles, you can use inline HTML:

* <s>Strike</s>: <pre>&lt;s>Strike&lt;/s></pre>
* <u>Underline</u>: <pre>&lt;u>Underline&lt;/u></pre>
* <ins>Inserted</ins>: <pre>&lt;ins>Inserted&lt;/ins></pre>
* <del>Deleted</del>: <pre>&lt;del>Deleted&lt;/del></pre>

== Headers ==

Section headers are supported up to 6 levels.

<pre>
= Header 1 =
== Header 2 ==
=== Header 3 ===
==== Header 4 ====
===== Header 5 =====
====== Header 6 ======
</pre>

The table of content __TOC_ _ is generated and inserted when there are more than 3 headers.

== Paragraphs ==

A new paragraph is started after a new section header, after a pre-formatted item, after definition list
or when an empty line is found,

<pre>
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
</pre>

Example:

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

== Lists ==

Bullet lists are introduced by a ''''*'''' at beginning of a line:

<pre>
* item 1
* item 2
</pre>
Example:

* item 1
* item 2

Numbered list use the ''''#'''' character:

<pre>
# item 1
# item 2
</pre>

Example:
# item 1
# item 2

Definition lists use the '''';'''' as first character of a line:

<pre>
;item 1
:definition 1
;item 2
:definition 2
</pre>

Example:

;item 1
:definition 1
;item 2
:definition 2
== Links ==

The Wiki engine supports auto linking when the [[AutoLink]] filter is used.
Links to a wiki page have the form:

<pre>
[[Link URL|Link label]]
</pre>

== Images ==

An image is a special link whose URL is prefixed by ''''''Image:''''''

<pre>
[[Image:Images/Ada.png|Ada picture]]
</pre>

Exemple:

[[Image:Images/Ada.png|Ada picture]]


== Templates ==

The MediaWiki templates are supported.  The template is a special page which has the fixed prefix ''''''Template:'''''' in its name.
The template has parameters which are replaced when the template is used.  The template inclusion is made by
using the following form:

<pre>
{{MyTemplate|param1|param2}}
</pre>

Within the template, each parameter is replaced by using the ~{~{~{''''nnn''''}}} form.

',4,'Describe image links',1,21,101,1201),(302,'2016-04-17 07:44:56','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

== Atlas configure ==

== Atlas build ==

<pre>
make
</pre>

== Atlas database setup ==

',4,'Add the build command',1,3,1,1201),(303,'2016-04-19 15:22:34','Atlas is an online application that provides a blogging system, a question & answer area and a document storage space. It shows the different plugins and features provided by the [[Ada Web Application]] framework.

The goal of Atlas is to show you some interesting features provided by [https://github.com/stcarrez/ada-awa|[Ada Web Application]] so that you can try them, look at their implementation and learn how you may use and extend [https://github.com/stcarrez/ada-awa|[Ada Web Application]] for your own needs.
',4,'Small note about Atlas''s goal',1,2,2,1201),(304,'2016-04-19 15:23:09','Atlas is an online application that provides a blogging system, a question & answer area and a document storage space. It shows the different plugins and features provided by the [[Ada Web Application]] framework.

The goal of Atlas is to show you some interesting features provided by [https://github.com/stcarrez/ada-awa|Ada Web Application] so that you can try them, look at their implementation and learn how you may use and extend [https://github.com/stcarrez/ada-awa|Ada Web Application] for your own needs.
',4,'Small note about Atlas''s goal',1,3,2,1201),(305,'2016-04-19 15:25:18','Atlas is an online application that provides a blogging system, a question & answer area and a document storage space. It shows the different plugins and features provided by the [https://github.com/stcarrez/ada-awa Ada Web Application] framework.

The goal of Atlas is to show you some interesting features provided by [https://github.com/stcarrez/ada-awa Ada Web Application] so that you can try them, look at their implementation and learn how you may use and extend [https://github.com/stcarrez/ada-awa  Ada Web Application] for your own needs.
',4,'Small note about Atlas''s goal',1,4,2,1201),(306,'2016-04-19 21:03:52','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

After the installation of GNAT, XML/Ada and AWS, the best solution to build the AWA framework is by
using the git repositories.  To check out all the sources and the related components, then configure and
build, you can use the following commands:

<pre>
git clone git@github.com:stcarrez/ada-awa.git ada-awa
cd ada-awa
./configure --with-git --enable-ahven
make
</pre>

== Atlas configure ==

== Atlas build ==

<pre>
make
</pre>

== Atlas database setup ==

',4,'Add the build command',1,4,1,1201),(307,'2016-04-19 21:14:48','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.  You may use the GNU Ada compiler or the GNAT GPL or GNAT Pro Ada Core
compilers.

=== GNAT GPL or GNAT Pro ===

# Go to http://libre.adacore.com/download/configurations
# Select the package gnat-gpl-2015-~[select_your_architecture~]-linux-bin.tar.gz
# Set bundle format to tar.
# Download the archive.
# At the terminal, cd to the folder where you downloaded the archive.
# Execute the following "as root":

<pre>
# tar -xvf AdaCore-Download-[whatever_the_date].tar
# cd x86-linux/adagpl-2015/gnatgpl
# tar -zxvf gnat-gpl-2015-x86-linux-bin.tar.gz
# cd gnat-gpl-2015-x86-linux-bin
# ./doinstall
</pre>

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

After the installation of GNAT, XML/Ada and AWS, the best solution to build the AWA framework is by
using the git repositories.  To check out all the sources and the related components, then configure and
build, you can use the following commands:

<pre>
git clone git@github.com:stcarrez/ada-awa.git ada-awa
cd ada-awa
./configure --with-git --enable-ahven
make
</pre>

== Atlas configure ==

== Atlas build ==

<pre>
make
</pre>

== Atlas database setup ==

',4,'Add the build command',1,5,1,1201),(308,'2016-04-20 19:18:55','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.  You may use the GNU Ada compiler or the GNAT GPL or GNAT Pro Ada Core
compilers.

=== GNAT GPL or GNAT Pro ===

# Go to http://libre.adacore.com/download/configurations
# Select the package gnat-gpl-2015-~[select_your_architecture~]-linux-bin.tar.gz
# Set bundle format to tar.
# Download the archive.
# At the terminal, cd to the folder where you downloaded the archive.
# Execute the following "as root":

<pre>
# tar -xvf AdaCore-Download-[whatever_the_date].tar
# cd x86-linux/adagpl-2015/gnatgpl
# tar -zxvf gnat-gpl-2015-x86-linux-bin.tar.gz
# cd gnat-gpl-2015-x86-linux-bin
# ./doinstall
</pre>

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

After the installation of GNAT, XML/Ada and AWS, the best solution to build the AWA framework is by
using the git repositories.  To check out all the sources and the related components, then configure and
build, you can use the following commands:

<pre>
git clone git@github.com:stcarrez/ada-awa.git ada-awa
cd ada-awa
./configure --with-git --enable-ahven --prefix=/usr/local
</pre>

You may change the ''''''--prefix=/usr/local'''''' according to your installation.  This is the directory where the AWA
libraries and components will be installed.  After the configure step, you should build everything with:

  make

After all the AWA components are built, you should install them with the following command:

  make install

== Atlas configure ==

== Atlas build ==

<pre>
make
</pre>

== Atlas database setup ==

',4,'Add the build command',1,6,1,1201),(309,'2016-04-20 19:21:58','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.  You may use the GNU Ada compiler or the GNAT GPL or GNAT Pro Ada Core
compilers.

=== GNAT GPL or GNAT Pro ===

# Go to http://libre.adacore.com/download/configurations
# Select the package gnat-gpl-2015-~[select_your_architecture~]-linux-bin.tar.gz
# Set bundle format to tar.
# Download the archive.
# At the terminal, cd to the folder where you downloaded the archive.
# Execute the following "as root":

<pre>
# tar -xvf AdaCore-Download-[whatever_the_date].tar
# cd x86-linux/adagpl-2015/gnatgpl
# tar -zxvf gnat-gpl-2015-x86-linux-bin.tar.gz
# cd gnat-gpl-2015-x86-linux-bin
# ./doinstall
</pre>

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

After the installation of GNAT, XML/Ada and AWS, the best solution to build the AWA framework is by
using the git repositories.  To check out all the sources and the related components, then configure and
build, you can use the following commands:

<pre>
git clone git@github.com:stcarrez/ada-awa.git ada-awa
cd ada-awa
./configure --with-git --enable-ahven --prefix=/usr/local
</pre>

You may change the ''''''--prefix=/usr/local'''''' according to your installation.  This is the directory where the AWA
libraries and components will be installed.  After the configure step, you should build everything with:

  make

After all the AWA components are built, you should install them with the following command:

  make install

== Atlas configure ==

The Atlas demonstrator is located in the ''''''awa/samples'''''' directory in the AWA source tree.
Configure and build the demonstrator as follows:

  cd awa/samples
  ./configure

== Atlas build ==

<pre>
make
</pre>

== Atlas database setup ==

',4,'Add the build command',1,7,1,1201),(310,'2016-04-20 19:32:54','Atlas is an online application that provides a blogging system, a question & answer area and a document storage space. It shows the different plugins and features provided by the [https://github.com/stcarrez/ada-awa Ada Web Application] framework.

The goal of Atlas is to show you some interesting features provided by [https://github.com/stcarrez/ada-awa Ada Web Application] so that you can try them, look at their implementation and learn how you may use and extend [https://github.com/stcarrez/ada-awa  Ada Web Application] for your own needs.

== AWA Overview ==

AWA is a flexible Web application framework intended to help in designing Web application servers. It is composed of several configuration components also called modules or plugins. Components are classified in three categories.

;System Components
:The System Components represent the core components onto which all other components are based. These component don''t provide any real functionality for a final user but they are necessary for the Web application to operate.
;General Purpose Components
:The General Purpose Components are components which provide generic functionalities that can be plugged and used by functional components.
;Functional Components
:The Functional Components implement a final functionality for a user.

<img src="https://github.com/stcarrez/ada-awa/wiki/images/awa-features.png"/>
',4,'Small description about AWA',1,5,2,1201),(311,'2016-04-20 19:47:10','Atlas is an online application that provides a blogging system, a question & answer area and a document storage space. It shows the different plugins and features provided by the [https://github.com/stcarrez/ada-awa Ada Web Application] framework.

The goal of Atlas is to show you some interesting features provided by [https://github.com/stcarrez/ada-awa Ada Web Application] so that you can try them, look at their implementation and learn how you may use and extend [https://github.com/stcarrez/ada-awa  Ada Web Application] for your own needs.

== AWA Overview ==

AWA is a flexible Web application framework intended to help in designing Web application servers. It is composed of several configuration components also called modules or plugins. Components are classified in three categories.

;System Components
:The System Components represent the core components onto which all other components are based. These component don''t provide any real functionality for a final user but they are necessary for the Web application to operate.
;General Purpose Components
:The General Purpose Components are components which provide generic functionalities that can be plugged and used by functional components.
;Functional Components
:The Functional Components implement a final functionality for a user.

<img src="https://github.com/stcarrez/ada-awa/wiki/images/awa-features.png"/>

== Atlas Overview ==

Atlas uses most of the AWA components and provides its own simple plugins to show how to write your own plugins.
It uses the Google and Facebook authentication so that you can easily log in and play with the Atlas features.


',4,'Small description about Atlas',1,6,2,1201),(312,'2016-04-20 19:49:29','Atlas is an online application that provides a blogging system, a question & answer area and a document storage space. It shows the different plugins and features provided by the [https://github.com/stcarrez/ada-awa Ada Web Application] framework.

The goal of Atlas is to show you some interesting features provided by [https://github.com/stcarrez/ada-awa Ada Web Application] so that you can try them, look at their implementation and learn how you may use and extend [https://github.com/stcarrez/ada-awa  Ada Web Application] for your own needs.

== AWA Overview ==

AWA is a flexible Web application framework intended to help in designing Web application servers. It is composed of several configuration components also called modules or plugins. Components are classified in three categories.

;System Components
:The System Components represent the core components onto which all other components are based. These component don''t provide any real functionality for a final user but they are necessary for the Web application to operate.
;General Purpose Components
:The General Purpose Components are components which provide generic functionalities that can be plugged and used by functional components.
;Functional Components
:The Functional Components implement a final functionality for a user.

<img src="https://github.com/stcarrez/ada-awa/wiki/images/awa-features.png"/>

== Atlas Overview ==

Atlas uses most of the AWA components and provides its own simple plugins to show how to write your own plugins.
It uses the Google and Facebook authentication so that you can easily log in and play with the Atlas features.

Go to the [[http://demo.vacs.fr/atlas/auth/login.html|Login]] page.

',4,'Small description about Atlas',1,7,2,1201),(401,'2016-05-06 06:19:37','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.  You may use the GNU Ada compiler or the GNAT GPL or GNAT Pro Ada Core
compilers.

=== GNAT GPL or GNAT Pro ===

# Go to http://libre.adacore.com/download/configurations
# Select the package gnat-gpl-2015-~[select_your_architecture~]-linux-bin.tar.gz
# Set bundle format to tar.
# Download the archive.
# At the terminal, cd to the folder where you downloaded the archive.
# Execute the following "as root":

<pre>
# tar -xvf AdaCore-Download-[whatever_the_date].tar
# cd x86-linux/adagpl-2015/gnatgpl
# tar -zxvf gnat-gpl-2015-x86-linux-bin.tar.gz
# cd gnat-gpl-2015-x86-linux-bin
# ./doinstall
</pre>

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

After the installation of GNAT, XML/Ada and AWS, the best solution to build the AWA framework is by
using the git repositories.  To check out all the sources and the related components, then configure and
build, you can use the following commands:

<pre>
git clone git@github.com:stcarrez/ada-awa.git ada-awa
cd ada-awa
./configure --with-git --enable-ahven --prefix=/usr/local
</pre>

You may change the ''''''--prefix=/usr/local'''''' according to your installation.  This is the directory where the AWA
libraries and components will be installed.  After the configure step, you should build everything with:

  make

After all the AWA components are built, you should install them with the following command:

  make install

== Atlas configure ==

The Atlas demonstrator is now provided as a separate package and git repository.
You can get the source with the next command:

 git clone git@github.com:stcarrez/atlas.git atlas

Once the sources are downloaded, you configure and build the demonstrator as follows:

  cd atlas
  ./configure

If you have problems at this stage, check that you have installed AWA and that the AWA GNAT project files are located in @@gprbuild@@''s path or that you setup the @@ADA_PROJECT_PATH@@ environment variable correctly.

== Atlas build ==

After the Atlas configuration, you will build the application with:

<pre>
make
</pre>

After this, you will get an executable program in @@bin/atlas-server@@: this is your Atlas server application.

== Atlas database setup ==

',4,'Update the Atlas command to use git repository',1,8,1,1201),(402,'2016-05-06 06:20:38','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.  You may use the GNU Ada compiler or the GNAT GPL or GNAT Pro Ada Core
compilers.

=== GNAT GPL or GNAT Pro ===

# Go to http://libre.adacore.com/download/configurations
# Select the package gnat-gpl-2015-~[select_your_architecture~]-linux-bin.tar.gz
# Set bundle format to tar.
# Download the archive.
# At the terminal, cd to the folder where you downloaded the archive.
# Execute the following "as root":

<pre>
# tar -xvf AdaCore-Download-[whatever_the_date].tar
# cd x86-linux/adagpl-2015/gnatgpl
# tar -zxvf gnat-gpl-2015-x86-linux-bin.tar.gz
# cd gnat-gpl-2015-x86-linux-bin
# ./doinstall
</pre>

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

After the installation of GNAT, XML/Ada and AWS, the best solution to build the AWA framework is by
using the git repositories.  To check out all the sources and the related components, then configure and
build, you can use the following commands:

<pre>
git clone git@github.com:stcarrez/ada-awa.git ada-awa
cd ada-awa
./configure --with-git --enable-ahven --prefix=/usr/local
</pre>

You may change the ''''''--prefix=/usr/local'''''' according to your installation.  This is the directory where the AWA
libraries and components will be installed.  After the configure step, you should build everything with:

  make

After all the AWA components are built, you should install them with the following command:

  make install

== Atlas configure ==

The Atlas demonstrator is now provided as a separate package and git repository.
You can get the source with the next command:

 git clone git@github.com:stcarrez/atlas.git atlas

Once the sources are downloaded, you configure and build the demonstrator as follows:

  cd atlas
  ./configure

If you have problems at this stage, check that you have installed AWA and that the AWA GNAT project files are located in <tt>gprbuild</tt>''s path or that you setup the
<tt>ADA_PROJECT_PATH</tt> environment variable correctly.

== Atlas build ==

After the Atlas configuration, you will build the application with:

<pre>
make
</pre>

After this, you will get an executable program in @@bin/atlas-server@@: this is your Atlas server application.

== Atlas database setup ==

',4,'Fix presentation',1,9,1,1201),(501,'2016-06-08 20:48:43','This page explains how you can install the Atlas demonstrator.

== GNAT compiler installation ==

You need an Ada compiler.  You may use the GNU Ada compiler or the GNAT GPL or GNAT Pro Ada Core
compilers.

=== GNAT GPL or GNAT Pro ===

# Go to http://libre.adacore.com/download/configurations
# Select the package gnat-gpl-2015-~[select_your_architecture~]-linux-bin.tar.gz
# Set bundle format to tar.
# Download the archive.
# At the terminal, cd to the folder where you downloaded the archive.
# Execute the following "as root":

<pre>
# tar -xvf AdaCore-Download-[whatever_the_date].tar
# cd x86-linux/adagpl-2015/gnatgpl
# tar -zxvf gnat-gpl-2015-x86-linux-bin.tar.gz
# cd gnat-gpl-2015-x86-linux-bin
# ./doinstall
</pre>

== XML/Ada installation ==

== AWS installation ==

== AWA installation ==

After the installation of GNAT, XML/Ada and AWS, the best solution to build the AWA framework is by
using the git repositories.  To check out all the sources and the related components, then configure and
build, you can use the following commands:

<pre>
git clone git@github.com:stcarrez/ada-awa.git ada-awa
cd ada-awa
./configure --with-git --enable-ahven --prefix=/usr/local
</pre>

You may change the ''''''--prefix=/usr/local'''''' according to your installation.  This is the directory where the AWA
libraries and components will be installed.  After the configure step, you should build everything with:

  make

After all the AWA components are built, you should install them with the following command:

  make install

== Atlas configure ==

The Atlas demonstrator is now provided as a separate package and git repository.
You can get the source with the next command:

 git clone git@github.com:stcarrez/atlas.git atlas

Once the sources are downloaded, you configure and build the demonstrator as follows:

  cd atlas
  ./configure

If you have problems at this stage, check that you have installed AWA and that the AWA GNAT project files are located in <tt>gprbuild</tt>''s path or that you setup the
<tt>ADA_PROJECT_PATH</tt> environment variable correctly.

== Atlas build ==

After the Atlas configuration, you will build the application with:

 make

After this, you will get an executable program in <tt>bin/atlas-server</tt>: this is your Atlas server application.

== Atlas database setup ==

',4,'Fix typo',1,10,1,1201);
INSERT INTO `awa_wiki_page` VALUES (1,'Installation',10,1,'Installation',12,165,NULL,1,501),(2,'Main',7,1,'Atlas Demonstrator',8,315,NULL,1,312),(101,'Syntax MediaWiki',21,1,'Syntax MediaWiki',23,163,NULL,1,301);
INSERT INTO `awa_wiki_space` VALUES (1,'Atlas',1,5,'2015-12-05 16:13:02','[Main]

[Installation]

[Syntax MediaWiki]','',2,1);
INSERT INTO `sequence` VALUES ('awa_message_type',3,301,100),('awa_email',21,2101,100),('awa_user',21,2101,100),('awa_session',40,4001,100),('awa_workspace',17,1701,100),('awa_acl',18,1801,100),('awa_blog',5,501,100),('mblog',15,1501,100),('awa_post',9,901,100),('awa_access_key',13,1301,100),('awa_queue',1,101,100),('awa_question',3,301,100),('awa_answer',3,301,100),('awa_rating',3,301,100),('awa_vote',4,401,100),('awa_storage_folder',7,701,100),('awa_storage',5,501,100),('awa_storage_data',5,501,100),('awa_tag',6,601,100),('awa_tagged_entity',6,601,100),('atlas_review',3,301,100),('awa_image',1,101,100),('awa_counter_definition',2,201,100),('awa_wiki_page',2,201,100),('awa_wiki_content',6,601,100),('awa_job',6,601,100),('awa_message',6,601,100);
INSERT INTO "awa_user" (first_name, last_name, password, open_id, country, name, version, id, email_id, salt)
   VALUES('','','','Nobody','','Atlas Installator',1,1,1, 'xxx');
INSERT INTO "awa_email" (email, status, last_error_date, version, id, user_id)
   VALUES (1,2,'Atlas@earth.world',1,0,'0000-00-00 00:00:00');
INSERT INTO "awa_blog" (id, version, name, uid, create_date, workspace_id, update_date, url)
   VALUES (1,1,'Java 2 Ada','','2012-05-22 19:55:24',1,'0000-00-00 00:00:00','');
INSERT INTO "awa_post" (id, version, title, uri, text, create_date, publish_date, status, author_id, blog_id,
   allow_comments, read_count)
   VALUES (1,7,'Welcome to Atlas, the Ada Web Application demonstrator',
'2014/03/16/Welcome-to-Atlas-the-Ada-Web-Application-demonstrator',
'__Atlas__ is a demonstration application implemented using the [AWA|https://github.com/stcarrez/ada-awa] framework.
The Atlas application features:

* User registration through Google+, Facebook or classical email/password registration mechanisms,
* A microblog shared among all users,
* A blog system allowing users to post articles displayed on this public page,
* A Q&A forum area to post questions and get answers,
* A Wiki environment to share online documentation.

This application will evolve while new AWA plugins are added. 

Feel free to try this application to see and discover AWA capabilities.  [Connect to Atlas|http://demo.vacs.fr/atlas/auth/login.html]

Enjoy,

Stephane

','2012-05-22 20:08:47','2017-02-04 22:41:44',1,1,1,0,1916);

UPDATE awa_wiki_content SET author_id = 1;

