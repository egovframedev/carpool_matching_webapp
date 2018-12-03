package com.carto.member.domain;

public class WithdrawalUserException extends Exception {
	private static final long serialVersionUID = 1L;

	public WithdrawalUserException() {
		super("이용 불가능한 사용자입니다.");
	}
}
