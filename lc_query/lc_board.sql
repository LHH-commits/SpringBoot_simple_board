CREATE TABLE `lc_board` (
	 `b_id` INT AUTO_INCREMENT PRIMARY KEY,
	 `b_title` VARCHAR(50),
	 `b_content` TEXT,
	 `b_writer` VARCHAR(50),
	 `b_datetime` DATETIMElc_board
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;