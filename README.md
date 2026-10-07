# 🪔 SIHASTHA UJJAIN — 3D Sacred Hotel & Homestay Booking Platform

> **"Your Stay. Your Sihastha. Your Divine Journey."**  
> Premium spiritual pilgrimage accommodation booking platform specifically designed for devotees visiting **Ujjain for Sihastha / Maha Kumbh Mela**.  
> Features an immersive **Three.js 3D hero atmosphere**, interactive **Leaflet pilgrimage map**, and the signature **10% Advance Pre-Booking System**.

---

## 🌟 Key Highlights & Architectural Features

1. **Sacred 3D Hero Experience (Three.js)**
   - Atmospheric 3D brass diya with realistic flickering flame light and emissive glow.
   - Silhouettes of the ancient Mahakaleshwar temple spire (Shikhara) and Ujjain heritage arches.
   - Flowing holy Shipra river plane with animated wave ripples and golden reflections.
   - Floating marigold petals drifting gently in 3D space with subtle incense embers.
   - Smooth mouse-tracking parallax camera movement with performance auto-pausing when out of viewport.

2. **10% Pre-Booking System (Core Innovation)**
   - Protects devotees during high-demand Kumbh rush without paying full price upfront.
   - Every property and room displays:
     - Full room tariff (e.g. `₹4,800/night`)
     - **Pre-book today for only 10%: ₹480**
     - *Remaining 90% (₹4,320) payable at check-in*
   - Interactive rate calculation slider and visual 4-step progress tracker.

3. **Curated Ujjain Accommodations (12+ Verified Properties, 20+ Rooms)**
   - Luxury hotels (Mahakal Heritage Residency, Avantika Palace).
   - Riverside homestays (Shipra Divine Stay, Shipra View Retreat).
   - Traditional family havelis (Shree Mahakal Homestay, Rudraksh Villa, Vedic Kutir).
   - Station transit comfort hotels (Triveni Grand Hotel).
   - High-resolution realistic photography, distance metrics to Mahakaleshwar & Shipra, amenities, and pure sattvic meal policies.

4. **Interactive Pilgrimage Map (Leaflet & OpenStreetMap)**
   - Custom gold-and-temple styled interactive map of Ujjain.
   - Categorized markers for:
     - 🔱 Temples (Mahakaleshwar Jyotirlinga, Kal Bhairav, Harsiddhi Shaktipeeth, Mangalnath, Sandipani)
     - 🌊 Bathing Ghats (Ram Ghat, Shipra River)
     - 🏨 Hotels & 🏡 Homestays
     - 🚆 Transit Hubs (Ujjain Junction, Nanakheda Bus Terminal, Indore Airport Highway)
   - Route simulation drawing walking & vehicle lines with estimated travel times.

5. **Simulated Payment Gateway & Confirmed Digital Pass**
   - UPI (Interactive QR Code + Google Pay / PhonePe / Paytm one-click simulation).
   - Credit / Debit Card & Net Banking options.
   - Instant Confirmed Booking Pass with unique Booking ID (`SIH-2026-XXXXXX`), QR code for hotel check-in, and printable/downloadable format.

6. **Devotee Dashboard ("My Sihastha")**
   - View active and past reservations.
   - Download official pilgrim check-in passes.
   - Instant "Get Directions" on Google Maps.
   - Contact property desk (Call & WhatsApp simulation).
   - 1-click booking cancellation with 100% refund of the 10% advance deposit.

7. **Admin Operations Hub**
   - Real-time KPI analytics: Total properties, rooms, bookings, total revenue, 10% advance collected in escrow, and remaining due on arrival.
   - Property manager: Add new hotels/homestays, update base tariffs, edit availability.
   - Bookings manager: Search by ID, filter, and toggle status (`Confirmed`, `Checked-In`, `Completed`, `Cancelled`).

8. **Spiritual Heritage & Experiences**
   - Discover Ujjain: Detailed guides on the 8 sacred shrines with visiting and aarti timings.
   - Sihastha Timeline: History, astrological significance (Jupiter in Leo), and royal bath (Shahi Snan) guides.
   - Beyond Your Stay: Accompanied Bhasma Aarti guidance, private Shipra evening aarti boat rides, and authentic Malwi Bhoj feasts.
   - 24/7 Emergency & pilgrim assistance helpline directory (clearly marked demo).

---

## 📁 Project Structure

