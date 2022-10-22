package mirea.on.lotto.service;

import mirea.on.lotto.entity.Lotto;
import mirea.on.lotto.repo.LottoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LottoService {

    @Autowired
    LottoRepository repo;

    public List<Lotto> getLottoList() {
        List<Lotto> result = repo.findAll();
        return result;
    }
}
