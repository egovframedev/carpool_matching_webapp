package com.carto.member.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.carto.member.dao.MemberDAO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CarpoolUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = { @Autowired })
	private MemberDAO memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + userName);
		
		return null;
	}
	
}
