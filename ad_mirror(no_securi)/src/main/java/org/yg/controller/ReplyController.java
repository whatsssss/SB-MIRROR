package org.yg.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.yg.domain.ReplyVO;
import org.yg.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/*")
@AllArgsConstructor
@Log4j
@CrossOrigin 
public class ReplyController {
	
	private ReplyService service;

	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		service.register(vo);
		log.info(vo);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@GetMapping("/{bno}/{page}") 
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable(name = "bno") Integer bno, @PathVariable(name = "page") Integer page){
		return new ResponseEntity<>(service.getSimpleList(bno),HttpStatus.OK);
	}
	
	@GetMapping("/{rno}")
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Integer rno){
		log.info("rno : "+ rno);
		return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
	}
	
	@DeleteMapping("/{rno}") 
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno){
		service.remove(rno);
		log.info(rno + " delete");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@PutMapping("/{rno}")
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo,@PathVariable("rno") Integer rno){
		service.modify(vo);
		log.info(vo);
		log.info(rno + " modify");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
}
