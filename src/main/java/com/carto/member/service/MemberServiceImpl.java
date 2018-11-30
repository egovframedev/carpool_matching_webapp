package com.carto.member.service;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carto.member.dao.MemberDAO;
import com.carto.member.domain.DriverDTO;
import com.carto.member.domain.LoginDTO;
import com.carto.member.domain.MemberDTO;
import com.carto.member.domain.NotAuthorizedUserException;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO manager;

	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		out.println(manager.check_id(id));
		out.close();
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		out.println(manager.check_email(email));
		out.close();
	}

	@Transactional
	@Override
	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (manager.check_id(member.getUserid()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (manager.check_email(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			// 인증키 생성
			member.setApproval_key(approval_key());
			// 맴버 등록
			manager.join_member(member);
			manager.insertRole(member.getUserid(), "ROLE_RIDER");

			// 인증 메일 발송
			sendmail(member);
			return 1;
		}
	}

	@Override
	public String approval_key() throws Exception {
		// TODO Auto-generated method stub
		String key = "";
		Random random = new Random();

		for (int i = 0; i < 8; i++) {
			key += random.nextInt(10);
		}
		return key;
	}

	@Override
	public void sendmail(MemberDTO member) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "hyekang89@naver.com";
		String hostSMTPpwd = "dnldtm12";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "hyekang89@naver.com";
		String fromName = "CarTO";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "CarTO 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getUserid() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:8080/carpool/approval_member'>";
		msg += "<input type='hidden' name='email' value='" + member.getEmail() + "'>";
		msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

	@Override
	public void approval_member(MemberDTO member, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (manager.approval_member(member) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='/carpool/';");
			out.println("</script>");
			out.close();
		}
	}

	// 로그인
	@Override
	public MemberDTO login(LoginDTO dto) throws Exception {
		MemberDTO member = manager.login(dto);
		if (!member.isApproval_status()) {
			throw new NotAuthorizedUserException();
		}
		return member;
	}

	@Override
	public void keepLogin(String userid, String sessionId, Date next) throws Exception {
		manager.keepLogin(userid, sessionId, next);
	}

	// 세션키로 로그인 체크
	@Override
	public MemberDTO checkLoginBefore(String value) {
		return manager.checkUserWithSessionKey(value);
	}

	// 회원 로그인 정보
	@Override
	public MemberDTO viewMember(MemberDTO memberdto) throws Exception {
		return manager.viewMember(memberdto);
	}

	@Override
	public int insertDriver(DriverDTO dto, int mno) {
		mno = 1;
		dto.setMno(mno);
		return manager.insertDriver(dto);

	}

	@Override
	public int UpdateDriverVerti(DriverDTO dto) {
		return manager.UpdateDriverVerti(dto);
	}

	@Override
	public DriverDTO getDriver(int mno) {
		return manager.getDriver(mno);
	}

	// 회원정보 가져오기
	@Override
	public MemberDTO selectMember(String userid) {
		return manager.selectMember(userid);
	}

}
