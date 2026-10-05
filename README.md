# 📖 Medium Clone – Database & Authentication Engine

A production-ready PostgreSQL architecture and authentication schema built for a Medium-style blogging platform. 

This repository contains the complete relational schema supporting user registration, email verification, JWT refresh token rotation, membership subscriptions (Stripe-ready), metered paywalls, and role-based access control (RBAC).

---

## 🚀 Key Modules Covered

1. **Account Registration & Verification:** Secure hashing (`bcrypt`/`Argon2`), token generation, and email verification lifecycle.
2. **Session & Auth Management:** Short-lived access tokens coupled with rotatable, revokable refresh tokens.
3. **User Preferences & Settings:** 2FA status, JSONB notification toggles, and profile preferences.
4. **Subscription & Paywall:** Monetized post flags (`is_locked`), reader history tracking for free-tier limits, and billing status tracking.
5. **Role-Based Access Control (RBAC):** Strict roles (`user`, `member`, `editor`, `admin`) to partition reader, writer, and administrative powers.
6. **Audit Trail:** Immutable admin action logs storing changes in structured JSONB format.

---

## 🗄️ Database Entity Overview

```text
       +------------------+
       |      users       |
       +--------+---------+
                |
    +-----------+-----------+-----------+-----------+
    | 1:1       | 1:N       | 1:N       | 1:N       | 1:N
    v           v           v           v           v
+-------+   +-------+   +-------+   +-------+   +-------+
| user_ |   | posts |   | subsc |   |refresh|   | audit |
|settings   |       |   |ription|   |_tokens|   |_logs  |
+-------+   +---+---+   +-------+   +-------+   +-------+
                |
                | N:M (via user_reading_history)
                v
       +------------------+
       |  reading_history |
       +------------------+
