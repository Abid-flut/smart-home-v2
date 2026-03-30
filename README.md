# 🚀 Real-Time Smart Home System (Flutter + Firebase + Home Assistant)

A scalable Flutter-based smart home system designed using **clean architecture principles**.  
The application integrates **Firebase authentication**, **Home Assistant device control**, **Weather API**, and **WebSocket-based real-time synchronization**.

⚡ Upgraded from polling (REST) to **event-driven architecture using WebSockets** for instant device updates.

---

## 📱 Overview

This project demonstrates how to build a **production-style mobile system**, not just a feature-based app.

Includes multiple domains:
- Authentication
- Smart devices
- Real-time weather data

It focuses on:
- System design
- Scalability
- Separation of concerns
- Real-time communication

---

## 🚀 Features

- 🔐 Firebase Authentication (real user login & session persistence)
- 🏠 Home Assistant integration (real smart device control)
- ⚡ WebSocket real-time synchronization (event-driven updates)
- 🌤 Weather API integration (real-time weather display)
- 🧠 Clean architecture (Provider + Service layer)
- 🔄 Replaceable service implementations (Mock → Firebase / HA)
- 🧩 Modular and scalable design

---

## 🏗 Architecture

```
UI (Flutter Widgets)
 ↓
Providers (State Management - SSOT)
   ├── AuthProvider
   ├── DeviceProvider
   └── WeatherProvider
 ↓
Coordinator (Cross-domain orchestration)
 ↓
Services
   ├── FirebaseAuthService
   ├── HaDeviceService (REST API)
   └── HaWebSocketService (Real-time)
 ↓
Backend
   ├── Firebase (Authentication)
   ├── Home Assistant (Devices)
   └── Weather API

```

---

## 🌤 Weather Integration

- Fetches real-time weather data using external API  
- Displays current city weather (e.g., Bucharest)  
- Managed through **WeatherProvider** (domain separation)

---

## 🧠 Key Engineering Concepts

- **Dependency Inversion**  
  → Services are interchangeable without affecting business logic  

- **Single Source of Truth (SSOT)**  
  → DeviceProvider manages all device state  

- **Event-Driven Architecture**  
  → WebSocket replaces polling for real-time updates  

- **Domain Separation**  
  → Auth, Devices, and Weather are isolated modules  

- **Orchestration Layer**  
  → Coordinates cross-domain behavior (Auth → Devices)

---

## 🔄 System Evolution

| Stage | Approach |
|------|--------|
| Initial | REST polling (manual refresh) |
| Final | WebSocket event-driven (real-time sync) |

---

## 🛠 Tech Stack

- **Frontend:** Flutter, Dart  
- **State Management:** Provider  
- **Authentication:** Firebase Auth  
- **Backend Integration:** Home Assistant (REST API)  
- **Real-Time Communication:** WebSocket  
- **Weather API:** External REST API  
- **Architecture:** Clean Architecture (Service + Provider pattern)

---

## 🧪 Testing

- ✅ Device state sync (Flutter ↔ Home Assistant)
- ✅ Real-time updates via WebSocket
- ✅ Authentication (login/logout/session persistence)
- ✅ Weather data fetching and display
- ✅ Error handling and edge cases

---

## ⚠️ Limitations

- WebSocket reconnection strategy can be improved
- Timer/scheduling system not yet implemented
- Firebase security rules can be further enhanced

---

## 🔮 Future Improvements

- Add reconnection handling for WebSocket
- Implement device scheduling (timers)
- Improve offline support
- Add unit and integration tests
- Enhance security (Firebase rules + token handling)

---

## 🎥 Demo

Live demonstration of real-time device control and synchronization using WebSocket.




<video src="https://github.com/user-attachments/assets/6892fcd2-01b3-4e91-828b-19efdddc3ca4" controls width="600"></video>

---

## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/74a09e6b-8d60-4988-9a05-6fc8e1a0137d" width="250"/>
  <img src="https://github.com/user-attachments/assets/4d4b050a-0574-4213-abe8-8029b2a52744" width="250"/>
</p>

---

## 👨‍💻 Author

**Abid Ahmed**  
Junior Flutter Developer  

📧 abidahmeddddd.com  
🔗 GitHub: https://github.com/Abid-flut  
🔗 LinkedIn: https://www.linkedin.com/in/abid-ahmed-flut/

---

## ⭐ Key Takeaway

This project demonstrates how to:

> Build a **real-time, scalable mobile system** using clean architecture and modern engineering practices — not just a simple app.
