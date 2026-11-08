    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Admissions Portal | Candidate Registration</title>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"
            rel="stylesheet">
        <style>
            :root {
                --primary: #0ea5e9;
                --primary-hover: #0284c7;
                --primary-light: rgba(14, 165, 233, 0.15);
                --success: #10b981;
                --error: #f43f5e;
                --card-bg: rgba(8, 15, 29, 0.95);
                --text-main: #f8fafc;
                --text-muted: #94a3b8;
                --border-color: #1e293b;
                --radius: 16px;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Plus Jakarta Sans', sans-serif;
            }

            body {
                background: #030712;
                color: var(--text-main);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 24px;
                position: relative;
                overflow-x: hidden;
            }

            /* Ambient Winter Glowing Orbs */
            .bg-glow {
                position: absolute;
                width: 500px;
                height: 500px;
                background: radial-gradient(circle, rgba(14, 165, 233, 0.22) 0%, rgba(56, 189, 248, 0.08) 60%, transparent 100%);
                filter: blur(100px);
                border-radius: 50%;
                z-index: 0;
                animation: floatOrb 10s ease-in-out infinite alternate;
            }

            .bg-glow.orb-1 {
                top: -15%;
                left: -10%;
            }

            .bg-glow.orb-2 {
                bottom: -15%;
                right: -10%;
                animation-delay: -5s;
            }

            @keyframes floatOrb {
                0% {
                    transform: translateY(0) scale(1);
                    opacity: 0.7;
                }

                100% {
                    transform: translateY(30px) scale(1.08);
                    opacity: 1;
                }
            }

            /* Snowfall Animation Container */
            .snow-container {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                pointer-events: none;
                z-index: 1;
            }

            .snowflake {
                position: absolute;
                top: -10px;
                background: #ffffff;
                border-radius: 50%;
                opacity: 0.8;
                box-shadow: 0 0 8px rgba(255, 255, 255, 0.8);
                animation: fallSnow linear infinite;
            }

            @keyframes fallSnow {
                0% {
                    transform: translateY(-10px) translateX(0);
                }

                50% {
                    transform: translateY(50vh) translateX(20px);
                }

                100% {
                    transform: translateY(105vh) translateX(-20px);
                }
            }

            .portal-wrapper {
                position: relative;
                z-index: 2;
                display: flex;
                width: 100%;
                max-width: 1000px;
                background: var(--card-bg);
                border-radius: 26px;
                box-shadow: 0 40px 80px -20px rgba(0, 0, 0, 0.85),
                    0 0 0 1px rgba(56, 189, 248, 0.25) inset;
                overflow: hidden;
                backdrop-filter: blur(25px);
            }

            /* Left Hero Banner Side (Winter Theme) */
            .portal-banner {
                flex: 1;
                background: linear-gradient(135deg, rgba(2, 132, 199, 0.88), rgba(8, 15, 29, 0.95)),
                    url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=1000&auto=format&fit=crop') center/cover no-repeat;
                color: white;
                padding: 55px 45px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                position: relative;
                overflow: hidden;
            }

            .portal-banner::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: radial-gradient(circle at top right, rgba(255, 255, 255, 0.12), transparent 70%);
                pointer-events: none;
            }

            .banner-header-badge {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background: rgba(255, 255, 255, 0.12);
                border: 1px solid rgba(255, 255, 255, 0.25);
                padding: 6px 14px;
                border-radius: 30px;
                font-size: 0.75rem;
                font-weight: 700;
                letter-spacing: 1px;
                text-transform: uppercase;
                color: #bae6fd;
                margin-bottom: 20px;
                width: fit-content;
            }

            .banner-header-badge svg {
                width: 14px;
                height: 14px;
                fill: #38bdf8;
            }

            .banner-content h2 {
                font-size: 2.4rem;
                font-weight: 800;
                line-height: 1.15;
                margin-bottom: 16px;
                letter-spacing: -0.5px;
            }

            .banner-content p {
                font-size: 0.95rem;
                color: #cbd5e1;
                line-height: 1.6;
            }

            .banner-gallery {
                display: flex;
                gap: 12px;
                margin-top: 32px;
            }

            .gallery-thumb {
                width: 64px;
                height: 64px;
                border-radius: 14px;
                object-fit: cover;
                border: 2px solid rgba(56, 189, 248, 0.5);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
                transition: transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            }

            .gallery-thumb:hover {
                transform: translateY(-5px) scale(1.08);
                border-color: #38bdf8;
                box-shadow: 0 12px 28px rgba(14, 165, 233, 0.5);
            }

            .banner-footer {
                font-size: 0.85rem;
                color: #94a3b8;
                letter-spacing: 0.5px;
            }

            /* Right Form Side */
            .portal-form-container {
                flex: 1.25;
                padding: 48px;
                max-height: 90vh;
                overflow-y: auto;
                background: #080f1d;
            }

            .portal-form-container::-webkit-scrollbar {
                width: 6px;
            }

            .portal-form-container::-webkit-scrollbar-thumb {
                background: #1e293b;
                border-radius: 10px;
            }

            .form-header {
                margin-bottom: 28px;
            }

            .form-header h1 {
                font-size: 1.7rem;
                font-weight: 800;
                color: var(--text-main);
                margin-bottom: 6px;
                letter-spacing: -0.5px;
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
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.8px;
                margin-bottom: 6px;
                color: var(--text-muted);
            }

            .input-wrapper {
                position: relative;
                display: flex;
                align-items: center;
            }

            .input-wrapper svg {
                position: absolute;
                left: 14px;
                width: 18px;
                height: 18px;
                fill: #475569;
                transition: fill 0.25s ease;
                pointer-events: none;
            }

            input {
                width: 100%;
                padding: 13px 14px 13px 44px;
                font-size: 0.95rem;
                background-color: #0f172a;
                border: 1.5px solid var(--border-color);
                border-radius: var(--radius);
                outline: none;
                transition: all 0.25s ease;
                color: var(--text-main);
            }

            input::placeholder {
                color: #475569;
            }

            input:focus {
                background-color: #080f1d;
                border-color: var(--primary);
                box-shadow: 0 0 0 4px var(--primary-light);
            }

            input:focus+svg,
            .input-wrapper:focus-within svg {
                fill: var(--primary);
            }

            /* Shake animation on error */
            @keyframes shake {

                0%,
                100% {
                    transform: translateX(0);
                }

                20%,
                60% {
                    transform: translateX(-6px);
                }

                40%,
                80% {
                    transform: translateX(6px);
                }
            }

            .shake {
                animation: shake 0.4s ease-in-out;
                border-color: var(--error) !important;
                box-shadow: 0 0 0 4px rgba(244, 63, 94, 0.2) !important;
            }

            .error-message {
                font-size: 0.75rem;
                color: var(--error);
                margin-top: 5px;
                display: none;
                font-weight: 500;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .error-message.show {
                display: block;
                opacity: 1;
            }

            .btn-submit {
                width: 100%;
                background: linear-gradient(135deg, var(--primary), var(--primary-hover));
                color: white;
                border: none;
                border-radius: var(--radius);
                padding: 15px;
                font-size: 1.05rem;
                font-weight: 700;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 10px;
                box-shadow: 0 8px 25px rgba(14, 165, 233, 0.4);
                position: relative;
                overflow: hidden;
                letter-spacing: 0.5px;
            }

            .btn-submit::after {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.25), transparent);
                transition: 0.6s;
            }

            .btn-submit:hover::after {
                left: 100%;
            }

            .btn-submit:hover {
                transform: translateY(-2px);
                box-shadow: 0 12px 30px rgba(14, 165, 233, 0.6);
            }

            .btn-submit:active {
                transform: scale(0.98);
            }

            /* Success Cinematic Overlay */
            #successModal {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(3, 7, 18, 0.85);
                backdrop-filter: blur(10px);
                display: none;
                justify-content: center;
                align-items: center;
                z-index: 100;
                opacity: 0;
                transition: opacity 0.4s ease;
            }

            #successModal.active {
                display: flex;
                opacity: 1;
            }

            .success-card {
                background: #0f172a;
                border: 1px solid rgba(56, 189, 248, 0.4);
                padding: 40px;
                border-radius: 24px;
                text-align: center;
                max-width: 420px;
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.6);
                animation: popIn 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            }

            @keyframes popIn {
                0% {
                    transform: scale(0.8);
                    opacity: 0;
                }

                100% {
                    transform: scale(1);
                    opacity: 1;
                }
            }

            .success-card h3 {
                font-size: 1.8rem;
                color: #f8fafc;
                margin-bottom: 12px;
            }

            .success-card p {
                font-size: 0.95rem;
                color: #94a3b8;
                margin-bottom: 24px;
            }

            .success-card button {
                background: var(--primary);
                color: white;
                border: none;
                padding: 12px 28px;
                font-weight: 700;
                border-radius: 12px;
                cursor: pointer;
                transition: 0.2s;
            }

            .success-card button:hover {
                background: var(--primary-hover);
            }

            /* Responsive Design */
            @media(max-width: 768px) {
                .portal-wrapper {
                    flex-direction: column;
                    max-width: 500px;
                }

                .portal-banner {
                    padding: 40px 30px;
                }

                .banner-content h2 {
                    font-size: 1.8rem;
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

        <!-- Winter Glow Blobs -->
        <div class="bg-glow orb-1"></div>
        <div class="bg-glow orb-2"></div>

        <!-- Snowfall Particle Container -->
        <div class="snow-container" id="snowContainer"></div>

        <div class="portal-wrapper">
            <!-- Winter Banner -->
            <div class="portal-banner">
                <div class="banner-content">
                    <div class="banner-header-badge">
                        <svg viewBox="0 0 24 24">
                            <path d="M12 2v20M17 5l-10 14M19 12H5M5 5l14 14" />
                        </svg>
                        Winter Admissions 2026
                    </div>
                    <h2>Student Admissions Portal</h2>
                    <p>Register candidate credentials securely into the cloud administration directory amidst the winter
                        term records.</p>

                    <!-- Mini Image Previews -->
                    <div class="banner-gallery">
                        <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80&w=200&auto=format&fit=crop"
                            alt="Collaboration" class="gallery-thumb" title="Collaborative Learning">
                        <img src="https://images.unsplash.com/photo-1531482615713-2afd69097998?q=80&w=200&auto=format&fit=crop"
                            alt="Workspace" class="gallery-thumb" title="Modern Workspace">
                        <img src="https://images.unsplash.com/photo-1434030216411-0b793f4b4173?q=80&w=200&auto=format&fit=crop"
                            alt="Excellence" class="gallery-thumb" title="Academic Excellence">
                    </div>
                </div>

                <div class="banner-footer">
                    &copy; 2026 Academic Systems Inc. All rights reserved.
                </div>
            </div>

            <!-- Interactive Form -->
            <div class="portal-form-container">
                <div class="form-header">
                    <h1>Candidate Registration</h1>
                    <p>Please provide the required applicant details below.</p>
                </div>

                <form id="registrationForm" action="registrationController" method="post"
                    onsubmit="return handleSubmission(event)">
                    <div class="form-grid">

                        <!-- Full Name -->
                        <div class="form-group full-width">
                            <label for="fullname">Full Name</label>
                            <div class="input-wrapper">
                                <input type="text" id="fullname" name="fullname" placeholder="e.g., Alexander Wright">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                                </svg>
                            </div>
                            <div id="nameError" class="error-message">Full name is required.</div>
                        </div>

                        <!-- Residential Address -->
                        <div class="form-group full-width">
                            <label for="address">Residential Address</label>
                            <div class="input-wrapper">
                                <input type="text" id="address" name="address"
                                    placeholder="e.g., 42 Wallaby Way, Sydney">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z" />
                                </svg>
                            </div>
                            <div id="addressError" class="error-message">Valid address is required.</div>
                        </div>

                        <!-- Age -->
                        <div class="form-group">
                            <label for="age">Age</label>
                            <div class="input-wrapper">
                                <input type="text" id="age" name="age" placeholder="e.g., 21">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M19 3h-1V1h-2v2H8V1H6v2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V8h14v11z" />
                                </svg>
                            </div>
                            <div id="ageError" class="error-message">Enter valid age (1-120).</div>
                        </div>

                        <!-- Year Passed -->
                        <div class="form-group">
                            <label for="yop">Year Passed</label>
                            <div class="input-wrapper">
                                <input type="text" id="yop" name="yop" placeholder="e.g., 2025">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M12 3L1 9l11 6 9-4.91V17h2V9L12 3zM5 13.18v4L12 21l7-3.82v-4L12 17l-7-3.82z" />
                                </svg>
                            </div>
                            <div id="yopError" class="error-message">Enter 4-digit year.</div>
                        </div>

                        <!-- Qualification -->
                        <div class="form-group">
                            <label for="qual">Qualification</label>
                            <div class="input-wrapper">
                                <input type="text" id="qual" name="qual" placeholder="e.g., B.Tech CSE">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M18 2H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 4h5v8l-2.5-1.5L6 12V4z" />
                                </svg>
                            </div>
                            <div id="qualError" class="error-message">Qualification required.</div>
                        </div>

                        <!-- Percentage / CGPA -->
                        <div class="form-group">
                            <label for="percent">Percentage / CGPA</label>
                            <div class="input-wrapper">
                                <input type="text" id="percent" name="percent" placeholder="e.g., 88.5">
                                <svg viewBox="0 0 24 24">
                                    <path
                                        d="M18.5 5.5C18.5 7.43 16.93 9 15 9s-3.5-1.57-3.5-3.5S13.07 2 15 2s3.5 1.57 3.5 3.5zM4 18.5C4 16.57 5.57 15 7.5 15s3.5 1.57 3.5 3.5S9.43 22 7.5 22 4 20.43 4 18.5zM6.41 4.99L19.01 17.59l-1.42 1.42L4.99 6.41z" />
                                </svg>
                            </div>
                            <div id="percentError" class="error-message">Enter value between 0-100.</div>
                        </div>
                    </div>

                    <button type="submit" class="btn-submit">Submit Registration</button>
                </form>
            </div>
        </div>

        <!-- Success Modal -->
        <div id="successModal">
            <div class="success-card">
                <h3>Registration Successful</h3>
                <p>Candidate credentials have been successfully validated and recorded in the winter directory.</p>
                <button onclick="closeModal()">Continue to Dashboard</button>
            </div>
        </div>

        <script>
            // Generate falling snowflakes dynamically
            const snowContainer = document.getElementById("snowContainer");
            const snowflakeCount = 35;

            for (let i = 0; i < snowflakeCount; i++) {
                const snowflake = document.createElement("div");
                snowflake.classList.add("snowflake");

                // Randomize size, position, speed, and opacity
                const size = Math.random() * 5 + 2; // 2px to 7px
                snowflake.style.width = size + "px";
                snowflake.style.height = size + "px";
                snowflake.style.left = Math.random() * 100 + "%";
                snowflake.style.animationDuration = (Math.random() * 6 + 4) + "s"; // 4s to 10s
                snowflake.style.animationDelay = (Math.random() * 5) + "s";
                snowflake.style.opacity = Math.random() * 0.7 + 0.3;

                snowContainer.appendChild(snowflake);
            }

            function handleSubmission(event) {
                event.preventDefault();
                let isValid = true;

                const fields = {
                    fullname: document.getElementById("fullname"),
                    address: document.getElementById("address"),
                    age: document.getElementById("age"),
                    qual: document.getElementById("qual"),
                    percent: document.getElementById("percent"),
                    yop: document.getElementById("yop")
                };

                const errors = {
                    fullname: document.getElementById("nameError"),
                    address: document.getElementById("addressError"),
                    age: document.getElementById("ageError"),
                    qual: document.getElementById("qualError"),
                    percent: document.getElementById("percentError"),
                    yop: document.getElementById("yopError")
                };

                // Reset all errors and animations
                Object.values(fields).forEach(el => el.classList.remove("shake"));
                Object.values(errors).forEach(el => el.classList.remove("show"));

                const vals = {
                    fullname: fields.fullname.value.trim(),
                    address: fields.address.value.trim(),
                    age: fields.age.value.trim(),
                    qual: fields.qual.value.trim(),
                    percent: fields.percent.value.trim(),
                    yop: fields.yop.value.trim()
                };

                // Validation logic with shake effect
                if (!vals.fullname) {
                    fields.fullname.classList.add("shake");
                    errors.fullname.classList.add("show");
                    isValid = false;
                }
                if (!vals.address) {
                    fields.address.classList.add("shake");
                    errors.address.classList.add("show");
                    isValid = false;
                }
                if (isNaN(vals.age) || !vals.age || Number(vals.age) < 1 || Number(vals.age) > 120) {
                    fields.age.classList.add("shake");
                    errors.age.classList.add("show");
                    isValid = false;
                }
                if (!vals.qual) {
                    fields.qual.classList.add("shake");
                    errors.qual.classList.add("show");
                    isValid = false;
                }
                if (isNaN(vals.percent) || !vals.percent || Number(vals.percent) < 0 || Number(vals.percent) > 100) {
                    fields.percent.classList.add("shake");
                    errors.percent.classList.add("show");
                    isValid = false;
                }
                if (isNaN(vals.yop) || vals.yop.length !== 4) {
                    fields.yop.classList.add("shake");
                    errors.yop.classList.add("show");
                    isValid = false;
                }

                if (isValid) {
                    document.getElementById("successModal").classList.add("active");
                }

                return false;
            }

            function closeModal() {
                document.getElementById("registrationForm").submit();
            }
        </script>
    </body>

    </html>
