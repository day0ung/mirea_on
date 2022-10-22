package mirea.on.lotto.controller;

import mirea.on.lotto.entity.Lotto;
import mirea.on.lotto.service.LottoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class LottoController {

    @Autowired
    LottoService service;

    @GetMapping("/test")
    public List<Lotto> getLottoList(){
        List<Lotto> listAll = service.getLottoList();
        return listAll;
    }

}
