<template>
  <section class="background-section">
    <div class="content-top">
      <h1>Легенди доріг: Ретро мотоцикли <br> Відкрийте нові, пізнавайте старі!</h1>
      <p>На цьому сайті, ви знайдете корисну інформацію про мотоцикли та можете зберігати свої улюблені ретро моделі.</p>
      <div class="links">
        <a href="#/motorcycle-brands" class="green-link">Переглянути доступні</a>
      </div>
    </div>
  </section>
  <section class="about-us">
    <h2>Про нас</h2>
    <div class="about-div">
      <div class="img">
        <img src="../assets/about-img.jpg" alt="">
      </div>
      <p>Наша система - це вікно в світ ретро мотоциклів. Ви зможете насолодитися переглядом унікальних моделей, які відзначилися своїм стилем та історією. 
        Додавання мотоциклів до вашого кабінету улюблених - це простий спосіб зберігати ваші фаворити, що стали символами епохи.
      </p>
    </div>
  </section>
  <section class="popular-section" id="popular-section">
    <h2>Найпопулярніші мотоцикли</h2>
  </section>
  <section class="icons-section">
    <div class="cube">
      <i class="fa-solid fa-motorcycle"></i>
      <h3>Пошук байків</h3>
      <p>Знаходь різноманітні ретро мотоцикли</p>
    </div>
    <div class="cube">
      <i class="fa-solid fa-heart"></i>
      <h3>Додавай улюблені</h3>
      <p>Зберігай найцікавіші марки в особистому кабінеті</p>
    </div>
    <div class="cube">
      <i class="fa fa-clock"></i>
      <h3>24/7</h3>
      <p>Цілодобова робота системи</p>
    </div>
  </section>
  <section class="join-section">
    <div class="contents">
      <h2>Ще не приєднався?</h2>
      <div class="content">
        <div class="text">
          <p>Реєструйся та поринай в світ ретро мотоциклів!</p>
        </div>
        <div class="button">
          <a href="#/login" class="join-button">Увійти</a>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>

<style scoped>
/* background-section */
.background-section {
  background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url('../assets/background-top.jpg');
  background-size: cover;
  background-position: center;
  color: white;
  padding: 50px;
  text-align: center;
}
.content-top {
  max-width: 800px;
  margin: 200px auto 160px;
  background: rgba(0, 0, 0, 0.8);
  padding: 10px;
}
.content-top h1 {
  font-weight: 600;
  font-size: 40px;
  line-height: 73px;
  font-family: 'Noto Sans';
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  letter-spacing: -1.34px;
  color: #F2F6FB;
}
.content-top p {
  font-size: 20px;
  font-family: 'Noto Sans';
  font-style: normal;
  font-weight: 400;
  line-height: 180%;
  color: #E9F0F8;
}
.links {
  margin: 30px auto 20px;
}
.links a {
  display: inline-block;
  padding: 15px 20px;
  text-decoration: none;
  border-radius: 5px;
  font-family: 'Noto Sans';
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  line-height: 24px;
}
.green-link {
  background-color: #FF8636;
  color: white;
  background: linear-gradient(to left, #c77843 50%, #FF8636 50%) right;
  background-size: 200%;
  transition: 0.7s ease-out;
}
.white-link {
  background-color: white;
  color: black;
  background: linear-gradient(to left, white 50%, #808080 50%) right;
  background-size: 200%;
  transition: 0.7s ease-out;
}
.white-link:hover, .green-link:hover {
  background-position: left;
}
.scroll-button a {
  display: inline-block;
  padding: 10px 20px;
  background-color: #333;
  color: white;
  text-decoration: none;
  border-radius: 5px;
}

/* about us */
section h2 {
  text-align: center;
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 600;
  font-size: 40px;
  line-height: 50px;
  text-align: center;
  color: #141414;
  border-bottom: 3px solid #FF8636;
  padding: 5px 10px 15px;
  width: 350px;
  margin: 70px auto 50px;
}
.about-div {
  display: flex;
  align-items: center;
  width: 1350px;
  margin: 0 auto;
  gap: 45px;
}
.about-div img {
  width: 750px;
  height: 500px;
  object-fit: cover;
  border-radius: 45px;
  border: 1px solid #FF8636;
}
.about-div p {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 400;
  font-size: 20px;
  line-height: 40px;
  color: #575757;
  text-align: justify;
}

/* popular-section */


/* icons-section */
.icons-section {
  background-color: black;
  color: #FF8636;
  padding: 100px;
  display: flex;
  justify-content: center;
  text-align: center;
  gap: 50px;
  font-family: 'Montserrat';
}
.icons-section .cube {
  border: 1px solid #FF8636;
  padding: 40px;
  width: 250px;
}
.icons-section .cube h3, p {
  color: white;
}
.icons-section .cube i {
  font-size: 45px;
  margin-bottom: 10px;
}

/* join-section */
.join-section {
  background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url('../assets/background-top.jpg');
  background-size: cover;
  background-position: center;
  color: #fff;
  padding: 50px 0;
}
.join-section h2 {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 600;
  font-size: 30px;
  line-height: 38px;
  color: #FFFFFF;
}
.join-section p {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 400;
  font-size: 16px;
  line-height: 180%;
  color: #FFFFFF;
}
.join-section .contents {
  background: rgba(0, 0, 0, 0.8);
  max-width: 800px;
  margin: 0 auto;
  padding: 20px 40px 40px;
}
.join-section .contents h2 {
  margin-top: 20px;
}
.join-section .content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.join-section .text {
  flex: 1;
}
.join-section .button {
  margin-left: 20px;
}
.join-section .join-button {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 500;
  font-size: 20px;
  line-height: 24px;
  color: #212529;
  background-color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border-radius: 5px;
  transition: background-color 0.3s;
}
.join-section .join-button:hover {
  background-color: #FF8636;
}

</style>
