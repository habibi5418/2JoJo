package kr.co.dondog.admin.scheduled;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.dondog.admin.service.AdminService;
import kr.co.dondog.admin.service.EmailService;
import kr.co.dondog.member.vo.MemberVO;

@Component
public class ScheduledTasks {

    private final AdminService adminservice;
    private final EmailService emailService;

    @Autowired
    public ScheduledTasks(AdminService adminservice, EmailService emailService) {
        this.adminservice = adminservice;
        this.emailService = emailService;
    }

    @Scheduled(cron = "0 14 15 * * ?")    
    public void scheduledTask() {
        System.out.println("Scheduled task is running at: " + LocalDateTime.now());

        // 최근 접속일이 3일 지난 회원에게 메일 전송
        List<MemberVO> members = adminservice.sendEmail();
        for (MemberVO member : members) {
            String to = member.getEmail();
            String subject = "중요: 돈독 서비스 이용 중지 안내";
            String text = "안녕하세요 " + member.getMname() + "님,\n\n" +
                    "돈독한 우리사이 돈독입니다.\n" +
                    "고객님에게 5번의 신고가 들어와 돈독 서비스 이용이 중지되었습니다.\n" +
                    "관련하여 문의사항이 있는 경우 해당 계정으로 문의 부탁드립니다.\n\n";

            emailService.sendMail(to, subject, text);
        }

        adminservice.reportCountInc();
    }
}