/* File generated automatically by dynamo */
/* The Mblog table holds the message posted by users.
Once posted, the message is not supposed to be changed. */
CREATE TABLE IF NOT EXISTS mblog (
  /*  */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the microblog message */
  `message` VARCHAR(255) NOT NULL,
  /*  */
  `creation_date` DATETIME NOT NULL,
  /* the post author */
  `author_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
/* the table that contains the reviews made by users. */
CREATE TABLE IF NOT EXISTS atlas_review (
  /* the review identifier */
  `id` BIGINT NOT NULL,
  /*  */
  `version` INTEGER NOT NULL,
  /* the review title. */
  `title` VARCHAR(255) NOT NULL,
  /* the review description */
  `text` TEXT NOT NULL,
  /* the review creation date. */
  `create_date` DATETIME NOT NULL,
  /* whether comments are allowed. */
  `allow_comments` INTEGER NOT NULL,
  /* the site, article or application being reviewed. */
  `site` VARCHAR(255) NOT NULL,
  /*  */
  `reviewer_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT OR IGNORE INTO ado_entity_type (name) VALUES ("mblog");
INSERT OR IGNORE INTO ado_entity_type (name) VALUES ("atlas_review");
INSERT OR IGNORE INTO ado_version (name, version) VALUES ("atlas", 1);
