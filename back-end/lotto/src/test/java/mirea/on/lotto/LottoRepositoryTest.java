package mirea.on.lotto;

import mirea.on.lotto.entity.Lotto;
import mirea.on.lotto.repo.LottoRepository;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LottoRepositoryTest {
    @Autowired
    LottoRepository repo;

    @Test
    @Transactional
    public void test(){
        List<Lotto> lotto =  repo.findAll();
        System.out.println(lotto);

    }
}
