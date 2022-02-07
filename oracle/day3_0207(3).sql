-- 중요1 : 고객과 상품테이블의 행(row)데이터를 구분한 CUSTOM_ID ,PCODE 는 중복되면 안됩니다.
--			ㄴ 기본키 컬럼을 정합니다.(중복된 값과 NULL은 허용이 안됩니다.)
-- 중요2: 예를들면  PRICE , QUANTITY 등의 컬럼은 꼭 필수 데이터로 저장되어야 합니다.
--			ㄴ NOT NULL 컬럼으로 설정합니다.	(NULL 저장 안됩니다.)		
-- 중요3: 고객과 상품테이블에 없는 CUSTOM_ID,PCODE 컬럼 값을 사용하면 부정확한 데이터
--		ㄴ 외래키 컬럼을 정합니다.(다른테이블에서 값을 참조합니다.NULL 허용도 안합니다.)

-- 위의 NOT NULL, 기본키 , 외래키는 대표적인 제약조건(CONSTRAINT) 설정입니다.
-- 제약조건을 설정한 테이블로 생성해 봅니다.
-- 고객 테이블 
CREATE TABLE tbl_custom# (
	custom_id varchar2(20) PRIMARY KEY ,  
	name nvarchar2(20) NOT NULL ,		 
	email varchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);
-- 상품 테이블 : 상품코드(가변길이 20자리),카테고리(고정길이 2자리)
--								A1:전자제품, B1:식품
CREATE TABLE tbl_product#(
	pcode varchar2(20) CONSTRAINT pk_product PRIMARY KEY ,
	category char(2),
	pname nvarchar2(20) NOT NULL ,
	price number(9) NOT NULL 
);

-- 구매 테이블 : 어느 고객이 무슨 상품을 구입하는가?
-- 구매 테이블의 기본키는 별도로 컬럼을 추가합니다.

CREATE TABLE tbl_buy#(
	buy_seq number(8) ,		-- 구매정보 일련번호
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5) NOT NULL ,		--수량
	buy_date timestamp ,
	CONSTRAINT pk_buy_seq PRIMARY KEY(buy_seq),
	CONSTRAINT fk_custom_id FOREIGN KEY (custom_id) -- 이 테이블의 컬럼명
		REFERENCES tbl_custom#(custom_id),	--참조테이블과 그 컬럼명
	CONSTRAINT fk_pcode FOREIGN KEY (pcode)
		REFERENCES tbl_product#(pcode)
	-- 외래키로 설정될 수 있는 컬럼은 기본키 또는 unique(유일한) 에 대해서만 가능합니다.	
);