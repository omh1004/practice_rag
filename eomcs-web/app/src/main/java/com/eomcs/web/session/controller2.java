package com.eomcs.web.session;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class controller2 {
  // 1) 세션을 사용하지 않는 request handler
  @RequestMapping("/session/step1")
  String step1(String name, HttpSession session) {
    session.setAttribute("name", name);
    return "test2() 실행";
  }

  // 2) 세션을 사용하는 request handler
  // => HTTPSession 객체를 달라고 파라미터에 선언하라!

  @RequestMapping("/session/step2")
  String step2(int age, HttpSession session) {
    session.setAttribute("age", age);
    return "test2() 실행";
  }

  // 3) 세션을 사용하는 REQUEST HANDLER
  // => 세션이 생성된 후에 요청하면 기존 세션 객체를 그대로 이용한다.
  // => 세션이 없는 상태에서 요청하면 새 세션 객체를 만든다.
  // => 세션이 있지만 무효한 상태일 경우 새 세션 객체를 만든다.
  @RequestMapping("/session/step3")
  String step3(boolean working, HttpSession session) {
    session.setAttribute("working", working);
    return "test3() 실행";
  }


  @RequestMapping("/session/step4")
  HashMap step4(HttpSession session) {

    HashMap<String,Object> map = new HashMap<>();
    map.put("name", session.getAttribute("name"));
    map.put("age", session.getAttribute("age"));
    map.put("working", session.getAttribute("working"));
    
    
    return map;
  }
}
