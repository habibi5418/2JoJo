<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<style>

  * {
    box-sizing: border-box;
    font-family: 'Noto Serif KR', serif;

  }

  :root {
    --white: #fff;
    --black: #000;
    --bg: white;
    --grey: #999;
    --dark: #1a1a1a;
    --light: #e6e6e6;
    --wrapper: 1000px;
    --blue: red;
  }



  body {
    background-color: var(--bg);
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-rendering: optimizeLegibility;
    background-color: transparent;
    /* background-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/image.jpg'); */
    background-size: cover;
    background-repeat: no-repeat;
  }

  /* Wrapper Styles */
  .wrapper {
    position: relative;
    left: 50%;
    width: var(--wrapper);
    height: 800px;
    transform: translate(-50%, 0);
  }

  /* Container Styles */
  .container {
    position: relative;
    top: 50%;
    left: 50%;
    width: 80%;
    height: 75%;
    background-color: var(--white);
    transform: translate(-50%, -50%);
  }

  /* Left Column Styles */
  .left {
    float: left;
    width: 37.6%;
    height: 100%;
    border: 1px solid var(--light);
    background-color: var(--white);
  }

  /* Top Section Styles */
  .top {
    position: relative;
    width: 100%;
    height: 96px;
    padding: 29px;

  }

  .top :after {
    position: absolute;
    bottom: 0;
    left: 50%;
    display: block;
    width: 80%;
    height: 1px;
    content: '';
    background-color: var(--light);
    transform: translate(-50%, 0);
  }

  /* Input Styles */
  input {
    float: left;
    width: 188px;
    height: 42px;
    padding: 0 15px;
    border: 1px solid var(--light);
    background-color: #eceff1;
    border-radius: 21px;
    font-family: 'Source Sans Pro', sans-serif;
    font-weight: 400;

  }

  input:focus {
    outline: none;
  }

  /* Search Link Styles */
  .search {
    display: block;
    float: left;
    width: 42px;
    height: 42px;
    margin-left: 10px;
    border: 1px solid var(--light);
    background-color: orange;
    background-repeat: no-repeat;
    background-position: top 12px left 14px;
    border-radius: 50%;
  }

  /* People Section Styles */
  .people {
    margin-left: -1px;
    border-right: 1px solid var(--light);
    border-left: 1px solid var(--light);
    width: calc(100% + 2px);

  }

  /* Person Styles */
  .person {
    position: relative;
    width: 100%;
    padding: 12px 10% 16px;
    cursor: pointer;
    background-color: var(--white);
  }

  .person :after {
    position: absolute;
    bottom: 0;
    left: 50%;
    display: block;
    width: 80%;
    height: 1px;
    content: '';
    background-color: var(--light);
    transform: translate(-50%, 0);
  }


.people .person img {
    
    float: left;
    width: 60px !important;
    height: 60px;
    margin-right: 12px;
    border-radius: 50%;
    object-fit: cover;  
}

  .people .person .name {
    font-size: 22px;
    line-height: 22px;
    color: black;
    text-align: center;
    display: block;

  }
.people .person .time {
  font-size: 14px;
    position: absolute;
    top: 16px;
    right: 10%;
    padding: 0 0 5px 5px;
    color: var(--grey);
    background-color: var(--white);
}

.people .person .preview {
  font-size: 14px;
    display: inline-block;
    overflow: hidden !important;
    width: 70%;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: var(--grey);
}



  .people .persoon .active,
  .people .persoon:hover {
    margin-top: -1px;
    margin-left: -1px;
    padding-top: 13px;
    border: 0;
    background-color: var(--blue);
    width: calc(100% + 2px);
    padding-left: calc(10% + 1px);
  }

  .people .person span {
    color: white;
    background: transparent;
  }

  .people .person:after {
    display: none;
  }

  /* Right Column Styles */
  .right {
    border: 2px solid orange;
    position: relative;
    float: left;
    width: 62%;
    height: 100%;
  }

  /* Top Section Styles */
  .right .top {
    border: 2px solid black;
    width: 100%;
    height: 47px;
    padding: 15px 29px;
    background-color: #eceff1;
  }

  .right .top span {
    font-size: 15px;
    color: var(--grey);

  }

  .right .top .name {
    color: var(--dark);
    font: bold;
  }

  /* Chat Section Styles */
  .right .top .chat {
    
    position: relative;
    display: none;
    overflow: hidden;
    /* padding: 0 35px 92px; */
    padding: 20px;
    border-width: 1px 1px 1px 0;
    border-style: solid;
    border-color: var(--light);
    height: calc(100% - 48px);
    justify-content: flex-end;
    flex-direction: column;
  }

  .chat {
    height: 140px;
    border: 2px solid yellowgreen;
  }



  .right .top .chat .active-chat {
    display: block;
    /* display: flex; */
  }

  /* Write Section Styles */
  .write {
    position: absolute;
    bottom: 29px;
    left: 30px;
    height: 42px;
    padding-left: 8px;
    border: 1px solid var(--light);
    width: calc(100% - 58px);
    border-radius: 5px;
    background-color: blueviolet;
  }

  .write input {
    font-size: 16px;
    float: left;
    width: 350px;
    height: 40px;
    padding: 10px;
    color: black;
    outline: none;
    background-color: white;
  }

  /* Write Link Styles */
  .write .write-link .attach:before {
    display: inline-block;
    /* float: left; */
    width: 20px;
    height: 42px;
    content: '';
    background-repeat: no-repeat;
    background-position: center;
  }


  /* Bubble Styles */
  .bubble {
    /* display: block; */
    margin-left: 25px;
    margin-right: 25px;
    width:80%;
    height: 50px;
    border-radius: 10px;
    /* border: 2px solid black; */
    font-size: 16px;
    position: relative;
    display: inline-block;
    clear: both;
    background-color: gray;
  }

  /* 상단 시가 */
  .bubble_send_time{
    display: flex;
    font-size: 10px;
    text-align: center;
  }

  .bubble span {
    text-align: center;
  }

    .bubble .you {
      float: left;
      color: white;
      align-self: flex-start;
      /* animation-name: slideFromLeft; */
      width: 100px;
      background-color: aqua;
    }

    .bubble_you_msg{
      margin-left: 25px;
      font-size: 18px;
    }

    .bubble_you_sendtime {
      float: right;
      margin: 0;
    }

    .bubble_me {
      background-color: orange;
      float: right;
      margin-left: 25px;
      margin-right: 25px;
      width:80%;
      height: 50px;
       border-radius: 10px;
      font-size: 16px;
      position: relative;
      display: inline-block;
      clear: both;
      margin-bottom: 8px;
    }

    .bubble_me_msg{
      text-align: right;
      margin-right: 25px;
    }
