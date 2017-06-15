package com.kedu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.domain.SampleVO;

@RestController
@RequestMapping("/sample")
public class SampleController {
	
	@RequestMapping("/hello")
	public String sayHello(){
		return "hello World";
	}
	
	@RequestMapping("/sendVO")
	public SampleVO sampleVO(){
		SampleVO vo = new SampleVO();
		
		vo.setFirstName("길동");
		vo.setLastName("홍");
		vo.setMno(123);
		
		return vo;
	}
	
	@RequestMapping("/sendList")
	public List<SampleVO> sendList(){
		
		List<SampleVO> list = new ArrayList<SampleVO>();
		
		for(int i=0; i<=10; i++){
			SampleVO vo = new SampleVO();
			vo.setFirstName("길동");
			vo.setLastName("채");
			vo.setMno(i);
			
			list.add(vo);
		}
		return list;
	}
	
	@RequestMapping("/sendMap")
	public Map<Integer, SampleVO> sendMap(){
		Map<Integer,SampleVO> map = new HashMap<>();
		
		for(int i=0; i<=10; i++){
			SampleVO vo = new SampleVO();
				vo.setFirstName("민병");
				vo.setLastName("채");
				vo.setMno(i);
				
				map.put(i, vo);
		}
		return map;
	}
	
	@RequestMapping("/sendErrorAuth")
	public ResponseEntity<Void> sendListAuth(){
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
}
