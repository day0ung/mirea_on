package mirea.on.lotto.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
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
    @Column(name="RAFFLE_ROUND")
    private Long raffleRound;

    @Column(name="RAFFLE_DATE")
    private Date raffleDate;

    @Column(name="FIRST_WIN_COUNT")
    private Long firstWinCount;

    @Column(name="FIRST_WIN_AMOUNT")
    private Long firstWinAmount;

    @Column(name="SECOND_WIN_COUNT")
    private Long secondWinCount;

    @Column(name="SECOND_WIN_AMOUNT")
    private Long secondWinAmount;

    @Column(name="THIRD_WIN_COUNT")
    private Long thirdWinCount;

    @Column(name="THIRD_WIN_AMOUNT")
    private Long thirdWinAmount;

    @Column(name="FOURTH_WIN_COUNT")
    private Long fourthWinCount;

    @Column(name="FOURTH_WIN_AMOUNT")
    private Long fourthWinAmount;

    @Column(name="FIFTH_WIN_COUNT")
    private Long fifthWinCount;

    @Column(name="FIFTH_WIN_AMOUNT")
    private Long fifthWinAmount;

    @Column(name="BALL_ONE")
    private Long ballOne;

    @Column(name="BALL_TWO")
    private Long ballTwo;

    @Column(name="BALL_THREE")
    private Long ballThree;

    @Column(name="BALL_FOUR")
    private Long ballFour;

    @Column(name="BALL_FIVE")
    private Long ballFive;

    @Column(name="BALL_SIX")
    private Long ballSix;

    @Column(name="BALL_BONUS")
    private Long ballBonus;

    @Column(name="REG_DT")
    private Date regDt;

}
