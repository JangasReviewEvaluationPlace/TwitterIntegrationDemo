CREATE TABLE tweet (
    id BIGINT PRIMARY KEY,
    created_at TIMESTAMP,
    text TEXT,
    feedback_type VARCHAR(10),
    language VARCHAR(2)
);