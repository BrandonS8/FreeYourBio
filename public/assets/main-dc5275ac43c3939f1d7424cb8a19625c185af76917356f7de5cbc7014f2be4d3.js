// All custom JS is here

// Navigation
var navOpener = document.querySelector('.nav-opener')
var nav = document.querySelector('nav')
var main = document.querySelector('main')
if (navOpener) {
  navOpener.addEventListener('click', showNav)
}
var navOpenRotate = 0
if (nav) {
  nav.style.opacity = '0'
}
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

// Link Form
var selection = document.querySelector('.form-select')
var urlLabel = document.querySelector('.form-url-label')
var url = document.querySelector('.form-url')
var img = document.querySelectorAll('.form-img')
var imgNeeded = ['Other']
if (img.length > 0) {
  checkForImageNeeded()
}
if (selection) {
  selection.addEventListener('change', () => {
    if (
      selection.value === 'Snapchat' ||
      selection.value === 'Twitter' ||
      selection.value === 'Instagram'
    ) {
      url.type = 'text'
      urlLabel.innerHTML = '#USERNAME'
    } else {
      url.type = 'url'
      urlLabel.textContent = '#URL'
    }
    checkForImageNeeded()
  })
}

function checkForImageNeeded() {
  if (imgNeeded.includes(selection.value)) {
    img[0].style.display = 'initial'
    img[1].style.display = 'initial'
  } else {
    img[0].style.display = 'none'
    img[1].style.display = 'none'
  }
}
var deleteButton = document.querySelector('.link-delete-button')
var deleteCheck = document.querySelector('.confirm-delete')
if (deleteCheck) {
  deleteCheck.addEventListener('change', e => {
    if (e.target.checked) {
      deleteButton.classList.remove('link-disabled')
    } else {
      deleteButton.classList.add('link-disabled')
    }
  })
}
;
