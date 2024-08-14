package com.lcomputerstudy.example.controller;

import java.util.ArrayList;
import java.util.List;
import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@org.springframework.stereotype.Controller
public class Controller {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired UserService userservice;
	@Autowired BoardService boardservice;
	@Autowired PasswordEncoder passwordEncoder;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		return "/list";
	}
	
	@PostMapping("/insertBoard")
	
	@GetMapping("/")
	public String home() {
		logger.debug("디버그입니다");
		logger.info("인포입니다");
		
		return "/index";
	}
	
	@GetMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute User user) {
		//비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		//String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
	      
	    //유저 데이터 세팅
	    user.setPassword(encodedPassword);
	    user.setAccountNonExpired(true);
	    user.setEnabled(true);
	    user.setAccountNonLocked(true);
	    user.setCredentialsNonExpired(true);
	    user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
	    
	    /*List<GrantedAuthority> authorities = new ArrayList<>();
	    authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
	    authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
	    user.setAuthorities(authorities);*/
	      
	    //유저 생성
	    userservice.createUser(user);
	    //유저 권한 생성
	    userservice.createAuthorities(user);
	    return "/login";
	}
	
	@GetMapping(value="/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping(value="/admin")
	public String admin(Model model) {
		return "/admin";
	}
	   
	@Secured({"ROLE_USER"})
	@GetMapping(value="/user/info")
	public String userInfo(Model model) {  
	   return "/user_info";
	}
	   
	@GetMapping(value="/denied")
	public String denied(Model model) {
	   return "/denied";
	}
}
