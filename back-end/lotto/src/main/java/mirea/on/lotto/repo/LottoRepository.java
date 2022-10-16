package mirea.on.lotto.repo;

import mirea.on.lotto.entity.Lotto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LottoRepository extends JpaRepository<Lotto, Integer> {
}
