INSERT INTO `users` (`id`, `username`, `password_hash`, `user_type`) VALUES
  (1, 'admin', '$2y$10$gUpOwuhsspMugM4zP/fsUesF03fem65J4i6iUjR.rDjkiYvO9VcSe', 'admin');

INSERT INTO `user_profiles` (`user_id`) VALUES (1);