```text
sihastra/
├── backend/                  # Node.js + Express REST API Server
│   ├── data/
│   │   └── mockData.js       # Seed dataset (Properties, Rooms, Bookings, Attractions)
│   ├── server.js             # Express API routes, 10% calculation engine, Admin stats
│   └── package.json
│
├── frontend/                 # React + Vite + Tailwind CSS + Three.js
│   ├── src/
│   │   ├── components/
│   │   │   ├── 3d/
│   │   │   │   └── HeroScene3D.jsx         # Three.js 3D Diya, Temple Spire, Waves
│   │   │   ├── admin/
│   │   │   │   └── AdminDashboard.jsx      # Admin KPI dashboard & property management
│   │   │   ├── auth/
│   │   │   │   └── AuthModal.jsx           # Devotee & Admin login with 1-click demo
│   │   │   ├── booking/
│   │   │   │   └── BookingModal.jsx        # 10% Pre-Booking & mock payment gateway
│   │   │   ├── common/
│   │   │   │   ├── Footer.jsx              # Spiritual footer with quick links
│   │   │   │   ├── LoadingScreen.jsx       # Glowing Diya loading sequence
│   │   │   │   └── Navbar.jsx              # Sticky glassmorphic navbar with badge
│   │   │   ├── dashboard/
│   │   │   │   └── MyBookingsModal.jsx     # "My Sihastha" user dashboard & digital passes
│   │   │   ├── home/
│   │   │   │   ├── DevoteeReviews.jsx      # Verified pilgrim testimonials
│   │   │   │   ├── DiscoverUjjain.jsx      # 8 Auspicious shrines of Ujjain
│   │   │   │   ├── EmergencySection.jsx    # 24/7 Emergency helplines (Demo)
│   │   │   │   ├── ExperiencesSection.jsx  # Bhasma Aarti, Boat Aarti, Malwi Thali
│   │   │   │   ├── HeroSection.jsx         # Cinematic hero & stay search bar
│   │   │   │   ├── PhotoGallery.jsx        # Devotional masonry gallery & lightbox
│   │   │   │   ├── SihasthaInfo.jsx        # Festival timeline & pilgrim etiquette
│   │   │   │   └── TenPercentBanner.jsx    # 10% Advance system & interactive slider
│   │   │   ├── map/
│   │   │   │   └── InteractiveMapSection.jsx # Leaflet map with custom spiritual pins
│   │   │   └── stays/
│   │   │       ├── ExploreStays.jsx        # Filterable property listing
│   │   │       ├── PropertyCard.jsx        # Room card with visible 10% price tag
│   │   │       └── PropertyDetailModal.jsx # Full gallery, rooms list, and policies
│   │   ├── data/
│   │   │   └── mockData.js                 # Resilient client API client & offline fallback
│   │   ├── styles/
│   │   │   └── index.css                   # Tailwind styles, gold glassmorphism, scrollbars
│   │   ├── App.jsx                         # Main app controller & routing
│   │   └── main.jsx
│   ├── index.html                          # Fonts (Cinzel, Plus Jakarta Sans) & Leaflet CSS
│   ├── vite.config.js                      # Dev proxy to port 5000
│   ├── tailwind.config.js                  # Spiritual color palette tokens
│   └── package.json
│
├── database/                 # Production Database Ready
│   ├── schema.sql            # PostgreSQL DDL with indexes and generated columns
│   └── seed.sql              # Seed records for properties, rooms, users
│
├── start-all.bat             # One-click Windows batch script to run both backend & frontend
└── README.md
```

---

## 🚀 How to Run Locally

### Prerequisites
- **Node.js**: v18.0.0 or later (Tested on Node v24.19)
- **npm**: v9.0 or later

### Step 1: Install Dependencies
Open your terminal (PowerShell or Command Prompt):

```powershell
# 1. Install Backend Dependencies
cd backend
npm.cmd install

# 2. Install Frontend Dependencies
cd ../frontend
npm.cmd install
```

### Step 2: Start Backend Server
```powershell
cd backend
npm.cmd start
```
*Backend will run on **http://localhost:5000*** with active health check at `/api/health`.

### Step 3: Start Frontend Dev Server
Open a second terminal window:
```powershell
cd frontend
npm.cmd run dev
```
*Frontend will run on **http://localhost:3000***.

### Or One-Click Startup on Windows:
Double-click `start-all.bat` in the project root to launch both servers simultaneously in separate windows!

---

## 🛢️ Replacing Mock Data with Real Database Data

1. **PostgreSQL Setup**:
   - Run the provided `database/schema.sql` on your PostgreSQL instance (e.g. AWS RDS, Supabase, Neon, or local PostgreSQL).
   - Run `database/seed.sql` to populate initial properties.
2. **Connect Backend**:
   - In `backend/server.js`, replace the in-memory array operations with standard `pg` (node-postgres) queries or Prisma ORM. The JSON response structures are 100% matched to the database schema.
3. **Property Images**:
   - Update image URLs in `backend/data/mockData.js` or via the Admin Dashboard's "Add Property" interface.

---

## 🙏 Sacred Mantra
*कर्पूरगौरं करुणावतारं संसारसारम् भुजगेन्द्रहारम् ।*  
*सदावसन्तं हृदयारविन्दे भवं भवानीसहितं नमामि ॥*  
**जय श्री महाकाल | हर हर महादेव**
