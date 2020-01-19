package org.yg.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yg.domain.*;
import org.yg.mapper.MemberMapper;
import org.yg.service.BoardService;
import org.yg.service.DashService;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private DashService dash; 
	
	@Autowired
	private MemberMapper memberMapper;
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		log.info("get register...........");
	}
	
	@GetMapping("/gallery")
	public void gallery(MemberVO vo, Model model) {
		vo = memberMapper.info("tnqja");
		model.addAttribute("vo",vo);
		log.info("access gallery...");
		log.info(vo);
	}
	
	@GetMapping("/dashboard")
	public void dashboard(AdVO ad, Model model) {
		log.info("dashboard......");
		model.addAttribute("ad", dash.getList("user00"));
		model.addAttribute("cus",dash.collect("user00"));
	}
	
	@GetMapping("/map")
	public void map() {
		log.info("map......");
	}
	
	@GetMapping("/main")
	public void main() {
		log.info("main......");
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("vo : " + vo);
		Integer newBno = service.register(vo);
		rttr.addFlashAttribute("result", newBno);
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("listpage...");
		int totalcount = service.getListCount(cri);
		PageMaker pm = new PageMaker(cri, totalcount);
		model.addAttribute("pm", pm);
		model.addAttribute("list1", service.getList1(cri));
		if (cri.getPage() == 1) {
			model.addAttribute("list", service.listAll());
		}
	}
	
	@GetMapping({"/read","/modify"})
	public void read( @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("bno: " + cri.getBno());
		model.addAttribute("vo", service.get(cri.getBno()));
		
	}
	
	@PreAuthorize("principal.vo.userName == #vo.writer")
	@PostMapping("/modify")
	public String modify(BoardVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.modify(vo);
		rttr.addFlashAttribute("result", "Modify");
		return "redirect:/board/list" + cri.getLink();
	}
	
	@PreAuthorize("principal.vo.userName == #writer")
	@PostMapping("/remove")
	public String remove(@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("Writer : "+writer );
		log.info("bno: " + cri.getBno());
	//	int count = service.remove(cri.getBno());
		rttr.addFlashAttribute("result", "Remove");
		cri.setPage(1);
		return "redirect:/board/list"+cri.getLink();
		
	}
	
	@GetMapping("/getAttachList")
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Integer bno){
		log.info("GetAttachList : " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("Delete AttachFiles.....");
		log.info("AttachFiles : "+attachList);
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("Delete file error"+e.getMessage());
			}
		});
	}
	
	
}
