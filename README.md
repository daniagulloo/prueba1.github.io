<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Landing Compleja de Prueba</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body { margin: 0; font-family: 'Segoe UI', Arial, sans-serif; background: #f7f7fa; }
    header {
      background: #5e60ce;
      color: white;
      padding: 18px 0;
      text-align: center;
    }
    nav {
      margin-top: 12px;
    }
    nav a {
      color: white;
      text-decoration: none;
      margin: 0 16px;
      font-weight: 500;
      font-size: 16px;
    }
    nav a:hover { text-decoration: underline; }
    .hero {
      background: #fff;
      box-shadow: 0 4px 16px rgba(30,30,90,0.08);
      margin: 32px auto 0;
      max-width: 900px;
      border-radius: 18px;
      overflow: hidden;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: center;
      padding: 0;
    }
    .hero-img {
      flex: 1 1 320px;
      min-width: 320px;
      height: 320px;
      background: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80') center/cover;
    }
    .hero-content {
      flex: 2 1 400px;
      padding: 34px 28px;
      text-align: left;
    }
    .hero-content h1 {
      font-size: 2.5em;
      color: #2a2a6a;
      margin-bottom: 18px;
    }
    .hero-content p {
      font-size: 1.25em;
      color: #444;
      margin-bottom: 24px;
    }
    .btn-principal {
      background: #5e60ce;
      color: #fff;
      padding: 14px 36px;
      border: none;
      border-radius: 7px;
      font-size: 18px;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(30,30,90,0.09);
      transition: background 0.2s;
    }
    .btn-principal:hover { background: #3d3d8a; }
    .about {
      max-width: 900px;
      margin: 54px auto 0;
      padding: 0 20px;
    }
    .about h2 {
      color: #2a2a6a;
      text-align: center;
      margin-bottom: 28px;
      font-size: 2em;
    }
    .team-list {
      display: flex;
      flex-wrap: wrap;
      gap: 24px;
      justify-content: center;
    }
    .team-card {
      background: #fff;
      border-radius: 10px;
      padding: 28px 18px;
      box-shadow: 0 2px 12px rgba(30,30,90,0.09);
      text-align: center;
      width: 220px;
      min-width: 180px;
      margin-bottom: 12px;
    }
    .team-avatar {
      width: 72px;
      height: 72px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 14px;
      border: 2px solid #5e60ce;
    }
    .team-name {
      font-weight: 600;
      color: #2a2a6a;
      margin-bottom: 6px;
    }
    .team-role {
      color: #444;
      font-size: 15px;
      margin-bottom: 10px;
    }
    footer {
      background: #2a2a6a;
      color: #fff;
      text-align: center;
      padding: 22px 0 14px;
      margin-top: 48px;
    }
    .social-links a {
      margin: 0 10px;
      color: #fff;
      font-size: 23px;
      display: inline-block;
      text-decoration: none;
      transition: color 0.2s;
    }
    .social-links a:hover { color: #5e60ce; }
    @media (max-width: 900px) {
      .hero { flex-direction: column; }
      .hero-img, .hero-content { width: 100%; min-width: 0; }
      .about { padding: 0 10px; }
      .team-list { flex-direction: column; align-items: center; }
    }
  </style>
  <!-- Iconos para redes sociales -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
  <header>
    <div style="font-size:2em;font-weight:bold;">Mi Landing Compleja</div>
    <nav>
      <a href="#inicio">Inicio</a>
      <a href="#sobre">Sobre</a>
      <a href="#contacto">Contacto</a>
    </nav>
  </header>
  <section class="hero" id="inicio">
    <div class="hero-img"></div>
    <div class="hero-content">
      <h1>¡Bienvenido a tu nueva landing!</h1>
      <p>Esta página de prueba es más avanzada, lista para mostrar tu proyecto, equipo y destacar tu producto o servicio.</p>
      <button class="btn-principal" onclick="alert('¡Gracias por tu interés!')">Empieza ahora</button>
    </div>
  </section>
  <section class="about" id="sobre">
    <h2>Sobre nosotros</h2>
    <div class="team-list">
      <div class="team-card">
        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Avatar" class="team-avatar">
        <div class="team-name">Juan Pérez</div>
        <div class="team-role">Desarrollador Full Stack</div>
        <div>Apasionado por la tecnología y la innovación.</div>
      </div>
      <div class="team-card">
        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Avatar" class="team-avatar">
        <div class="team-name">Ana García</div>
        <div class="team-role">Diseñadora UX/UI</div>
        <div>Creadora de experiencias digitales memorables.</div>
      </div>
      <div class="team-card">
        <img src="https://randomuser.me/api/portraits/men/75.jpg" alt="Avatar" class="team-avatar">
        <div class="team-name">Luis Martínez</div>
        <div class="team-role">Marketing Digital</div>
        <div>Especialista en estrategias de crecimiento online.</div>
      </div>
    </div>
  </section>
  <footer id="contacto">
    <div class="social-links">
      <a href="https://twitter.com/" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
      <a href="https://facebook.com/" target="_blank" title="Facebook"><i class="fab fa-facebook"></i></a>
      <a href="https://instagram.com/" target="_blank" title="Instagram"><i class="fab fa-instagram"></i></a>
      <a href="mailto:contacto@ejemplo.com" title="Email"><i class="fas fa-envelope"></i></a>
    </div>
    <div style="margin-top:14px;font-size:14px;">&copy; 2025 Mi Landing Compleja</div>
  </footer>
</body>
</html>
