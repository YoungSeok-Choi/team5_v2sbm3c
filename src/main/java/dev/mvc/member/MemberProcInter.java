package dev.mvc.member;

public interface MemberProcInter {
    /**
     * 중복 아이디 검사
     * @param id
     * @return 중복 아이디 갯수
     */
    public int checkID(String id);
    
    /**
     * 중복 이메일 검사
     * @param email
     * @return 중복 이메일 갯수
     */
    public int checkEmail(String email);
    
    /**
     * 회원 가입
     * @param memberVO
     * @return
     */
    public int create(MemberVO memberVO);
}
