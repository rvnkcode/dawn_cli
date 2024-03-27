-- From user_version 0 to 1
CREATE TABLE IF NOT EXISTS contact (
    id TEXT PRIMARY KEY CHECK (length(id) = 15),
    name TEXT NOT NULL UNIQUE,
    created_at DATETIME NOT NULL DEFAULT current_timestamp
);

CREATE TABLE IF NOT EXISTS context (
    id INT PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS project (
    id TEXT PRIMARY KEY CHECK (length(id) = 15),
    title TEXT NOT NULL,
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT current_timestamp,
    updated_at DATETIME NOT NULL DEFAULT current_timestamp,
    deleted_at DATETIME
);

CREATE TABLE IF NOT EXISTS task (
    id TEXT PRIMARY KEY CHECK (length(id) = 15),
    -- Got lint parser error but works fine
    -- priority TEXT CHECK (priority GLOB '[A-Z]'), 
    title TEXT NOT NULL,
    note TEXT,
    project TEXT REFERENCES project (id),
    context INT REFERENCES context (id),
    delegated_to TEXT REFERENCES contact (id),
    due_date DATE,
    planned_date DATE,
    created_at DATETIME NOT NULL DEFAULT current_timestamp,
    started_at DATETIME,
    completed_at DATETIME,
    updated_at DATETIME NOT NULL DEFAULT current_timestamp,
    deleted_at DATETIME
);

CREATE TRIGGER IF NOT EXISTS updated_at_project AFTER UPDATE ON project
FOR EACH ROW BEGIN UPDATE project
SET updated_at = datetime('now') WHERE id = new.id;
END;

CREATE TRIGGER IF NOT EXISTS updated_at_task AFTER UPDATE ON task
FOR EACH ROW BEGIN UPDATE task
SET updated_at = datetime('now') WHERE id = new.id;
END;

-- uncomment when DB schema is completed
-- PRAGMA user_version = 1;
