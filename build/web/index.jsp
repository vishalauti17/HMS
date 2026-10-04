<%-- 
    Document   : index
    Created on : 02-Apr-2026, 4:03:30 pm
    Author     : user5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Navigation Bar */
        .navbar {
            background: #2c3e50;
            color: white;
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo span {
            color: #3498db;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
        }

        .nav-links a:hover {
            color: #3498db;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 0 5%;
            margin-top: 60px;
        }

        .hero-content {
            flex: 1;
            color: white;
        }

        .hero-content h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn-primary {
            background: white;
            color: #667eea;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-secondary {
            background: transparent;
            color: white;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            border: 2px solid white;
            text-decoration: none;
            border-radius: 5px;
        }

        .hero-image {
            flex: 1;
            text-align: center;
            font-size: 200px;
        }

        /* Features Section */
        .features {
            padding: 5rem 5%;
            background: #f8f9fa;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title h2 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            font-size: 2rem;
        }

        .feature-card h3 {
            color: #333;
            margin-bottom: 1rem;
        }

        /* Stats Section */
        .stats {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 4rem 5%;
            color: white;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            text-align: center;
        }

        .stat-item {
            padding: 2rem;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 1rem;
            }

            .nav-links {
                flex-direction: column;
                width: 100%;
                margin-top: 1rem;
            }

            .hero {
                flex-direction: column;
                text-align: center;
                padding-top: 2rem;
            }

            .hero-content h1 {
                font-size: 2.5rem;
            }

            .hero-buttons {
                justify-content: center;
            }
        }
    </style>
    </head>
    <body>
    
    <nav class="navbar">
        <div class="logo">
            🏠 Hostel<span>Manager</span>
        </div>
        <div class="nav-links">
            <a href="#home">Home</a>
            <a href="#features">Features</a>
            <a href="#contact">Contact</a>
        </div>
    </nav>

    <section class="hero" id="home">
        <div class="hero-content">
            <h1>Welcome to Hostel Management System</h1>
            <p>Efficiently manage your hostel with our comprehensive solution. Student management, room allocation, fee tracking, and complaint handling all in one place.</p>
            <div class="hero-buttons">
                <a href="Student_Login.jsp" class="btn-primary">👨‍🎓 Student Portal</a>
                <a href="Admin_Login.jsp" class="btn-secondary">👨‍💼 Admin Portal</a>
            </div>
        </div>
        <div class="hero-image">
            🏢
        </div>
    </section>

    <section class="features" id="features">
        <div class="section-title">
            <h2>Our Features</h2>
            <p>Everything you need to manage your hostel efficiently</p>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">👥</div>
                <h3>Student Management</h3>
                <p>Manage student details, registration, and personal information in one place.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🛏️</div>
                <h3>Room Allocation</h3>
                <p>Easily allocate and manage rooms with real-time availability tracking.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">💰</div>
                <h3>Fee Management</h3>
                <p>Track fees, generate receipts, and monitor payment status.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📝</div>
                <h3>Complaint System</h3>
                <p>Students can lodge complaints and track their resolution status.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📅</div>
                <h3>Leave Management</h3>
                <p>Apply for leave and get approvals digitally.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📊</div>
                <h3>Reports</h3>
                <p>Generate detailed reports for better insights.</p>
            </div>
        </div>
    </section>

    <section class="stats">
        <div class="stats-container">
            <div class="stat-item">
                <div class="stat-number">500+</div>
                <div class="stat-label">Happy Students</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">50+</div>
                <div class="stat-label">Available Rooms</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">24/7</div>
                <div class="stat-label">Support</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">100%</div>
                <div class="stat-label">Secure</div>
            </div>
        </div>
    </section>
</body>
</html>
