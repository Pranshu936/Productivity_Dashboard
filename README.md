

# 🌟 Productivity Dashboard

A responsive and interactive Productivity Dashboard built using **Java Servlets** with **Jakarta EE**, deployed on **Apache Tomcat 11**, and managed with **Maven**. It includes features like a Pomodoro timer, To-do list, live clock, inspirational quotes, habit tracker, and daily productivity stats—all on a beautifully animated interface.

---

## 🚀 Features

- ⏱ **Pomodoro Timer** with session tracking  
- 🎯 **To-Do List** with progress bar and task completion  
- ⏰ **Live Clock** with local date and time  
- 💭 **Daily Inspirational Quotes**  
- 📈 **Habit Tracker**  
- 📊 **Productivity Stats** for the day  
- 🎨 **Animated UI** with floating shapes, orbs, waves, and dark/light mode toggle

---

## 🛠️ Technologies Used

- **Java Servlet API (Jakarta EE)**
- **Apache Tomcat 11**
- **Maven** for dependency and build management
- **HTML/CSS/JavaScript** for the frontend
- **Jakarta Servlet 6.0+**
- Optional: **JSP** or **JSTL** (if server-side templating is used)






---

## 📦 Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/pranshu936/productivity-dashboard.git
cd productivity-dashboard
````

### 2. Build using Maven

Ensure you have Maven installed. Then run:

```bash
mvn clean install
```

### 3. Configure Tomcat 11

Ensure Tomcat 11 is installed. Copy the generated `.war` file from the `target/` directory to the `webapps/` folder of your Tomcat installation:

```bash
cp target/ProductivityDashboard.war /path/to/tomcat/webapps/
```

### 4. Start the Tomcat Server

Start the Tomcat server:

```bash
cd /path/to/tomcat/bin
./startup.sh    # Linux/Mac
startup.bat     # Windows
```

### 5. Visit in Browser

Navigate to:

```
http://localhost:8080/ProductivityDashboard/
```

---

## 🌐 URLs and Routes

> If using Servlets mapped via `web.xml` or annotations:

* `/todo` → Handles to-do list CRUD
* `/timer` → Timer state and session counter
* `/quote` → (optional) Dynamic daily quote (or hardcoded in frontend)
* `/stats` → Daily productivity data API

---

## ✅ Requirements

* Java 17+
* Apache Tomcat 11+
* Maven 3.8+
* Modern Web Browser

---

## 🔒 Note on Jakarta Compatibility

Tomcat 10+ uses the Jakarta Servlet namespace (`jakarta.servlet.*`). Ensure your imports and dependencies are updated accordingly in both `pom.xml` and Java files.

