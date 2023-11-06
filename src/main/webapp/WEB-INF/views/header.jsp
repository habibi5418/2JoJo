<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>title</title>
<!-- header.css : navigation bar -->
<!-- <link rel="stylesheet" href="/css/header_test.css">  -->
<style>


*{
  margin: 0px; 
  padding: 0px; 
  box-sizing: border-box;
}
  
  
 nav {
    display: flex; justify-content: space-around;
    align-items: center;
    /* 요소의 최소 너비 지정, height 속성 무시
    vh 단위는 브라우저 안쪽 높이(window. innerHeight)을 기준으로 설정된다. 하지만 태블릿이나, 모바일의 경우에는 뷰 포트에 따라 맞춰짐*/
    min-height: 8vh; 
    background-color: #504954; 
    /* font-family: "Poppins", sans-serif; */
 }


.logo {
  color: rgb(226, 226, 226); 
  text-transform: uppercase;
  letter-spacing: 2px; /* 각 글자 2px씩 간격을 줌*/
  font-size: 18px;
  }

.nav-links {
    width: 40%;
    display: flex; 
    justify-content: space-around;
  }
  
  .nav-links li {
  list-style: none;
  }

  .nav-links a {
  color: rgb(226, 226, 226); 
  text-decoration: none; 
  letter-spacing: 3px; 
  font-weight: bold; 
  font-size: 14px;
  }

.burger {
  display: none; 
  cursor: pointer;
}

.burger div { 
  width: 25px; 
  height: 3px;
  background-color: rgb(226, 226, 226); 
  margin: 5px;
  transition: all 0.3s ease;
}

@media screen and (max-width: 1024px) {
  .nav-links {
    width: 60%;
  }
}

@media screen and (max-width: 768px) {
  body {
    overflow-x: hidden;
  }

  /* .nav-links {
    position: absolute;
    top: 8vh;
    right: 0;
    height: 92vh;
    background-color: #504954;
    flex-direction: column;
    align-items: center;
    width: 50%;
    transform: translateX(100%);
  }

  .nav-links li {
    opacity: 0;
  }

  .burger {
    display: block;
  }

  .nav-active {
    transform: translateX(0%);
  } */
  .nav-links {
    position: absolute;
    top: 8vh;
    right: 0;
    width: 100%; /* 전체 너비 사용 */
    transform: translateY(-100%); /* 수직 이동 대신 수평 이동 */
  }

  .nav-links li {
    opacity: 0;
  }

  .burger {
    display: block;
  }

  .nav-active {
    transform: translateY(0%); /* 수직 이동 대신 수평 이동 */
  }
  
  @keyframes navLinkFade {
    from {
      opacity: 0;
      transform: translateX(5px);
    }
    to {
      opacity: 1;
      transform: translateX(0);
    }
  }
}

.toggle .linel {
  transform: rotate(-45deg) translate(-5px, 6px);
}
.toggle .line2 {
  opacity: 0;
}
.toggle .line3 {
  transform: rotate(45deg) translate(-5px, -6px);
}


</style>
</head>
<body>
    <header>
      <nav>
        <div class="logo"> 
            <h4>The Nav</h4>
        </div>
        <ul class="nav-links">
          <li><a href="#">Home</a></li> 
          <li><a href="#">MATCH</a></li> 
          <li><a href="#">CHAT</a></li> 
          <li><a href="#">MYPAGE</a></li>
          <!-- <li><a href="#">알림</a></li>
          <li><a href="#">실시간위치</a></li> -->
          <li><a href="<c:url value='/login'/>">로그인</a></li> 
        </ul>
        <div class="burger">
          <div class="linel"></div> 
          <div class="line2"></div> 
          <div class="line3"></div>
        </div>
      </nav>
    </header>
</body>
<script>

const burger = document.querySelector(".burger");
const nav = document.querySelector(".nav-links");
const navlinks = document.querySelectorAll(".nav-links li");

const navAnimation = () => {
  navlinks.forEach((link, index) => {
    // 애니메이션이 있을 때
    if (link.style.animation) {
      // 애니메이션 비움
      link.style.animation = '';
    } else {
      // 애니메이션 없을 때 애니메이션을 추가 1/ 딜레이 간격을 줘서 하나씩 차례대로 나타나도록 설정
      link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;
    }
  });
};


const handleNav = () => {
  nav.classList.toggle("nav-active");
  //nav Animation
  navAnimation();
  //burger Animation
  burger.classList.toggle("toggle");
  };

  const navSlide = () => {
    burger.addEventListener("click", handleNav);
  };

  const setNavTransition = (width) => {
    if (width > 768) {
      nav.style.transition = "";
    } else {
      nav.style.transition = "transform 0.5s ease-in";
    }
  };

const handleResize = (event) => { // event 매개변수를 추가
  const width = event.target.innerWidth;
  setNavTransition(width);
};

const init = () => {
  // Toggle Nav
  window.addEventListener("resize", handleResize); // event 매개변수가 필요합니다.
  navSlide();
};
init();

</script>
</html>