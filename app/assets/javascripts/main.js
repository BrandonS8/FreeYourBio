navOpener = document.querySelector('.nav-opener')
nav = document.querySelector('nav')
main = document.querySelector('main')
navOpener.addEventListener('click', showNav)
var navOpenRotate = 0
nav.style.opacity = '0'
function showNav() {
  if (nav.style.opacity === '0') {
    nav.style.visibility = 'visible'
    nav.style.opacity = '1'
    navOpenRotate += 90
    if (navOpenRotate === 360) {
      navOpenRotate = 0
    }
    navOpener.style.transform = `rotate(${navOpenRotate}deg)`
    navOpener.style.color = '#fff'
  } else {
    nav.style.visibility = 'hidden'
    nav.style.opacity = '0'
    navOpenRotate += 90
    navOpener.style.transform = `rotate(${navOpenRotate}deg)`
    navOpener.style.color = '#333'
  }
}
