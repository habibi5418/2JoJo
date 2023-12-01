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

    @Scheduled(cron = "0 07 12 * * ?")
    public void scheduledTask() {
        System.out.println("Scheduled task is running at: " + LocalDateTime.now());

        // 최근 접속일이 3일 지난 회원에게 메일 전송
        List<MemberVO> members = adminservice.sleepMember();
        for (MemberVO member : members) {
            String to = member.getEmail();
            String subject = "[Dondog] 휴면계정 전환 안내 ";
            String text = "안녕하세요 고객님" +
                    "돈독한 우리사이 돈독입니다.\n" +
                    "회원님의 돈독 계정이 최근 1년간 로그인하지 않아 계정이 휴면 상태로 전환될 예정임을 안내드립니다."+
                    "관련하여 문의사항이 있는 경우 해당 계정으로 문의 부탁드립니다.\n\n";

            mailService.sendMail(to, subject, text);
        }
        
        
        
        
        

        adminservice.reportCountInc();
    }
}