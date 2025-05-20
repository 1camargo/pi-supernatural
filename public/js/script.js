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

  document.addEventListener('DOMContentLoaded', () => {
    const elementos = document.querySelectorAll('.fade-in-scroll');

    const observer = new IntersectionObserver((entradas, observer) => {
      entradas.forEach(entrada => {
        if (entrada.isIntersecting) {
          entrada.target.classList.add('visible');
          observer.unobserve(entrada.target);
        }
      });
    }, {
      rootMargin: '0px 0px -50px 0px',
    });
    elementos.forEach(el => observer.observe(el));
  });