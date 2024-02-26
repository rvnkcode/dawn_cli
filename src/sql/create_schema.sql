-- From user_version 0 to 1
CREATE TABLE IF NOT EXISTS task (
    id TEXT PRIMARY KEY CHECK (length(id) = 15),
    title TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT current_timestamp,
    updated_at DATETIME NOT NULL DEFAULT current_timestamp
);

CREATE TRIGGER IF NOT EXISTS updated_at_task AFTER UPDATE ON task
FOR EACH ROW BEGIN UPDATE task
SET updated_at = datetime('now') WHERE id = new.id;
END;

-- uncomment when DB schema is completed
-- PRAGMA user_version = 1;
