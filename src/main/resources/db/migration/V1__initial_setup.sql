CREATE TYPE user_role AS ENUM ('ADMIN', 'PATIENT', 'DOCTOR', 'NURSE');

CREATE TABLE "tb_user" (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role user_role NOT NULL,
    created_at TIMESTAMPTZ DEFAULT current_timestamp NOT NULL,
    last_login TIMESTAMPTZ,
    last_password_change TIMESTAMPTZ,
    is_active BOOLEAN DEFAULT TRUE NOT NULL
);
