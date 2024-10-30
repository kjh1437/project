package com.pilloud.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pilloud.model.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {

	@Autowired
	private UserMapper usermapper;			//MemberMapper.java 인터페이스 의존성 주입
	
	
//	//회원가입 쿼리 테스트 메서드
//	@Test
//	public void userSignup() throws Exception{
//		UserVO user = new UserVO();
//		
//		user.setId("test2"); // 회원 id
//        user.setPw("test"); // 회원 비밀번호
//        user.setNm("test"); // 회원 이름
//        user.setEmail("test"); // 회원 메일
//        user.setBirth("test"); // 회원 메일
//        user.setTel1("test"); // 회원 전화번호
//        user.setTel2("test"); // 회원 전화번호
//        user.setTel3("test"); // 회원 전화번호
//        user.setSex("test"); // 회원 성별
//		
//		usermapper.userSignup(user);			//쿼리 메서드 실행
//			
//	}
	
	// 아이디 중복검사
//		@Test
//		public void IdChk() throws Exception{
//			String id = "test";	// 존재하는 아이디
//			String id2 = "test123";	// 존재하지 않는 아이디
//			usermapper.idCheck(id);
//			usermapper.idCheck(id2);
//		}
	
	/* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void memberLogin() throws Exception{
        
        UserVO member = new UserVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
        member.setId("test1");
        member.setPw("test1");
        
        /* 올바른 않은 아이디 비번 입력경우 */
        //member.setMemberId("test1123");
        //member.setMemberPw("test1321321");
        
        usermapper.userLogin(user);
        System.out.println("결과 값 : " + usermapper.userLogin(user));
        
    }
 

}
