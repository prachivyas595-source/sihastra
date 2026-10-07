-- SIHASTHA UJJAIN SEED DATA
-- Insert realistic sample records for Ujjain pilgrimage hotels, homestays, rooms, and attractions

-- 1. SEED USERS
INSERT INTO users (id, name, email, phone, password_hash, city, role)
VALUES 
('usr-demo-01', 'Ananya Verma', 'ananya@sihastha.demo', '+91 98765 43210', '$2b$10$demo_hash_devotee', 'Delhi NCR', 'devotee'),
('usr-admin-01', 'Mahakal Temple Board Admin', 'admin@sihastha.gov.in', '+91 734 255 0001', '$2b$10$demo_hash_admin', 'Ujjain', 'admin')
ON CONFLICT (id) DO NOTHING;

-- 2. SEED PROPERTIES
INSERT INTO properties (id, name, type, tagline, description, address, landmark, distance_mahakal, distance_shipra, distance_railway, latitude, longitude, rating, reviews_count, starting_price, featured, category, images, amenities)
VALUES
(
  'prop-01',
  'Mahakal Heritage Residency',
  'Hotel',
  '5-Star Spiritual Luxury just 350m from Mahakaleshwar Jyotirlinga',
  'An opulent sanctuary of tranquility blending classic Malwa palace architecture with modern 5-star comforts.',
  '14/2 Mahakal Marg, Near Gate No. 4, Ujjain, MP - 456006',
  '350 meters from Mahakaleshwar Temple',
  '350m (4 mins walk)',
  '600m (7 mins walk)',
  '1.6 km',
  23.1841,
  75.7699,
  4.9,
  342,
  4800,
  true,
  'Near Mahakaleshwar',
  '["https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80", "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80"]',
  '["Temple Shuttle", "Pure Sattvic Restaurant", "Free High-Speed Wi-Fi", "Air Conditioning", "24/7 Hot Geyser Water", "Bhasma Aarti Escort Desk"]'
),
(
  'prop-02',
  'Shipra Divine Stay & Ghat Retreat',
  'Homestay',
  'Serene Riverside Homestay Overlooking Historic Ram Ghat',
  'Wake up to holy Shipra river breezes and morning temple bells. Managed by a revered local cultural family.',
  '21 Ram Ghat Marg, Danigate, Ujjain, MP - 456001',
  'Directly opposite Ram Ghat Bathing Steps',
  '750m (9 mins walk)',
  '50m (1 min walk)',
  '2.1 km',
  23.1855,
  75.7621,
  4.85,
  218,
  3200,
  true,
  'Near Shipra River',
  '["https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1200&q=80", "https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=800&q=80"]',
  '["River View Balconies", "Home Cooked Sattvic Meals", "Free Wi-Fi", "Air Conditioning", "Terrace Aarti Viewing"]'
)
ON CONFLICT (id) DO NOTHING;

-- 3. SEED ROOMS
INSERT INTO rooms (id, property_id, room_name, room_type, description, price_per_night, capacity_adults, capacity_children, bed_type, room_size_sqft, amenities, images)
VALUES
(
  'room-01-deluxe',
  'prop-01',
  'Deluxe King Heritage Room',
  'Deluxe Room',
  'Lavish 320 sq.ft room with handcrafted teakwood king bed and rain shower.',
  4800,
  2,
  1,
  'King Bed',
  320,
  '["Air Conditioning", "Free High-Speed Wi-Fi", "Geyser with 24/7 Hot Water", "Daily Housekeeping"]',
  '["https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80"]'
),
(
  'room-02-riverview',
  'prop-02',
  'Shipra Ghat View Room',
  'Deluxe Room',
  'Traditional room with direct view of evening Aarti on Ram Ghat.',
  3200,
  2,
  1,
  'Queen Bed',
  280,
  '["River View Balcony", "Air Conditioning", "Free Wi-Fi", "Hot Water"]',
  '["https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=800&q=80"]'
)
ON CONFLICT (id) DO NOTHING;
