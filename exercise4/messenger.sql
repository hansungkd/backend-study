CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `password` VARCHAR(64) NOT NULL,
    `nickname` VARCHAR(10) NOT NULL,
    `profile_image` VARCHAR(128) NOT NULL,
    `profile_message` VARCHAR(128) NOT NULL DEFAULT '',
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `date_of_join` DATE NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `created_user` INT NOT NULL,
    `url` VARCHAR(128) NOT NULL,
    `max_user` INT NOT NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`created_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `text` TEXT NOT NULL,
    `user` INT NOT NULL,
    `channel` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`), 
    FOREIGN KEY (`user`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocked_by` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `date_of_block` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocked_by`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `date_of_follow` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

