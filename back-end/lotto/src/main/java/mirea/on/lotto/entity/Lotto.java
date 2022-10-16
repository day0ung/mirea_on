package mirea.on.lotto.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity // 영속성 컨텍스트에 의해 관리되는 클래스를 의미
@Table(name = "LOTTO_INFO") // 엔티티에 매핑되는 DB 테이블 명
@Getter @Setter @ToString //lombok을 추가해야 사용가능

public class Lotto {

    @Id // 기본키가 될 변수를 의미
    private Long id;

    private Long raffleRound;
    private Date raffleDate;
    private Long firstWinCount;
    private Long firstWinAmout;
    private Long secondWinCount;
    private Long secondWinAmout;
    private Long thirdWinCount;
    private Long thirdWinAmout;
    private Long fourthWinCount;
    private Long fourthWinAmout;
    private Long fifthWinCount;
    private Long fifthWinAmout;
    private Long ballOne;
    private Long ballTwo;
    private Long ballThree;
    private Long ballFour;
    private Long ballFive ;
    private Long ballSix;
    private Long ballBonus;

}
