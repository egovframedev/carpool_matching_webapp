package com.carto.member.domain;

public class NotAuthorizedUserException extends Exception {
	private static final long serialVersionUID = 1L;

	public NotAuthorizedUserException() {
		super("아직 승인되지 않은 사용자입니다.");
	}
}
