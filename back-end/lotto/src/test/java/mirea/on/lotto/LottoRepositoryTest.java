package mirea.on.lotto;

import mirea.on.lotto.entity.Lotto;
import mirea.on.lotto.repo.LottoRepository;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(locations = "classpath:application.yml")
public class LottoRepositoryTest {
    @Value("${spring.datasource.url}")
    private String URL;
    @Value("${spring.datasource.driver-class-name}")
    private String DRIVERNAME;
    @Value("${spring.datasource.username}")
    private String USERNAME;
    @Value("${spring.datasource.password}")
    private String PASSWORD;
    @Autowired
    LottoRepository repo;

    @Test
    void connTest() throws SQLException, ClassNotFoundException {
        Class.forName(DRIVERNAME);
        try(Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
            System.out.println("connTest: "+conn);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    void queryTest() throws SQLException, ClassNotFoundException {
        List<Lotto> result = repo.findAll();
        System.out.println("queryTest: "+result);
    }

}
