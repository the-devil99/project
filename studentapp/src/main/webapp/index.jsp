<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Professional Student Portal | Registration</title>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap"
            rel="stylesheet">
        <style>
            :root {
                --primary: #6366f1;
                --primary-hover: #4f46e5;
                --primary-light: rgba(99, 102, 241, 0.1);
                --success: #10b981;
                --error: #ef4444;
                --card-bg: rgba(255, 255, 255, 0.98);
                --text-main: #0f172a;
                --text-muted: #64748b;
                --border-color: #cbd5e1;
                --radius: 14px;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Plus Jakarta Sans', sans-serif;
            }

            body {
                background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%);
                color: var(--text-main);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 24px;
            }

            .portal-wrapper {
                display: flex;
                width: 100%;
                max-width: 960px;
                background: var(--card-bg);
                border-radius: 20px;
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.35);
                overflow: hidden;
                backdrop-filter: blur(10px);
            }

            /* Left Hero Banner Side with Professional Background Image */
            .portal-banner {
                flex: 1;
                background: linear-gradient(135deg, rgba(79, 70, 229, 0.9), rgba(49, 46, 129, 0.95)),
                    url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=1000&auto=format&fit=crop') center/cover no-repeat;
                color: white;
                padding: 50px 40px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                position: relative;
                overflow: hidden;
            }

            .banner-content h2 {
                font-size: 2.2rem;
                font-weight: 700;
                line-height: 1.2;
                margin-bottom: 16px;
            }

            .banner-content p {
                font-size: 0.95rem;
                color: #cbd5e1;
                line-height: 1.6;
            }

            /* Image Showcase Badges/Thumbnails on the Left */
            .banner-gallery {
                display: flex;
                gap: 10px;
                margin-top: 24px;
            }

            .gallery-thumb {
                width: 56px;
                height: 56px;
                border-radius: 10px;
                object-fit: cover;
                border: 2px solid rgba(255, 255, 255, 0.4);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease;
            }

            .gallery-thumb:hover {
                transform: scale(1.05);
            }

            .banner-footer {
                font-size: 0.85rem;
                color: #94a3b8;
                letter-spacing: 0.5px;
            }

            /* Right Form Side */
            .portal-form-container {
                flex: 1.2;
                padding: 40px;
                max-height: 90vh;
                overflow-y: auto;
            }

            .form-header {
                margin-bottom: 28px;
            }

            .form-header h1 {
                font-size: 1.5rem;
                font-weight: 700;
                color: var(--text-main);
                margin-bottom: 6px;
            }

            .form-header p {
                font-size: 0.875rem;
                color: var(--text-muted);
            }

            .form-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 16px;
            }

            .form-group {
                margin-bottom: 18px;
            }

            .form-group.full-width {
                grid-column: span 2;
            }

            label {
                display: block;
                font-size: 0.8rem;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 6px;
                color: var(--text-muted);
            }

            .input-wrapper {
                position: relative;
            }

            input {
                width: 100%;
                padding: 12px 14px;
                font-size: 0.95rem;
                background-color: #f8fafc;
                border: 1.5px solid var(--border-color);
                border-radius: var(--radius);
                outline: none;
                transition: all 0.25s ease;
                color: var(--text-main);
            }

            input:focus {
                background-color: #ffffff;
                border-color: var(--primary);
                box-shadow: 0 0 0 4px var(--primary-light);
            }

            .error-message {
                font-size: 0.75rem;
                color: var(--error);
                margin-top: 5px;
                display: none;
                font-weight: 500;
            }

            .btn-submit {
                width: 100%;
                background: var(--primary);
                color: white;
                border: none;
                border-radius: var(--radius);
                padding: 14px;
                font-size: 1rem;
                font-weight: 600;
                cursor: pointer;
                transition: background 0.2s, transform 0.1s;
                margin-top: 10px;
                box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
            }

            .btn-submit:hover {
                background: var(--primary-hover);
            }

            .btn-submit:active {
                transform: scale(0.98);
            }

            /* Responsive Design */
            @media(max-width: 768px) {
                .portal-wrapper {
                    flex-direction: column;
                    max-width: 500px;
                }

                .portal-banner {
                    padding: 30px;
                }

                .banner-content h2 {
                    font-size: 1.6rem;
                }

                .form-grid {
                    grid-template-columns: 1fr;
                }

                .form-group.full-width {
                    grid-column: span 1;
                }
            }
        </style>
    </head>

    <body>

        <div class="portal-wrapper">
            <!-- Professional Left Banner with Images -->
            <div class="portal-banner">
                <div class="banner-content">
                    <h2>Student Admissions Portal</h2>
                    <p>Register student credentials securely into the cloud administration directory. Ensure all
                        academic records match official documentation.</p>

                    <!-- Added Mini Professional Image Previews -->
                    <div class="banner-gallery">
                        <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80&w=200&auto=format&fit=crop"
                            alt="Students Collaboration" class="gallery-thumb" title="Collaborative Learning">
                        <img src="https://images.unsplash.com/photo-1531482615713-2afd69097998?q=80&w=200&auto=format&fit=crop"
                            alt="Academic Workspace" class="gallery-thumb" title="Modern Workspace">
                        <img src="https://images.unsplash.com/photo-1434030216411-0b793f4b4173?q=80&w=200&auto=format&fit=crop"
                            alt="Excellence" class="gallery-thumb" title="Academic Excellence">
                    </div>
                </div>

                <div class="banner-footer">
                    &copy; 2026 Academic Systems Inc.
                </div>
            </div>

            <!-- Interactive Right Form -->
            <div class="portal-form-container">
                <div class="form-header">
                    <h1>Candidate Registration</h1>
                    <p>Please provide the required details below.</p>
                </div>

                <form id="registrationForm" action="registrationController" method="post"
                    onsubmit="return validateForm()">
                    <div class="form-grid">
                        <div class="form-group full-width">
                            <label for="fullname">Full Name</label>
                            <div class="input-wrapper">
                                <input type="text" id="fullname" name="fullname" placeholder="e.g., Alexander Wright">
                            </div>
                            <div id="nameError" class="error-message">Full name is required.</div>
                        </div>

                        <div class="form-group full-width">
                            <label for="address">Residential Address</label>
                            <div class="input-wrapper">
                                <input type="text" id="address" name="address"
                                    placeholder="e.g., 42 Wallaby Way, Sydney">
                            </div>
                            <div id="addressError" class="error-message">Valid address is required.</div>
                        </div>

                        <div class="form-group">
                            <label for="age">Age</label>
                            <div class="input-wrapper">
                                <input type="text" id="age" name="age" placeholder="e.g., 21">
                            </div>
                            <div id="ageError" class="error-message">Enter valid age (1-120).</div>
                        </div>

                        <div class="form-group">
                            <label for="yop">Year Passed</label>
                            <div class="input-wrapper">
                                <input type="text" id="yop" name="yop" placeholder="e.g., 2025">
                            </div>
                            <div id="yopError" class="error-message">Enter 4-digit year.</div>
                        </div>

                        <div class="form-group">
                            <label for="qual">Qualification</label>
                            <div class="input-wrapper">
                                <input type="text" id="qual" name="qual" placeholder="e.g., B.Tech CSE">
                            </div>
                            <div id="qualError" class="error-message">Qualification required.</div>
                        </div>

                        <div class="form-group">
                            <label for="percent">Percentage / CGPA</label>
                            <div class="input-wrapper">
                                <input type="text" id="percent" name="percent" placeholder="e.g., 88.5">
                            </div>
                            <div id="percentError" class="error-message">Enter value between 0-100.</div>
                        </div>
                    </div>

                    <button type="submit" class="btn-submit">Submit Registration</button>
                </form>
            </div>
        </div>

        <script>
            function validateForm() {
                let isValid = true;

                const fields = {
                    fullname: document.getElementById("fullname").value.trim(),
                    address: document.getElementById("address").value.trim(),
                    age: document.getElementById("age").value.trim(),
                    qual: document.getElementById("qual").value.trim(),
                    percent: document.getElementById("percent").value.trim(),
                    yop: document.getElementById("yop").value.trim()
                };

                const errors = {
                    fullname: document.getElementById("nameError"),
                    address: document.getElementById("addressError"),
                    age: document.getElementById("ageError"),
                    qual: document.getElementById("qualError"),
                    percent: document.getElementById("percentError"),
                    yop: document.getElementById("yopError")
                };

                // Reset all error displays
                Object.values(errors).forEach(el => el.style.display = "none");

                // Validation logic
                if (!fields.fullname) {
                    errors.fullname.style.display = "block";
                    isValid = false;
                }
                if (!fields.address) {
                    errors.address.style.display = "block";
                    isValid = false;
                }
                if (isNaN(fields.age) || !fields.age || Number(fields.age) < 1 || Number(fields.age) > 120) {
                    errors.age.style.display = "block";
                    isValid = false;
                }
                if (!fields.qual) {
                    errors.qual.style.display = "block";
                    isValid = false;
                }
                if (isNaN(fields.percent) || !fields.percent || Number(fields.percent) < 0 || Number(fields.percent) > 100) {
                    errors.percent.style.display = "block";
                    isValid = false;
                }
                if (isNaN(fields.yop) || fields.yop.length !== 4) {
                    errors.yop.style.display = "block";
                    isValid = false;
                }

                return isValid;
            }
        </script>
    </body>

    </html>
