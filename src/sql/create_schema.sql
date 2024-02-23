DROP TABLE IF EXISTS task;

CREATE TABLE IF NOT EXISTS task (
    id TEXT PRIMARY KEY CHECK (length(id) = 15),
    title TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT current_timestamp,
    updated_at DATETIME NOT NULL DEFAULT current_timestamp
);

-- TODO: add trigger update updated_at

-- uncomment when DB schema is completed
-- PRAGMA user_version = 1;
