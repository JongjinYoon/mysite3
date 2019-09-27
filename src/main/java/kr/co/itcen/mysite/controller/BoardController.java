package kr.co.itcen.mysite.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.mysite.service.BoardService;
import kr.co.itcen.mysite.vo.BoardVo;
import kr.co.itcen.mysite.vo.UserVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String index(Model model) {
		List<BoardVo> list = boardService.getList();
		model.addAttribute("list", list);

		return "board/list";
	}

	@RequestMapping(value = "/view/{no}", method = RequestMethod.GET)
	public String view(@PathVariable("no") Long no, HttpSession session, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		model.addAttribute("authUser", authUser);

		List<BoardVo> list = boardService.getList();
		model.addAttribute("list", list);
		model.addAttribute("no", no);

		return "board/view";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		model.addAttribute("authUser", authUser);
		return "board/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute BoardVo vo) {
		
		if(vo.getgNo() != "" && vo.getoNo() != "" && vo.getDepth() != "") {
			boardService.update(vo.getgNo(), vo.getoNo());
			boardService.commentInsert(vo);
		} else {
			boardService.insert(vo);
		}
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/write/{gNo}/{oNo}/{depth}", method = RequestMethod.GET)
	public String commentWrite(HttpSession session, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		model.addAttribute("authUser", authUser);
		return "board/write";
	}
	
//	@RequestMapping(value = "/write/{gNo}/{oNo}/{depth}", method = RequestMethod.POST)
//	public String write(@PathVariable("gNo") String gNo, //스트링으로 다시 고치고 parseInt해야함
//			@PathVariable("oNo") String oNo, 
//			@PathVariable("depth") String depth, @ModelAttribute BoardVo vo ) {
//		
//			boardService.update(gNo, oNo);
//			boardService.commentInsert(vo);
//		
//		return "redirect:/board/list";
//	}
}
