-- 회원
CREATE TABLE `MEMBER` (
	`mno`        INT          NOT NULL COMMENT '회원번호', -- 회원번호
	`mtype`      TINYINT      NOT NULL COMMENT '회원구분', -- 회원구분
	`mstate`     TINYINT      NOT NULL COMMENT '회원상태', -- 회원상태
	`id`         VARCHAR(50)  NOT NULL COMMENT '아이디', -- 아이디
	`pw`         VARCHAR(128) NOT NULL COMMENT '비밀번호', -- 비밀번호
	`name`       VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	`birth`      VARCHAR(10)  NULL     COMMENT '생년월일', -- 생년월일
	`email`      VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
	`tel`        VARCHAR(20)  NULL     COMMENT '전화번호', -- 전화번호
	`gender`     TINYINT      NULL     COMMENT '성별', -- 성별
	`cardco`     VARCHAR(10)  NULL     COMMENT '결제카드사', -- 결제카드사
	`cardno`     VARCHAR(20)  NULL     COMMENT '결제카드번호', -- 결제카드번호
	`validity`   VARCHAR(10)  NULL     COMMENT '카드유효년월', -- 카드유효년월
	`authchk`    TINYINT      NULL     COMMENT '회원인증여부', -- 회원인증여부
	`authno`     VARCHAR(100) NULL     COMMENT '인증번호', -- 인증번호
	`reg_date`   TIMESTAMP    NULL     COMMENT '가입날짜', -- 가입날짜
	`login_date` TIMESTAMP    NULL     COMMENT '로그인 최근일자', -- 로그인 최근일자
	`pw_date`    TIMESTAMP    NULL     COMMENT '비밀번호변경일', -- 비밀번호변경일
	`photo`      VARCHAR(100) NULL     COMMENT '프로필사진' -- 프로필사진
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '회원';

-- 회원
ALTER TABLE `MEMBER`
	ADD CONSTRAINT `PK_MEMBER` -- 회원 기본키
		PRIMARY KEY (
			`mno` -- 회원번호
		);

-- 운전자
CREATE TABLE `DRIVER` (
	`mno`             INT          NOT NULL COMMENT '회원번호', -- 회원번호
	`license_no`      VARCHAR(20)  NULL     COMMENT '운전면허번호', -- 운전면허번호
	`car_no`          VARCHAR(20)  NULL     COMMENT '차량번호', -- 차량번호
	`car_prod`        VARCHAR(20)  NULL     COMMENT '차량제조사', -- 차량제조사
	`car_model`       VARCHAR(50)  NULL     COMMENT '차량모델명', -- 차량모델명
	`car_color`       VARCHAR(50)  NULL     COMMENT '차량색상', -- 차량색상
	`car_year`        VARCHAR(10)  NULL     COMMENT '차량연식', -- 차량연식
	`insurance`       VARCHAR(20)  NULL     COMMENT '보험정보', -- 보험정보
	`license_photo`   VARCHAR(100) NULL     COMMENT '운전면허증사진', -- 운전면허증사진
	`license_chk`     TINYINT      NULL     COMMENT '운전면허증확인', -- 운전면허증확인
	`insurance_photo` VARCHAR(100) NULL     COMMENT '보험증서 사진', -- 보험증서 사진
	`insurance_chk`   TINYINT      NULL     COMMENT '보험증서 확인', -- 보험증서 확인
	`car_photo`       VARCHAR(100) NULL     COMMENT '차량정면사진', -- 차량정면사진
	`car_photo_chk`   TINYINT      NULL     COMMENT '차량사진 확인', -- 차량사진 확인
	`post_date`       VARCHAR(100) NULL     COMMENT '승인날짜', -- 승인날짜
	`post_state`      TINYINT      NULL     COMMENT '승인상태' -- 승인상태
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '운전자';

-- 카풀정보
CREATE TABLE `CARPOOL_INFO` (
	`cpno`        INT          NOT NULL COMMENT '카풀번호', -- 카풀번호
	`start_point` VARCHAR(200) NULL     COMMENT '출발지 주소', -- 출발지 주소
	`end_point`   VARCHAR(200) NULL     COMMENT '목적지 주소', -- 목적지 주소
	`start_loc`   VARCHAR(100) NULL     COMMENT '출발지 좌표', -- 출발지 좌표
	`end_loc`     VARCHAR(100) NULL     COMMENT '목적지 좌표', -- 목적지 좌표
	`seat_num`    TINYINT      NULL     COMMENT '카풀인원', -- 카풀인원
	`charge`      INT          NULL     COMMENT '금액', -- 금액
	`seat_opt`    TINYINT      NULL     COMMENT '자리설정', -- 자리설정
	`drive_opt`   TINYINT      NULL     COMMENT '운행조건', -- 운행조건
	`trunk_use`   TINYINT      NULL     COMMENT '트렁크이용', -- 트렁크이용
	`smoke_use`   TINYINT      NULL     COMMENT '흡연여부', -- 흡연여부
	`req_msg`     VARCHAR(300) NULL     COMMENT '요구사항', -- 요구사항
	`mno`         INT          NULL     COMMENT '작성회원번호', -- 작성회원번호
	`reg_date`    TIMESTAMP    NULL     COMMENT '작성날자' -- 작성날자
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '카풀정보';

-- 카풀정보
ALTER TABLE `CARPOOL_INFO`
	ADD CONSTRAINT `PK_CARPOOL_INFO` -- 카풀정보 기본키
		PRIMARY KEY (
			`cpno` -- 카풀번호
		);

-- 주소록
CREATE TABLE `ADDRESS` (
	`mno`       INT          NULL COMMENT '회원번호', -- 회원번호
	`addr_type` TINYINT      NULL COMMENT '주소구분', -- 주소구분
	`address`   VARCHAR(200) NULL COMMENT '주소지', -- 주소지
	`location`  VARCHAR(100) NULL COMMENT '주소좌표' -- 주소좌표
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '주소록';

-- 평가평점
CREATE TABLE `GRADE` (
	`gno`   INT    NOT NULL COMMENT '평점번호', -- 평점번호
	`mno2`  INT    NULL     COMMENT '대상회원번호', -- 대상회원번호
	`mno`   INT    NULL     COMMENT '작성회원번호', -- 작성회원번호
	`total` BIGINT NULL     COMMENT '평점(총점)', -- 평점(총점)
	`cnt`   INT    NULL     COMMENT '평점 인원' -- 평점 인원
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '평가평점';

-- 평가평점
ALTER TABLE `GRADE`
	ADD CONSTRAINT `PK_GRADE` -- 평가평점 기본키
		PRIMARY KEY (
			`gno` -- 평점번호
		);

-- 게시판
CREATE TABLE `BOARD` (
	`bno`      INT          NOT NULL COMMENT '게시판번호', -- 게시판번호
	`title`    VARCHAR(200) NULL     COMMENT '제목', -- 제목
	`content`  TEXT         NULL     COMMENT '내용', -- 내용
	`writer`   VARCHAR(50)  NULL     COMMENT '작성자ID', -- 작성자ID
	`reg_date` TIMESTAMP    NULL     COMMENT '작성일', -- 작성일
	`pwd`      VARCHAR(20)  NULL     COMMENT '비밀번호', -- 비밀번호
	`hit`      INT          NULL     COMMENT '조회수', -- 조회수
	`grpno`    INT          NULL     COMMENT '답변그룹', -- 답변그룹
	`step`     INT          NULL     COMMENT '답변순서', -- 답변순서
	`depth`    INT          NULL     COMMENT '답변깊이', -- 답변깊이
	`btype`    INT          NULL     COMMENT '게시판구분' -- 게시판구분
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '게시판';

-- 게시판
ALTER TABLE `BOARD`
	ADD CONSTRAINT `PK_BOARD` -- 게시판 기본키
		PRIMARY KEY (
			`bno` -- 게시판번호
		);

-- 첨부파일
CREATE TABLE `ATTACHMENT` (
	`fno`           INT          NULL COMMENT '파일번호', -- 파일번호
	`bno`           INT          NULL COMMENT '게시판번호', -- 게시판번호
	`filename`      VARCHAR(200) NULL COMMENT '파일이름', -- 파일이름
	`original_name` VARCHAR(200) NULL COMMENT '원래파일명', -- 원래파일명
	`uploadpath`    VARCHAR(200) NULL COMMENT '업로드경로', -- 업로드경로
	`extension`     VARCHAR(10)  NULL COMMENT '확장자명', -- 확장자명
	`download_cnt`  INT          NULL COMMENT '다운로드수' -- 다운로드수
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '첨부파일';

-- 카풀매칭
CREATE TABLE `CARPOOL_MATCH` (
	`matchno`    INT          NULL COMMENT '매칭번호', -- 매칭번호
	`mno`        INT          NULL COMMENT '회원번호', -- 회원번호
	`cpno`       INT          NULL COMMENT '카풀번호', -- 카풀번호
	`match_date` TIMESTAMP    NULL COMMENT '매칭날짜', -- 매칭날짜
	`progress`   TINYINT      NULL COMMENT '진행상황', -- 진행상황
	`payno`      VARCHAR(100) NULL COMMENT '결제번호' -- 결제번호
	'isdriver'   TINYINT	  NULL COMMENT '드라이버 체크' --드라이버 (1 드라이버,0 동승자)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '카풀매칭';

-- 결제내역
CREATE TABLE `PAYMENT` (
	`payno`    VARCHAR(100) NOT NULL COMMENT '결제번호', -- 결제번호
	`pay_date` TIMESTAMP    NULL     COMMENT '결제일자', -- 결제일자
	`amount`   INT          NULL     COMMENT '결제금액' -- 결제금액
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '결제내역';

-- 결제내역
ALTER TABLE `PAYMENT`
	ADD CONSTRAINT `PK_PAYMENT` -- 결제내역 기본키
		PRIMARY KEY (
			`payno` -- 결제번호
		);

-- 운전자
ALTER TABLE `DRIVER`
	ADD CONSTRAINT `FK_MEMBER_TO_DRIVER` -- 회원 -> 운전자
		FOREIGN KEY (
			`mno` -- 회원번호
		)
		REFERENCES `MEMBER` ( -- 회원
			`mno` -- 회원번호
		);

-- 카풀정보
ALTER TABLE `CARPOOL_INFO`
	ADD CONSTRAINT `FK_MEMBER_TO_CARPOOL_INFO` -- 회원 -> 카풀정보
		FOREIGN KEY (
			`mno` -- 작성회원번호
		)
		REFERENCES `MEMBER` ( -- 회원
			`mno` -- 회원번호
		);

-- 주소록
ALTER TABLE `ADDRESS`
	ADD CONSTRAINT `FK_MEMBER_TO_ADDRESS` -- 회원 -> 주소록
		FOREIGN KEY (
			`mno` -- 회원번호
		)
		REFERENCES `MEMBER` ( -- 회원
			`mno` -- 회원번호
		);

-- 평가평점
ALTER TABLE `GRADE`
	ADD CONSTRAINT `FK_MEMBER_TO_GRADE` -- 회원 -> 평가평점
		FOREIGN KEY (
			`mno2` -- 대상회원번호
		)
		REFERENCES `MEMBER` ( -- 회원
			`mno` -- 회원번호
		);

-- 평가평점
ALTER TABLE `GRADE`
	ADD CONSTRAINT `FK_MEMBER_TO_GRADE2` -- 회원 -> 평가평점2
		FOREIGN KEY (
			`mno` -- 작성회원번호
		)
		REFERENCES `MEMBER` ( -- 회원
			`mno` -- 회원번호
		);

-- 첨부파일
ALTER TABLE `ATTACHMENT`
	ADD CONSTRAINT `FK_BOARD_TO_ATTACHMENT` -- 게시판 -> 첨부파일
		FOREIGN KEY (
			`bno` -- 게시판번호
		)
		REFERENCES `BOARD` ( -- 게시판
			`bno` -- 게시판번호
		);

-- 카풀매칭
ALTER TABLE `CARPOOL_MATCH`
	ADD CONSTRAINT `FK_MEMBER_TO_CARPOOL_MATCH` -- 회원 -> 카풀매칭
		FOREIGN KEY (
			`mno` -- 회원번호
		)
		REFERENCES `MEMBER` ( -- 회원
			`mno` -- 회원번호
		);

-- 카풀매칭
ALTER TABLE `CARPOOL_MATCH`
	ADD CONSTRAINT `FK_CARPOOL_INFO_TO_CARPOOL_MATCH` -- 카풀정보 -> 카풀매칭
		FOREIGN KEY (
			`cpno` -- 카풀번호
		)
		REFERENCES `CARPOOL_INFO` ( -- 카풀정보
			`cpno` -- 카풀번호
		);

-- 카풀매칭
ALTER TABLE `CARPOOL_MATCH`
	ADD CONSTRAINT `FK_PAYMENT_TO_CARPOOL_MATCH` -- 결제내역 -> 카풀매칭
		FOREIGN KEY (
			`payno` -- 결제번호
		)
		REFERENCES `PAYMENT` ( -- 결제내역
			`payno` -- 결제번호
		);
