package com.kedu.persistence;

import com.kedu.domain.PopupDto;

public interface PopupDao {
	public void create(PopupDto pDto)throws Exception;
}
