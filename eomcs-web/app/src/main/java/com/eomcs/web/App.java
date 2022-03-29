package com.eomcs.web;

import javax.servlet.http.HttpSession;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class App {

  public static void main(String[] args) {
    SpringApplication.run(App.class, args);
  }

  // 1) 세션을 사용하지 않는 request handler
  @RequestMapping("/session/test1")
  String test1() {
    return "test1() 실행";
  }


  // 2) 세션을 사용하는 request handler
  // => HTTPSession 객체를 달라고 파라미터에 선언하라!

  @RequestMapping("/session/test2")
  String test2(String name, HttpSession session) {
    System.out.printf("test2() => %s\n", session.getId());
    return "test2() 실행";
  }

  // 3) 세션을 사용하는 REQUEST HANDLER
  // => 세션이 생성된 후에 요청하면 기존 세션 객체를 그대로 이용한다.
  // => 세션이 없는 상태에서 요청하면 새 세션 객체를 만든다.
  // => 세션이 있지만 무효한 상태일 경우 새 세션 객체를 만든다.
  @RequestMapping("/session/test3")
  String test3(String name, HttpSession session) {
    System.out.printf("test3() => %s\n", session.getId());
    return "test3() 실행";
  }


  @RequestMapping("/session/test4")
  String test4(String name, HttpSession session) {
    System.out.printf("test4() => %s\n", session.getId());
    session.invalidate(); // 요청한 클라이언트가 사용하는 현재 세션을 무효화 시킨다.
    return "test3() 실행";
  }
}
