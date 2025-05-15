window.addEventListener('DOMContentLoaded', () => {
  const navbar = document.querySelector('.navbar');
  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });

  document.querySelectorAll('.card').forEach(card => {
    card.addEventListener('click', () => {
      card.classList.toggle('virado');
    });
  });
});