CREATE TABLE `lc_user` (
	 `u_id` VARCHAR(50),
	 `u_password` VARCHAR(200),
	 `u_name` VARCHAR(50),
	 `u_datetime` DATETIME,
	 `u_isAccountNonExpired` TINYINT(4) NULL,
	 `u_isAccountNonLocked` TINYINT(4) NULL,
	 `u_isCredentialNonExpired` TINYINT(4) NULL,lc_user
	 `u_isEnabled` TINYINT(4) NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;