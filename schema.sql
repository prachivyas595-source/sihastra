-- SIHASTHA UJJAIN PILGRIMAGE ACCOMMODATION DATABASE SCHEMA
-- PostgreSQL Compatible DDL
-- Designed for High Scalability & Rapid Retrieval during Kumbh Mela

-- Enable UUID extension if available
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. USERS TABLE
CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(32) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    city VARCHAR(128) NOT NULL,
    emergency_contact VARCHAR(64),
    role VARCHAR(32) DEFAULT 'devotee', -- 'devotee', 'property_owner', 'admin'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. PROPERTIES TABLE (Hotels, Homestays, Guest Houses, Dharamshalas)
CREATE TABLE IF NOT EXISTS properties (
    id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(64) NOT NULL, -- 'Hotel', 'Homestay', 'Guest House', 'Dharamshala'
    tagline VARCHAR(255),
    description TEXT NOT NULL,
    address TEXT NOT NULL,
    landmark VARCHAR(255),
    distance_mahakal VARCHAR(64) NOT NULL, -- e.g., '350m (4 mins walk)'
    distance_shipra VARCHAR(64),           -- e.g., '600m (7 mins walk)'
    distance_railway VARCHAR(64),          -- e.g., '1.8 km'
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    rating DECIMAL(3, 2) DEFAULT 4.8,
    reviews_count INT DEFAULT 0,
    starting_price INT NOT NULL,           -- Base starting price per night
    advance_percentage INT DEFAULT 10,     -- 10% Pre-Booking System
    featured BOOLEAN DEFAULT false,
    verified BOOLEAN DEFAULT true,
    category VARCHAR(64),                  -- 'Near Mahakaleshwar', 'Near Shipra River', 'Luxury', 'Budget', 'Family'
    images JSONB NOT NULL,                 -- Array of image URLs with captions
    amenities JSONB NOT NULL,              -- Array of amenities strings
    policies JSONB,                        -- Check-in time, check-out time, cancellation rules
    contact_phone VARCHAR(32),
    contact_email VARCHAR(128),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 3. ROOMS TABLE
CREATE TABLE IF NOT EXISTS rooms (
    id VARCHAR(64) PRIMARY KEY,
    property_id VARCHAR(64) NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
    room_name VARCHAR(255) NOT NULL,       -- 'Deluxe Double Room', 'Sacred Family Suite'
    room_type VARCHAR(64) NOT NULL,       -- 'Standard', 'Deluxe', 'Premium', 'Suite', 'Dormitory'
    description TEXT,
    price_per_night INT NOT NULL,          -- e.g., 4500
    advance_price INT GENERATED ALWAYS AS (ROUND(price_per_night * 0.10)) STORED, -- 10%
    remaining_at_stay INT GENERATED ALWAYS AS (price_per_night - ROUND(price_per_night * 0.10)) STORED,
    capacity_adults INT NOT NULL DEFAULT 2,
    capacity_children INT DEFAULT 1,
    bed_type VARCHAR(64) DEFAULT 'King Bed',
    room_size_sqft INT DEFAULT 260,
    amenities JSONB NOT NULL,              -- ['Air Conditioning', 'Free Wi-Fi', 'Attached Geyser Bathroom', 'Temple View']
    images JSONB NOT NULL,                 -- Array of room specific images
    total_inventory INT DEFAULT 10,
    available_inventory INT DEFAULT 8,
    is_available BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 4. BOOKINGS TABLE (Features 10% Advance deposit model)
CREATE TABLE IF NOT EXISTS bookings (
    id VARCHAR(64) PRIMARY KEY,           -- e.g., 'SIH-2026-004821'
    user_id VARCHAR(64) NOT NULL REFERENCES users(id) ON DELETE SET NULL,
    property_id VARCHAR(64) NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
    room_id VARCHAR(64) NOT NULL REFERENCES rooms(id) ON DELETE CASCADE,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    nights INT NOT NULL DEFAULT 1,
    rooms_booked INT NOT NULL DEFAULT 1,
    guests_count INT NOT NULL DEFAULT 2,
    primary_guest_name VARCHAR(255) NOT NULL,
    primary_guest_phone VARCHAR(32) NOT NULL,
    primary_guest_email VARCHAR(255) NOT NULL,
    guest_city VARCHAR(128),
    special_requests TEXT,
    total_amount DECIMAL(10, 2) NOT NULL,
    advance_amount DECIMAL(10, 2) NOT NULL,  -- 10% pre-paid
    remaining_amount DECIMAL(10, 2) NOT NULL, -- 90% payable at property
    payment_method VARCHAR(64),               -- 'UPI', 'Card', 'Net Banking'
    payment_transaction_id VARCHAR(128),
    payment_status VARCHAR(32) DEFAULT 'PAID_10_PERCENT', -- 'PENDING', 'PAID_10_PERCENT', 'FULLY_PAID'
    booking_status VARCHAR(32) DEFAULT 'Confirmed',       -- 'Confirmed', 'Checked-In', 'Completed', 'Cancelled'
    cancellation_reason TEXT,
    booking_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 5. REVIEWS TABLE
CREATE TABLE IF NOT EXISTS reviews (
    id VARCHAR(64) PRIMARY KEY,
    user_id VARCHAR(64) REFERENCES users(id) ON DELETE SET NULL,
    property_id VARCHAR(64) NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
    user_name VARCHAR(255) NOT NULL,
    user_city VARCHAR(128),
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    stay_purpose VARCHAR(128) DEFAULT 'Mahakal Darshan & Snan',
    is_verified_pilgrim BOOLEAN DEFAULT true,
    review_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 6. SPIRITUAL ATTRACTIONS TABLE (For Pilgrimage Guide & Distance Calculations)
CREATE TABLE IF NOT EXISTS attractions (
    id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    significance TEXT NOT NULL,
    description TEXT NOT NULL,
    image_url TEXT NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    visiting_hours VARCHAR(128),
    aarti_timings VARCHAR(128),
    category VARCHAR(64), -- 'Temple', 'Ghat', 'Ashram', 'Historical'
    travel_tips TEXT
);

-- INDEXES FOR MAXIMUM SEARCH SPEED
CREATE INDEX IF NOT EXISTS idx_properties_type ON properties(type);
CREATE INDEX IF NOT EXISTS idx_properties_rating ON properties(rating DESC);
CREATE INDEX IF NOT EXISTS idx_properties_price ON properties(starting_price ASC);
CREATE INDEX IF NOT EXISTS idx_rooms_property ON rooms(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_user ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_reviews_property ON reviews(property_id);
