<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Productivity Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg-primary: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --bg-card: rgba(255, 255, 255, 0.1);
            --text-primary: #ffffff;
            --text-secondary: #e2e8f0;
            --border: rgba(255, 255, 255, 0.2);
            --accent-blue: #4facfe;
            --accent-green: #43e97b;
            --accent-red: #fa709a;
            --accent-purple: #a855f7;
            --accent-orange: #feca57;
            --shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            --shadow-hover: 0 15px 35px rgba(31, 38, 135, 0.5);
        }

        [data-theme="dark"] {
            --bg-primary: linear-gradient(135deg, #0c0c0c 0%, #1a1a2e 50%, #16213e 100%);
            --bg-card: rgba(255, 255, 255, 0.05);
            --text-primary: #ffffff;
            --text-secondary: #cbd5e0;
            --border: rgba(255, 255, 255, 0.1);
            --shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
            --shadow-hover: 0 15px 35px rgba(0, 0, 0, 0.7);
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: var(--bg-primary);
            color: var(--text-primary);
            min-height: 100vh;
            padding: 1rem;
            transition: all 0.3s ease;
            overflow-x: hidden;
            position: relative;
        }

        /* Animated Background Elements */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .floating-shapes {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .shape {
            position: absolute;
            border-radius: 50%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
            backdrop-filter: blur(10px);
            animation: float 20s infinite linear;
        }

        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            left: 10%;
            animation-delay: 0s;
            animation-duration: 25s;
        }

        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            left: 20%;
            animation-delay: 5s;
            animation-duration: 30s;
        }

        .shape:nth-child(3) {
            width: 60px;
            height: 60px;
            left: 70%;
            animation-delay: 10s;
            animation-duration: 20s;
        }

        .shape:nth-child(4) {
            width: 100px;
            height: 100px;
            left: 80%;
            animation-delay: 15s;
            animation-duration: 35s;
        }

        .shape:nth-child(5) {
            width: 140px;
            height: 140px;
            left: 50%;
            animation-delay: 8s;
            animation-duration: 28s;
        }

        /* Particle System */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .particle {
            position: absolute;
            width: 4px;
            height: 4px;
            background: rgba(255, 255, 255, 0.6);
            border-radius: 50%;
            animation: particle-float 15s infinite linear;
        }

        /* Gradient Orbs */
        .gradient-orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(40px);
            animation: orb-move 20s infinite ease-in-out;
        }

        .orb-1 {
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(79, 172, 254, 0.3) 0%, transparent 70%);
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .orb-2 {
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(168, 85, 247, 0.3) 0%, transparent 70%);
            top: 60%;
            right: 10%;
            animation-delay: 10s;
        }

        .orb-3 {
            width: 250px;
            height: 250px;
            background: radial-gradient(circle, rgba(67, 233, 123, 0.3) 0%, transparent 70%);
            bottom: 20%;
            left: 50%;
            animation-delay: 5s;
        }

        /* Wave Animation */
        .wave-container {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .wave {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 200%;
            height: 100px;
            background: linear-gradient(90deg, 
                rgba(79, 172, 254, 0.1) 0%, 
                rgba(168, 85, 247, 0.1) 50%, 
                rgba(67, 233, 123, 0.1) 100%);
            border-radius: 50% 50% 0 0;
            animation: wave-move 10s infinite linear;
        }

        .wave:nth-child(2) {
            animation-delay: -5s;
            opacity: 0.5;
            height: 80px;
        }

        .wave:nth-child(3) {
            animation-delay: -2.5s;
            opacity: 0.3;
            height: 60px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        .header {
            text-align: center;
            margin-bottom: 2rem;
            animation: fadeInDown 1s ease-out;
        }

        .header h1 {
            font-size: 3rem;
            font-weight: bold;
            background: linear-gradient(135deg, #4facfe, #00f2fe, #a855f7, #feca57);
            background-size: 400% 400%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
            animation: gradient-shift 3s ease-in-out infinite;
            text-shadow: 0 0 30px rgba(255, 255, 255, 0.5);
        }

        .header p {
            color: var(--text-secondary);
            font-size: 1.1rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .theme-toggle {
            position: fixed;
            top: 1rem;
            right: 1rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            width: 60px;
            height: 60px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            transition: all 0.3s ease;
            z-index: 1000;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
        }

        .theme-toggle:hover {
            transform: scale(1.1) rotate(180deg);
            box-shadow: 0 15px 35px rgba(31, 38, 135, 0.5);
            background: rgba(255, 255, 255, 0.2);
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            border: 1px solid rgba(255, 255, 255, 0.18);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            animation: slideInUp 0.8s ease-out;
            position: relative;
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: left 0.5s;
        }

        .card:hover::before {
            left: 100%;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 20px 40px rgba(31, 38, 135, 0.5);
            border-color: rgba(255, 255, 255, 0.3);
        }

        .card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .card-title {
            font-size: 1.4rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .icon {
            width: 24px;
            height: 24px;
            display: inline-block;
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.3));
        }

        /* Enhanced Timer Styles */
        .timer-display {
            text-align: center;
            margin: 2rem 0;
            position: relative;
        }

        .timer-time {
            font-size: 4.5rem;
            font-family: 'Courier New', monospace;
            font-weight: bold;
            color: var(--accent-blue);
            transition: all 0.3s ease;
            text-shadow: 0 0 20px rgba(79, 172, 254, 0.5);
            position: relative;
        }

        .timer-time.break {
            color: var(--accent-green);
            text-shadow: 0 0 20px rgba(67, 233, 123, 0.5);
            animation: pulse-glow 2s infinite;
        }

        .timer-time.active {
            animation: timer-pulse 1s infinite;
        }

        .timer-status {
            font-size: 1rem;
            color: var(--text-secondary);
            margin: 1rem 0;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 500;
        }

        .timer-controls {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin: 1.5rem 0;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1rem;
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.3s, height 0.3s;
        }

        .btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--accent-blue), #00f2fe);
            color: white;
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(79, 172, 254, 0.6);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: var(--text-primary);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px) scale(1.05);
        }

        .btn-success {
            background: linear-gradient(135deg, var(--accent-green), #38f9d7);
            color: white;
            box-shadow: 0 4px 15px rgba(67, 233, 123, 0.4);
        }

        .btn-danger {
            background: linear-gradient(135deg, var(--accent-red), #fe9a8b);
            color: white;
            box-shadow: 0 4px 15px rgba(250, 112, 154, 0.4);
        }

        .badge {
            background: rgba(255, 255, 255, 0.2);
            color: var(--text-primary);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 600;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .badge-high {
            background: linear-gradient(135deg, var(--accent-red), #fe9a8b);
            color: white;
        }

        .badge-medium {
            background: linear-gradient(135deg, var(--accent-orange), #ff9a56);
            color: white;
        }

        .badge-low {
            background: rgba(255, 255, 255, 0.3);
            color: var(--text-primary);
        }

        /* Enhanced Todo Styles */
        .todo-input {
            display: flex;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
        }

        .input {
            flex: 1;
            padding: 0.75rem 1rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1);
            color: var(--text-primary);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .input:focus {
            outline: none;
            border-color: var(--accent-blue);
            box-shadow: 0 0 20px rgba(79, 172, 254, 0.3);
            transform: scale(1.02);
        }

        .progress-bar {
            width: 100%;
            height: 12px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            margin: 1.5rem 0;
            position: relative;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--accent-green), #38f9d7);
            transition: width 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border-radius: 10px;
            position: relative;
            overflow: hidden;
        }

        .progress-fill::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            animation: progress-shine 2s infinite;
        }

        .todo-list {
            max-height: 350px;
            overflow-y: auto;
            scrollbar-width: thin;
            scrollbar-color: rgba(255, 255, 255, 0.3) transparent;
        }

        .todo-list::-webkit-scrollbar {
            width: 6px;
        }

        .todo-list::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
        }

        .todo-list::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 10px;
        }

        .todo-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 1rem;
            margin-bottom: 0.75rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
        }

        .todo-item:hover {
            border-color: var(--accent-blue);
            transform: translateX(5px) scale(1.02);
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.2);
        }

        .todo-item.completed {
            background: rgba(67, 233, 123, 0.1);
            border-color: var(--accent-green);
        }

        .todo-text {
            flex: 1;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        .todo-text.completed {
            text-decoration: line-through;
            color: var(--text-secondary);
            opacity: 0.7;
        }

        /* Enhanced Habit Styles */
        .habit-item {
            padding: 1.25rem;
            margin-bottom: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
        }

        .habit-item:hover {
            border-color: var(--accent-purple);
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 8px 20px rgba(168, 85, 247, 0.2);
        }

        .habit-item.completed {
            background: rgba(67, 233, 123, 0.1);
            border-color: var(--accent-green);
        }

        .habit-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
        }

        .habit-name {
            font-weight: 600;
            font-size: 1rem;
        }

        .habit-streak {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-size: 0.875rem;
            color: var(--text-secondary);
        }

        /* Enhanced Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .stat-card {
            text-align: center;
            padding: 1.5rem;
            border-radius: 15px;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            overflow: hidden;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(45deg);
            transition: all 0.5s;
            opacity: 0;
        }

        .stat-card:hover::before {
            animation: stat-shine 1s ease-in-out;
        }

        .stat-card:hover {
            transform: translateY(-5px) scale(1.05);
        }

        .stat-blue {
            background: linear-gradient(135deg, rgba(79, 172, 254, 0.2), rgba(0, 242, 254, 0.1));
        }

        .stat-green {
            background: linear-gradient(135deg, rgba(67, 233, 123, 0.2), rgba(56, 249, 215, 0.1));
        }

        .stat-purple {
            background: linear-gradient(135deg, rgba(168, 85, 247, 0.2), rgba(139, 92, 246, 0.1));
        }

        .stat-orange {
            background: linear-gradient(135deg, rgba(254, 202, 87, 0.2), rgba(255, 154, 86, 0.1));
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--text-primary);
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 0.5rem;
        }

        .stat-label {
            font-size: 0.875rem;
            color: var(--text-secondary);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 500;
        }

        .quote-text {
            font-style: italic;
            line-height: 1.8;
            color: var(--text-secondary);
            font-size: 1.1rem;
            text-align: center;
            position: relative;
        }

        .quote-text::before,
        .quote-text::after {
            content: '"';
            font-size: 3rem;
            color: rgba(255, 255, 255, 0.2);
            position: absolute;
            font-family: serif;
        }

        .quote-text::before {
            top: -10px;
            left: -10px;
        }

        .quote-text::after {
            bottom: -30px;
            right: -10px;
        }

        /* Weather/Clock Styles */
        .weather-display {
            text-align: center;
        }

        .weather-temp {
            font-size: 2.5rem;
            font-weight: bold;
            margin: 1rem 0;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .weather-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.3));
        }

        /* Animations */
        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        @keyframes particle-float {
            0% {
                transform: translateY(100vh) translateX(0px);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) translateX(100px);
                opacity: 0;
            }
        }

        @keyframes orb-move {
            0%, 100% {
                transform: translate(0, 0) scale(1);
            }
            25% {
                transform: translate(30px, -30px) scale(1.1);
            }
            50% {
                transform: translate(-20px, 20px) scale(0.9);
            }
            75% {
                transform: translate(20px, 30px) scale(1.05);
            }
        }

        @keyframes wave-move {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-50%);
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes gradient-shift {
            0%, 100% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
        }

        @keyframes pulse-glow {
            0%, 100% {
                text-shadow: 0 0 20px rgba(67, 233, 123, 0.5);
            }
            50% {
                text-shadow: 0 0 30px rgba(67, 233, 123, 0.8), 0 0 40px rgba(67, 233, 123, 0.6);
            }
        }

        @keyframes timer-pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }

        @keyframes progress-shine {
            0% {
                left: -100%;
            }
            100% {
                left: 100%;
            }
        }

        @keyframes stat-shine {
            0% {
                opacity: 0;
                transform: rotate(45deg) translate(-100%, -100%);
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                transform: rotate(45deg) translate(100%, 100%);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .grid {
                grid-template-columns: 1fr;
            }
            
            .header h1 {
                font-size: 2.5rem;
            }
            
            .timer-time {
                font-size: 3.5rem;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }

            .shape {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Animated Background -->
    <div class="bg-animation">
        <!-- Floating Shapes -->
        <div class="floating-shapes">
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
        </div>

        <!-- Gradient Orbs -->
        <div class="gradient-orb orb-1"></div>
        <div class="gradient-orb orb-2"></div>
        <div class="gradient-orb orb-3"></div>

        <!-- Wave Animation -->
        <div class="wave-container">
            <div class="wave"></div>
            <div class="wave"></div>
            <div class="wave"></div>
        </div>

        <!-- Particles -->
        <div class="particles" id="particles"></div>
    </div>

    <div class="theme-toggle" onclick="toggleTheme()">
        <span id="theme-icon">🌙</span>
    </div>

    <div class="container">
        <div class="header">
            <h1>Productivity Dashboard</h1>
            <p>Your personal command center for maximum productivity</p>
        </div>

        <div class="grid">
            <!-- Pomodoro Timer -->
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <span class="icon">⏱</span>
                        Pomodoro Timer
                    </div>
                </div>
                <div class="timer-display">
                    <div class="timer-time" id="timer-display">25:00</div>
                    <div class="timer-status" id="timer-status">Focus Time</div>
                    <div class="timer-controls">
                        <button class="btn btn-primary" id="timer-toggle" onclick="toggleTimer()">
                            <span id="timer-icon">▶</span>
                        </button>
                        <button class="btn btn-secondary" onclick="resetTimer()">
                            <span>↻</span>
                        </button>
                    </div>
                    <div>
                        Sessions completed: <span class="badge" id="sessions-count">0</span>
                    </div>
                </div>
            </div>

            <!-- Todo List -->
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <span class="icon">🎯</span>
                        Tasks
                    </div>
                    <span class="badge" id="todo-progress">0/0</span>
                </div>
                <div class="todo-input">
                    <input type="text" class="input" id="todo-input" placeholder="Add a new task..." onkeypress="handleTodoKeyPress(event)">
                    <button class="btn btn-primary" onclick="addTodo()">+</button>
                </div>
                <div class="progress-bar">
                    <div class="progress-fill" id="todo-progress-bar" style="width: 0%"></div>
                </div>
                <div class="todo-list" id="todo-list"></div>
            </div>

            <!-- Live Clock -->
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Live Clock</div>
                    <div class="weather-icon">⏰</div>
                </div>
                <div class="weather-display">
                    <div class="weather-temp" id="live-clock">--:--:--</div>
                    <div id="clock-date">--</div>
                    <div style="font-size: 0.875rem; color: var(--text-secondary);">Your Local Time</div>
                </div>
            </div>

            <!-- Daily Quote -->
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <span class="icon">💭</span>
                        Daily Inspiration
                    </div>
                </div>
                <p class="quote-text" id="daily-quote">The way to get started is to quit talking and begin doing. - Walt Disney</p>
            </div>

            <!-- Habit Tracker -->
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <span class="icon">📈</span>
                        Habit Tracker
                    </div>
                </div>
                <div id="habit-list"></div>
            </div>

            <!-- Stats -->
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <span class="icon">📊</span>
                        Today's Stats
                    </div>
                </div>
                <div class="stats-grid">
                    <div class="stat-card stat-blue">
                        <div class="stat-number" id="stat-pomodoros">0</div>
                        <div class="stat-label">Pomodoros</div>
                    </div>
                    <div class="stat-card stat-green">
                        <div class="stat-number" id="stat-tasks">0</div>
                        <div class="stat-label">Tasks Done</div>
                    </div>
                    <div class="stat-card stat-purple">
                        <div class="stat-number" id="stat-habits">0</div>
                        <div class="stat-label">Habits</div>
                    </div>
                    <div class="stat-card stat-orange">
                        <div class="stat-number" id="stat-progress">0%</div>
                        <div class="stat-label">Progress</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Global State
        let timerState = {
            timeLeft: 25 * 60,
            isActive: false,
            isBreak: false,
            sessions: 0,
            interval: null
        };

        let todos = [
            { id: 1, text: "Complete project proposal", completed: false, priority: "high" },
            { id: 2, text: "Review team feedback", completed: false, priority: "medium" },
            { id: 3, text: "Update documentation", completed: true, priority: "low" }
        ];

        let habits = [
            { id: 1, name: "Morning Exercise", streak: 7, completedToday: false },
            { id: 2, name: "Read 30 minutes", streak: 12, completedToday: true },
            { id: 3, name: "Meditate", streak: 3, completedToday: false }
        ];

        const quotes = [
            "The way to get started is to quit talking and begin doing. - Walt Disney",
            "Innovation distinguishes between a leader and a follower. - Steve Jobs",
            "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
            "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
            "Success is not final, failure is not fatal: it is the courage to continue that counts. - Winston Churchill",
            "The only way to do great work is to love what you do. - Steve Jobs",
            "Life is what happens to you while you're busy making other plans. - John Lennon",
            "The future belongs to those who prepare for it today. - Malcolm X"
        ];

        // Create Particles
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            const particleCount = 50;

            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 15 + 's';
                particle.style.animationDuration = (Math.random() * 10 + 10) + 's';
                particlesContainer.appendChild(particle);
            }
        }

        // Theme Management
        function toggleTheme() {
            const body = document.body;
            const themeIcon = document.getElementById('theme-icon');
            
            if (body.getAttribute('data-theme') === 'dark') {
                body.removeAttribute('data-theme');
                themeIcon.textContent = '🌙';
                localStorage.setItem('theme', 'light');
            } else {
                body.setAttribute('data-theme', 'dark');
                themeIcon.textContent = '☀';
                localStorage.setItem('theme', 'dark');
            }
        }

        function loadTheme() {
            const savedTheme = localStorage.getItem('theme');
            const themeIcon = document.getElementById('theme-icon');
            
            if (savedTheme === 'dark') {
                document.body.setAttribute('data-theme', 'dark');
                themeIcon.textContent = '☀';
            }
        }

        // Timer Functions
        function formatTime(seconds) {
            const mins = Math.floor(seconds / 60);
            const secs = seconds % 60;
            return mins.toString().padStart(2, '0') + ':' + secs.toString().padStart(2, '0');
        }

        function updateTimerDisplay() {
            const display = document.getElementById('timer-display');
            const status = document.getElementById('timer-status');
            
            display.textContent = formatTime(timerState.timeLeft);
            status.textContent = timerState.isBreak ? 'Break Time!' : 'Focus Time';
            display.className = 'timer-time' + (timerState.isBreak ? ' break' : '') + (timerState.isActive ? ' active' : '');
        }

        function toggleTimer() {
            const toggleBtn = document.getElementById('timer-toggle');
            const icon = document.getElementById('timer-icon');
            
            timerState.isActive = !timerState.isActive;
            
            if (timerState.isActive) {
                icon.textContent = '⏸';
                toggleBtn.className = 'btn btn-danger';
                startTimer();
            } else {
                icon.textContent = '▶';
                toggleBtn.className = 'btn btn-success';
                stopTimer();
            }
        }

        function startTimer() {
            timerState.interval = setInterval(function() {
                timerState.timeLeft--;
                updateTimerDisplay();
                
                if (timerState.timeLeft <= 0) {
                    if (!timerState.isBreak) {
                        timerState.sessions++;
                        timerState.timeLeft = 5 * 60;
                        timerState.isBreak = true;
                        document.getElementById('sessions-count').textContent = timerState.sessions;
                        updateStats();
                    } else {
                        timerState.timeLeft = 25 * 60;
                        timerState.isBreak = false;
                    }
                    
                    timerState.isActive = false;
                    document.getElementById('timer-toggle').click();
                    updateTimerDisplay();
                }
            }, 1000);
        }

        function stopTimer() {
            if (timerState.interval) {
                clearInterval(timerState.interval);
                timerState.interval = null;
            }
        }

        function resetTimer() {
            stopTimer();
            timerState.isActive = false;
            timerState.timeLeft = 25 * 60;
            timerState.isBreak = false;
            
            const toggleBtn = document.getElementById('timer-toggle');
            const icon = document.getElementById('timer-icon');
            icon.textContent = '▶';
            toggleBtn.className = 'btn btn-primary';
            
            updateTimerDisplay();
        }

        // Todo Functions
        function renderTodos() {
            const todoList = document.getElementById('todo-list');
            const progressElement = document.getElementById('todo-progress');
            const progressBar = document.getElementById('todo-progress-bar');
            
            const completed = todos.filter(function(todo) { return todo.completed; }).length;
            const total = todos.length;
            const percentage = total > 0 ? (completed / total) * 100 : 0;
            
            progressElement.textContent = completed + '/' + total;
            progressBar.style.width = percentage + '%';
            
            todoList.innerHTML = todos.map(function(todo) {
                return '<div class="todo-item ' + (todo.completed ? 'completed' : '') + '" data-id="' + todo.id + '">' +
                    '<button class="btn btn-secondary" onclick="toggleTodo(' + todo.id + ')" style="padding: 0.5rem; min-width: 40px;">' +
                    (todo.completed ? '✓' : '○') +
                    '</button>' +
                    '<span class="todo-text ' + (todo.completed ? 'completed' : '') + '">' + todo.text + '</span>' +
                    '<span class="badge badge-' + todo.priority + '">' + todo.priority + '</span>' +
                    '<button class="btn btn-danger" onclick="deleteTodo(' + todo.id + ')" style="padding: 0.5rem; min-width: 40px;">' +
                    '×' +
                    '</button>' +
                    '</div>';
            }).join('');
            
            updateStats();
        }

        function addTodo() {
            const input = document.getElementById('todo-input');
            const text = input.value.trim();
            
            if (text) {
                todos.push({
                    id: Date.now(),
                    text: text,
                    completed: false,
                    priority: 'medium'
                });
                input.value = '';
                renderTodos();
            }
        }

        function toggleTodo(id) {
            todos = todos.map(function(todo) {
                if (todo.id === id) {
                    return {
                        id: todo.id,
                        text: todo.text,
                        completed: !todo.completed,
                        priority: todo.priority
                    };
                }
                return todo;
            });
            renderTodos();
        }

        function deleteTodo(id) {
            todos = todos.filter(function(todo) { return todo.id !== id; });
            renderTodos();
        }

        function handleTodoKeyPress(event) {
            if (event.key === 'Enter') {
                addTodo();
            }
        }

        // Habit Functions
        function renderHabits() {
            const habitList = document.getElementById('habit-list');
            
            habitList.innerHTML = habits.map(function(habit) {
                return '<div class="habit-item ' + (habit.completedToday ? 'completed' : '') + '" data-id="' + habit.id + '">' +
                    '<div class="habit-header">' +
                    '<span class="habit-name">' + habit.name + '</span>' +
                    '<button class="btn ' + (habit.completedToday ? 'btn-success' : 'btn-secondary') + '" ' +
                    'onclick="toggleHabit(' + habit.id + ')" ' +
                    'style="padding: 0.5rem; min-width: 40px;">' +
                    (habit.completedToday ? '✓' : '○') +
                    '</button>' +
                    '</div>' +
                    '<div class="habit-streak">' +
                    '<span>Streak:</span>' +
                    '<span class="badge">' + habit.streak + ' days</span>' +
                    '</div>' +
                    '</div>';
            }).join('');
            
            updateStats();
        }

        function toggleHabit(id) {
            habits = habits.map(function(habit) {
                if (habit.id === id) {
                    const newCompleted = !habit.completedToday;
                    return {
                        id: habit.id,
                        name: habit.name,
                        completedToday: newCompleted,
                        streak: newCompleted ? habit.streak + 1 : Math.max(0, habit.streak - 1)
                    };
                }
                return habit;
            });
            renderHabits();
        }

        // Stats Functions
        function updateStats() {
            const completedTodos = todos.filter(function(todo) { return todo.completed; }).length;
            const totalTodos = todos.length;
            const completedHabits = habits.filter(function(habit) { return habit.completedToday; }).length;
            const progressPercentage = totalTodos > 0 ? Math.round((completedTodos / totalTodos) * 100) : 0;
            
            document.getElementById('stat-pomodoros').textContent = timerState.sessions;
            document.getElementById('stat-tasks').textContent = completedTodos;
            document.getElementById('stat-habits').textContent = completedHabits;
            document.getElementById('stat-progress').textContent = progressPercentage + '%';
        }

        // Quote Functions
        function rotateQuote() {
            const quoteElement = document.getElementById('daily-quote');
            const randomQuote = quotes[Math.floor(Math.random() * quotes.length)];
            quoteElement.style.opacity = '0';
            setTimeout(function() {
                quoteElement.textContent = randomQuote;
                quoteElement.style.opacity = '1';
            }, 300);
        }

        function updateClock() {
            const now = new Date();
            const timeStr = now.toLocaleTimeString();
            const dateStr = now.toDateString();
            document.getElementById('live-clock').textContent = timeStr;
            document.getElementById('clock-date').textContent = dateStr;
        }

        // Initialize App
        function initApp() {
            loadTheme();
            createParticles();
            updateTimerDisplay();
            renderTodos();
            renderHabits();
            updateStats();
            updateClock();
            setInterval(updateClock, 1000);
            
            // Set up quote rotation with fade effect
            setInterval(rotateQuote, 8000);
            
            // Add staggered animation delays to cards
            const cards = document.querySelectorAll('.card');
            cards.forEach(function(card, index) {
                card.style.animationDelay = (index * 0.1) + 's';
            });
        }

        // Start the app when page loads
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', initApp);
        } else {
            initApp();
        }
    </script>
</body>
</html>