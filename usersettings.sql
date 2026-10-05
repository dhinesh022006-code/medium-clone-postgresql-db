-- 1. Create Fixed Enum Types for Roles and Status
CREATE TYPE user_role AS ENUM ('READER', 'AUTHOR', 'MODERATOR', 'ADMIN');
CREATE TYPE account_status AS ENUM ('PENDING', 'ACTIVE', 'DEACTIVATED', 'BANNED');

-- 2. Create Master Users Table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role user_role DEFAULT 'READER',
    status account_status DEFAULT 'PENDING',
    is_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);