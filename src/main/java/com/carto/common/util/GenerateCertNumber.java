package com.carto.common.util;

import java.util.Random;

/**
 * 숫자 인증번호 생성
 * @author CodingBear
 * @since 2018.11.14
 */
public class GenerateCertNumber {
	private int certNumLength = 6;  // 번호 자리수
	
	public String excuteGenerate() {
		Random random = new Random(System.currentTimeMillis());
		
		int range = (int)Math.pow(10, certNumLength);
		int trim = (int)Math.pow(10, certNumLength - 1);
		long result = (long) random.nextInt(range) + trim;
		
		if(result > range) {
			result = result - trim;
		}
		
		return String.valueOf(result);
	}
	
	public int getCertNumLength() {
		return certNumLength;
	}
	
	public void setCertNumLength(int certNumLength) {
		this.certNumLength = certNumLength;
	}
	
	public static void main(String[] args) {
		GenerateCertNumber ge = new GenerateCertNumber();
		ge.setCertNumLength(6);
		System.out.println(ge.excuteGenerate());
	}
}
