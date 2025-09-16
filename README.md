# 🍔 Food App

تطبيق **Food Delivery** بسيط مبني باستخدام **Flutter**، مع إدارة الحالة بـ **BLoC (Cubit)** وتخزين البيانات عبر **Supabase**، بالإضافة إلى **API Authentication** لتسجيل الدخول والتسجيل.

---

## 🚀 Features
- 📱 واجهة مستخدم حديثة وسهلة الاستخدام (Responsive UI).
- 🔑 **Authentication** (تسجيل حساب + تسجيل دخول + تسجيل خروج) عبر API.
- 🍽️ عرض قائمة (Restaurants)  Supabase.
- 🛒 عرض قائمة  (Products) 
- 🗂️ هيكل مشروع منظم (Model → Services → Repository → Cubit → Screens).
- ⚡️ إدارة الحالة باستخدام **BLoC/Cubit**.
- ☁️ **Supabase** كخلفية (Backend as a Service).
- 🌐 تكامل كامل مع API خارجي للـ Auth.

---

##  Tech Stack
- **Framework:** Flutter (Dart)
- **State Management:** BLoC / Cubit
- **Backend:** Supabase
- **Authentication:** REST API
- **UI:** Material Design + Custom Widgets

---

##  Project Structure

├── models/ RestaurantModel و ProductModel
├── services/  Supabase / API calls
├── repository/ (Data Handling)
├── cubit/  (Cubit & States)
├── screens/  (Login, Restaurants, Products, ...)
└── main.dart 

1. كلون المشروع:
   ```bash
   git clone https://github.com/username/food_app.git
   cd food_app

   Future Improvements

🛒 إضافة سلة (Cart) و Checkout.

⭐️ تقييم المطاعم والأصناف.

📍 دعم تحديد الموقع الجغرافي (GPS).

🔔 إشعارات Push Notifications.

👨‍💻 Author Developed by ZeyadMowafe 
