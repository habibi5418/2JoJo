package kr.co.dondog.admin.scheduled;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.dondog.admin.service.AdminService;
import kr.co.dondog.admin.service.MailService;
import kr.co.dondog.member.vo.MemberVO;

@Component
public class ScheduledTasks {

    private final AdminService adminservice;
    private final MailService mailService;

    @Autowired
    public ScheduledTasks(AdminService adminservice, MailService mailService) {
        this.adminservice = adminservice;
        this.mailService = mailService;
    }

    @Scheduled(cron = "0 35 15 * * ?")
    public void scheduledTask() {
        System.out.println("Scheduled task is running at: " + LocalDateTime.now());

        // 최근 접속일이 3일 지난 회원에게 메일 전송
//        List<MemberVO> members = adminservice.sleepMember();
//        for (MemberVO member : members) {
//            String to = member.getEmail();
            String to = "soojin9412@naver.com";
            String subject = "[Dondog] 서비스관련안내 ";
            String text = "안녕하세요 고객님\n" +
                    "돈독한 우리사이 돈독입니다.\n" +
                    "여러번의 신고 접수로 인해 서비스 이용이 중지될 예정입니다.\n"+
                    "신고 접수된 글은 마이페이지에서 확인이 가능하며,\n"+
                    "관련하여 문의사항이 있는 경우 해당 계정으로 문의 부탁드립니다.\n\n";

            mailService.sendMail(to, subject, text);
//        }
        
        
        
        
        

        adminservice.reportCountInc();
    }
}