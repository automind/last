package com.kedu.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.domain.PopupDto;
import com.kedu.persistence.PopupDao;

@Service
public class PopupServiceImpl implements PopupService {
	
	@Inject
	public PopupDao pdao;
	
	@Override
	public void regist(PopupDto pDto) throws Exception {
		pdao.create(pDto);
	}

}
