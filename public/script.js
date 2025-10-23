// ===== Mobile Navbar Toggle =====
const menu = document.querySelector('#mobile-menu');
const navList = document.querySelector('.nav-list');

menu.addEventListener('click', () => {
  menu.classList.toggle('is-active');
  navList.classList.toggle('active');
});

// ===== Gallery Swipe for Mobile =====
let startX = 0;
let endX = 0;

const galleryContainer = document.querySelector('.gallery');

galleryContainer.addEventListener('touchstart', (e) => {
  startX = e.touches[0].clientX;
});

galleryContainer.addEventListener('touchend', (e) => {
  endX = e.changedTouches[0].clientX;
  if (startX - endX > 50) {
    // Swipe left -> Next
    currentIndex = (currentIndex + 1) % galleryImages.length;
    updateGallery();
  } else if (endX - startX > 50) {
    // Swipe right -> Previous
    currentIndex = (currentIndex - 1 + galleryImages.length) % galleryImages.length;
    updateGallery();
  }
});

// ===== Hero Slider =====
const heroImages = [
  "https://www.edmunds.com/assets/m/for-sale/a3-w1nyc7hj8lx361996/img-1-960x.jpg",
  "https://news.dupontregistry.com/wp-content/uploads/2017/10/RENNtech_AMG_GT_R_Orange_Beast_DuPont_02.jpg",
  "https://route66cars.in/storage/app/uploads/public/63e/222/975/63e222975451a182488607.jpeg",
  "https://scontent-los2-1.xx.fbcdn.net/v/t39.30808-6/518328215_3150368025118971_5709927890107397722_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=vJd39MMz5g8Q7kNvwG-VQgb&_nc_oc=AdkHiNQtBXubLOFO-Gqn6OXdrb2F1EPFDboDu5lFGBXgn7uyFo4Izj6jkuI89ZaiQkg&_nc_zt=23&_nc_ht=scontent-los2-1.xx&_nc_gid=JHcPQ17inMxv-WsmsmmVyg&oh=00_AfeDAPXypFsDtSsEdK2UcsLGMltZwa5w6cx-ZpqfSoZ6Fg&oe=68FF5403"
];

let heroIndex = 0;
const heroSection = document.querySelector(".hero");

function changeHeroBackground() {
  heroIndex = (heroIndex + 1) % heroImages.length;
  heroSection.style.opacity = 0;
  setTimeout(() => {
    heroSection.style.backgroundImage = `url('${heroImages[heroIndex]}')`;
    heroSection.style.opacity = 1;
  }, 500);
}

setInterval(changeHeroBackground, 5000);

// ===== Gallery Slider =====
const galleryImages = document.querySelectorAll('.gallery img');
const nextBtn = document.querySelector('.next');
const prevBtn = document.querySelector('.prev');
let currentIndex = 0;

// Show only the first image
function updateGallery() {
  galleryImages.forEach((img, idx) => {
    img.style.display = idx === currentIndex ? 'block' : 'none';
  });
}
updateGallery();

// Next & Previous buttons
nextBtn.addEventListener('click', () => {
  currentIndex = (currentIndex + 1) % galleryImages.length;
  updateGallery();
});

prevBtn.addEventListener('click', () => {
  currentIndex = (currentIndex - 1 + galleryImages.length) % galleryImages.length;
  updateGallery();
});

// Auto-slide every 5 seconds
setInterval(() => {
  currentIndex = (currentIndex + 1) % galleryImages.length;
  updateGallery();
}, 5000);