/* 
    .bubble .me {
      float: right;
      color: var(--dark);
      
      align-self: flex-end;
      
    } */
/* 
    .bubble .me:before {
        right: -3px;
        background-color: #eceff1;
      } */


  /* Conversation Start Styles */
  .conversation-start {
    
    background-color: black;

    position: relative;
    width: 100%;
    margin-bottom: 27px;
    text-align: center;
    }
    

    /* 시간 */
    .conversation-start span {
      font-size: 14px;
      display: inline-block;
      color: yellow;
    }
    


    .conversation-start span:before, 
    .conversation-start:after {
      position: absolute;
        top: 10px;
        display: inline-block;
        width: 100%;
        height: 1px;
        content: '';
    }
    .conversation-start span:before{
      left: 0;
    }
    
    .conversation-start span:after{
        right: 0;
    }

    #btn_send {
      display: inline-block;
      padding: 0;
      margin: 0;
      width: 70px;
      font-size: 20px;
      height: 40px; 
      color: black;
      background-repeat: no-repeat;
      background-position: center;
    }



</style>

<body>
  <div class="wrapper">
    <div class="container">
      <div class="left">
        <div class="top">
          <input type="text" placeholder="Search" />
        </div>
        <ul class="people">
          <li class="person" data-chat="person1">
            <img src="images/developer2.png" style="width: 80px;" alt="" />
            <span class="name">Thomas Bangalter</span>
            <span class="time">2:09 PM</span>
            <span class="preview">I was wondering...</span>
          </li>


          <li class="person" data-chat="person6">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/drake.jpg" alt="" />
            <span class="name">Drake</span>
            <span class="time">2:09 PM</span>
            <span class="preview">howdoyoudoaspace</span>
          </li>
        </ul>
      </div>



      <div class="right">
        <div class="top"><span>To: <span class="name">Dog Woofson</span></span></div>
        
        <div class="chat" >
          <div class="conversation-start">
            <span>Today, 6:48 AM</span>
          </div>

          <div class="bubble you">
            <p class="bubble_you_msg"> hi </p>
            <p class="bubble_you_sendtime"> 2023.01.02 </p>
          </div>
        </div>

        <div class="chat" data-chat="person3">
          <div class="conversation-start">
            <span>Today, 3:38 AM</span>
          </div>
          <div class="bubble_me">
            <p class="bubble_me_msg"> hi </p>
            <p class="bubble_me_sendtime"> 2023.01.02 </p>
          </div>
        </div>

        <div class="write">
          <input type="text" />
          <button class="write-link send" id="btn_send">SEND</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    document.querySelector('.chat[data-chat=person2]').classList.add('active-chat')
    document.querySelector('.person[data-chat=person2]').classList.add('active')

    let friends = {
      list: document.querySelector('ul.people'),
      all: document.querySelectorAll('.left .person'),
      name: ''
    },
      chat = {
        container: document.querySelector('.container .right'),
        current: null,
        person: null,
        name: document.querySelector('.container .right .top .name')
      }

    friends.all.forEach(f => {
      f.addEventListener('mousedown', () => {
        f.classList.contains('active') || setAciveChat(f)
      })
    });

    function setAciveChat(f) {
      friends.list.querySelector('.active').classList.remove('active')
      f.classList.add('active')
      chat.current = chat.container.querySelector('.active-chat')
      chat.person = f.getAttribute('data-chat')
      chat.current.classList.remove('active-chat')
      chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat')
      friends.name = f.querySelector('.name').innerText
      chat.name.innerHTML = friends.name
    }

  </script>

</body>

</html>