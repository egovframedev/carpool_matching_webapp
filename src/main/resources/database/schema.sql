-- 
-- CarTO DB 스키마 
-- 수정 : 2018-11-29
--

-- 회원
CREATE TABLE `member` (
	`mno`          INT(11)       NOT NULL AUTO_INCREMENT COMMENT '회원번호',
	`mstate`       TINYINT(4)    NOT NULL DEFAULT '1'    COMMENT '회원상태',
	`userid`       VARCHAR(50)   NOT NULL                COMMENT '아이디',
	`userpw`       VARCHAR(128)  NOT NULL                COMMENT '비밀번호',
	`name`         VARCHAR(50)   NOT NULL                COMMENT '이름',
	`birth`        VARCHAR(10)   NULL DEFAULT NULL       COMMENT '생년월일',
	`email`        VARCHAR(50)   NOT NULL                COMMENT '이메일',
	`phone`        VARCHAR(20)   NULL DEFAULT NULL       COMMENT '전화번호',
	`gender`       TINYINT(4)    NULL DEFAULT '1'        COMMENT '성별(1 남, 2 여)',
	`approval_status` VARCHAR(6) NULL DEFAULT 'false'    COMMENT '이메일인증상태',
	`approval_key` VARCHAR(10)   NULL DEFAULT NULL       COMMENT '이메일인증키',
	`regdate`      TIMESTAMP     NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입날짜',
	`pwdate`       TIMESTAMP     NULL DEFAULT NULL       COMMENT '비번변경일자',
	`logdate`      TIMESTAMP     NULL DEFAULT NULL       COMMENT '로그인최근날짜',
	`photo`        VARCHAR(100)  NULL DEFAULT NULL       COMMENT '프로필사진',
	`enabled`      TINYINT(4)    NOT NULL DEFAULT '1'    COMMENT '사용여부',
	PRIMARY KEY (`mno`),
	UNIQUE INDEX `IX_USERID` (`userid`), -- 아이디 유니크 지정
	UNIQUE INDEX `IX_EMAIL` (`email`)    -- 이메일 유니크 지정
) COMMENT='회원' COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `member_auth` (
	`userid`       VARCHAR(50)  NOT NULL          COMMENT '아이디',
	`authority`    VARCHAR(50)  NOT NULL          COMMENT '권한',
	`sessionKey`   VARCHAR(100) NULL DEFAULT NULL COMMENT '로그인유지키',
	`sessionLimit` TIMESTAMP    NULL DEFAULT NULL COMMENT '로그인유지시간',
	INDEX `FK_MEMBER_AUTH` (`userid`),
	CONSTRAINT `FK_MEMBER_AUTH` FOREIGN KEY (`userid`) REFERENCES `member` (`userid`) -- 아이디 외래키 지정
) COMMENT='회원 권한' COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- 주소록
CREATE TABLE `ADDRESS` (
	`mno`       INT          NULL COMMENT '회원번호',
	`addr_type` TINYINT      NULL COMMENT '주소구분',
	`address`   VARCHAR(200) NULL COMMENT '주소지',  
	`location`  VARCHAR(100) NULL COMMENT '주소좌표',
	INDEX `FK_MEMBER_TO_ADDRESS` (`mno`),
	CONSTRAINT `FK_MEMBER_TO_ADDRESS` FOREIGN KEY (`mno`) REFERENCES `member` (`mno`)
) COMMENT '주소록' ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 운전자 2018-11-28 
CREATE TABLE `DRIVER` (
	`mno`             INT          NOT NULL 	     COMMENT '회원번호', -- 회원번호
	`license_no`      VARCHAR(20)  NULL     DEFAULT NULL COMMENT '운전면허번호', -- 운전면허번호
	`car_no`          VARCHAR(20)  NULL     DEFAULT NULL COMMENT '차량번호', -- 차량번호
	`car_prod`        VARCHAR(20)  NULL     DEFAULT NULL COMMENT '차량제조사', -- 차량제조사
	`car_model`       VARCHAR(50)  NULL     DEFAULT NULL COMMENT '차량모델명', -- 차량모델명
	`car_color`       VARCHAR(50)  NULL     DEFAULT NULL COMMENT '차량색상', -- 차량색상
	`car_year`        VARCHAR(10)  NULL     DEFAULT NULL COMMENT '차량연식', -- 차량연식
	`insurance`       VARCHAR(20)  NULL     DEFAULT NULL COMMENT '보험정보', -- 보험정보
	`license_photo`   VARCHAR(100) NULL     DEFAULT NULL COMMENT '운전면허증사진', -- 운전면허증사진
	`license_chk`     TINYINT      NULL     DEFAULT NULL COMMENT '운전면허증확인', -- 운전면허증확인
	`insurance_photo` VARCHAR(100) NULL     DEFAULT NULL COMMENT '보험증서 사진', -- 보험증서 사진
	`insurance_chk`   TINYINT      NULL     DEFAULT NULL COMMENT '보험증서 확인', -- 보험증서 확인
	`car_photo`       VARCHAR(100) NULL     DEFAULT NULL COMMENT '차량정면사진', -- 차량정면사진
	`car_photo_chk`   TINYINT      NULL     DEFAULT NULL COMMENT '차량사진 확인', -- 차량사진 확인
	`carReg_photo`    VARCHAR(100) NULL     DEFAULT NULL COMMENT '차량등록증 사진', -- 차량등록증 사진
	`carReg_photo_chk`TINYINT      NULL     DEFAULT NULL COMMENT '차량등록증 확인', -- 차량등록증 확인
	`post_date`       TIMESTAMP    NULL 	DEFAULT CURRENT_TIMESTAMP COMMENT '승인날짜', -- 승인날짜
	`post_state`      TINYINT      NULL     DEFAULT NULL COMMENT '승인상태', -- 승인상태( 승인취소 0 , 승인요청 1 , 승인완료 2 )
	PRIMARY KEY (`mno`),
	CONSTRAINT `FK_MEMBER_TO_DRIVER` FOREIGN KEY (`mno`) REFERENCES `member` (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 
COMMENT '운전자';

-- 카풀정보
CREATE TABLE `carpool_info` (
	`cpno`           INT(11)  NOT NULL AUTO_INCREMENT COMMENT '카풀번호',
	`start_point`    VARCHAR(200) NULL DEFAULT NULL COMMENT '출발지 주소',
	`cptype`         TINYINT(1)   NULL DEFAULT NULL,
	`end_point`      VARCHAR(200) NULL DEFAULT NULL COMMENT '목적지 주소',
	`start_long`     VARCHAR(50)  NULL DEFAULT NULL COMMENT '출발지 좌표(경도)',
	`start_lat`      VARCHAR(50)  NULL DEFAULT NULL COMMENT '출발지 좌표(위도)',
	`end_long`       VARCHAR(50)  NULL DEFAULT NULL COMMENT '목적지 좌표(경도)',
	`end_lat`        VARCHAR(50)  NULL DEFAULT NULL COMMENT '목적지 좌표(위도)',
	`start_datetime` TIMESTAMP    NULL DEFAULT NULL COMMENT '출발시간',
	`seat_num`       TINYINT(4)   NULL DEFAULT NULL COMMENT '카풀인원',
	`charge`         INT(11)      NULL DEFAULT NULL COMMENT '금액',
	`seat_opt`       TINYINT(1)   NULL DEFAULT NULL COMMENT '자리설정',
	`drive_opt`      TINYINT(2)   NULL DEFAULT NULL COMMENT '운행조건',
	`trunk_use`      TINYINT(1)   NULL DEFAULT NULL COMMENT '트렁크이용',
	`smoke_use`      TINYINT(1)   NULL DEFAULT NULL COMMENT '흡연여부',
	`req_msg`        VARCHAR(300) NULL DEFAULT NULL COMMENT '요구사항',
	`mno`            INT(11)      NULL DEFAULT NULL COMMENT '작성회원번호',
	`reg_date`       TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성날자',
	PRIMARY KEY (`cpno`), -- 카풀정보 기본키
	INDEX `FK_MEMBER_TO_CARPOOL_INFO` (`mno`),
	CONSTRAINT `FK_MEMBER_TO_CARPOOL_INFO` FOREIGN KEY (`mno`) REFERENCES `member` (`mno`)
) COMMENT='카풀정보' COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- 카풀매칭
CREATE TABLE `carpool_match` (
	`matchno`    INT(11)  NOT NULL AUTO_INCREMENT COMMENT '매칭번호',
	`mno`        INT(11)  NOT NULL              COMMENT '회원번호',
	`cpno`       INT(11)  NOT NULL              COMMENT '카풀번호',
	`match_date` TIMESTAMP    NULL DEFAULT NULL COMMENT '매칭날짜',
	`progress`   TINYINT(4)   NULL DEFAULT 0    COMMENT '진행상황 (대기 0, 승인 1, 탑승 2, 결제완료 3, 취소 9)',
	`isdriver`   TINYINT(1)   NULL DEFAULT 0    COMMENT '드라이버 체크(드라이버1, 동승자0)',
	`payno`      VARCHAR(100) NULL DEFAULT NULL COMMENT '결제번호',
	`cpnum`      INT(11)      NULL DEFAULT 0    COMMENT '요청인원',
	`paysum`     INT(11)      NULL DEFAULT 0    COMMENT '결제금액',
	PRIMARY KEY (`matchno`),
	INDEX `FK_CARPOOL_INFO_TO_CARPOOL_MATCH` (`cpno`),
	INDEX `FK_PAYMENT_TO_CARPOOL_MATCH` (`payno`),
	CONSTRAINT `FK_CARPOOL_INFO_TO_CARPOOL_MATCH` FOREIGN KEY (`cpno`) REFERENCES `carpool_info` (`cpno`),
	CONSTRAINT `FK_MEMBER_TO_CARPOOL_MATCH` FOREIGN KEY (`mno`) REFERENCES `member` (`mno`),
	CONSTRAINT `FK_PAYMENT_TO_CARPOOL_MATCH` FOREIGN KEY (`payno`) REFERENCES `payment` (`payno`)
) COMMENT='카풀매칭' COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- 결제내역 수정: 2018-11-28
CREATE TABLE `payment` (
	`payno`     VARCHAR(100) NOT NULL  COMMENT '결제번호',
	`matchno`   INT(11)      NOT NULL  COMMENT '카풀매칭번호',
	`payer`     INT(11)      NOT NULL  COMMENT '결제자',
	`driver`    INT(11)      NOT NULL  COMMENT '운전자',
	`pay_date`  TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP COMMENT '결제일자',
	`amount`    INT(11)      NULL      COMMENT '결제금액',
	`apply_num` VARCHAR(100) NULL	   COMMENT '승인번호',  
	PRIMARY KEY (`payno`),
	INDEX `FK_DRIVER_TO_MEMBER` (`driver`),
	INDEX `FK_PAYER_TO_MEMBER` (`payer`),
	CONSTRAINT `FK_DRIVER_TO_MEMBER` FOREIGN KEY (`driver`) REFERENCES `member` (`mno`),
	CONSTRAINT `FK_PAYER_TO_MEMBER` FOREIGN KEY (`payer`) REFERENCES `member` (`mno`)
) COMMENT='결제내역' COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- 평가리뷰
CREATE TABLE `review` (
	`rvno`       INT(11) NOT NULL AUTO_INCREMENT  COMMENT '리뷰번호',
	`target_no`  INT(11) NOT NULL                 COMMENT '대상회원번호',
	`writer_no`  INT(11) NOT NULL                 COMMENT '작성회원번호',
	`star_point` TINYINT(4)  NULL DEFAULT 0       COMMENT '별점',
	`comment`    VARCHAR(300) NULL                COMMENT '논평',
	PRIMARY KEY(`rvno`)
) COMMENT '평가리뷰' COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `grade` (
	`gno`         INT(11) NOT NULL AUTO_INCREMENT COMMENT '평점번호',
	`target_no`   INT(11)     NULL DEFAULT NULL   COMMENT '대상회원번호',
	`total_point` BIGINT(20)  NULL DEFAULT 0      COMMENT '평점(총점)',
	`review_cnt`  INT(11)     NULL DEFAULT 0      COMMENT '평점 인원',
	PRIMARY KEY (`gno`),
	INDEX `FK_MEMBER_TO_GRADE` (`target_no`),
	CONSTRAINT `FK_MEMBER_TO_GRADE` FOREIGN KEY (`target_no`) REFERENCES `member` (`mno`),
) COMMENT='평가평점' COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- 게시판
CREATE TABLE `BOARD` (	
	`bno`      INT(11)  NOT NULL AUTO_INCREMENT COMMENT '게시판번호',
	`title`    VARCHAR(200) NULL            COMMENT '제목', 
	`content`  TEXT         NULL            COMMENT '내용',
	`writer`   VARCHAR(50)  NULL            COMMENT '작성자ID',
	`pwd`      VARCHAR(20)  NULL            COMMENT '비밀번호',
	`reg_date` TIMESTAMP 	NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
	`hit`      INT(11)      NULL DEFAULT 0  COMMENT '조회수', 
	`grpno`    INT(11)      NULL            COMMENT '답변그룹',
	`step`     INT(11)      NULL DEFAULT 0  COMMENT '답변순서',
	`depth`    INT(11)      NULL DEFAULT 0  COMMENT '답변깊이',
	`btype`    INT(11)      NULL DEFAULT 0  COMMENT '게시판구분(0 NOTICE, 1 FAQ, 2 QNA)',
	PRIMARY KEY (`bno`)
) COMMENT '게시판' ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 첨부파일
CREATE TABLE `attachfile` (
	`uuid`       VARCHAR(50)  NOT NULL          COMMENT '첨부코드',
	`bno`        INT(11)      NOT NULL          COMMENT '게시글번호',
	`filename`   VARCHAR(100) NULL DEFAULT NULL COMMENT '파일이름',
	`uploadpath` VARCHAR(50)  NULL DEFAULT NULL COMMENT '업로드경로',
	`fileyype`   TINYINT(1)   NULL DEFAULT '0'  COMMENT '이미지여부',
	PRIMARY KEY (`uuid`),
	INDEX `FK_BOARD_TO_ATTACHFILE` (`bno`),
	CONSTRAINT `FK_BOARD_TO_ATTACHFILE` FOREIGN KEY (`bno`) REFERENCES `board` (`bno`)
) COMMENT '첨부파일' COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `message` (
	`msg_id`    INT(11)     NOT NULL AUTO_INCREMENT COMMENT '메세지번호',
	`msg_type`  INT(11)     NOT NULL DEFAULT '0'    COMMENT '메세지구분',  
	`receiver`  VARCHAR(50) NOT NULL                COMMENT '수신인',
	`sender`    VARCHAR(50) NOT NULL                COMMENT '송신인',
	`body` TEXT             NOT NULL                COMMENT '내용',
	`open_date` TIMESTAMP   NULL DEFAULT NULL       COMMENT '개봉날짜',
	`send_date` TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '전송날짜',
	PRIMARY KEY (`msg_id`),
	INDEX `FK_SENDER_UID` (`sender`),
	INDEX `FK_RECEIVER_UID` (`receiver`),
	CONSTRAINT `FK_RECEIVER_UID` FOREIGN KEY (`receiver`) REFERENCES `member` (`userid`),
	CONSTRAINT `FK_SENDER_UID` FOREIGN KEY (`sender`) REFERENCES `member` (`userid`)
) COMMENT='메세지' COLLATE='utf8_general_ci' ENGINE=InnoDB;
