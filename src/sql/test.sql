/*
INSERT INTO task (id, title) VALUES ('012345678912345', 'test');
INSERT INTO task (id, title, priority) VALUES ('012345678912345', 'test', 'a');

SELECT * FROM task;

INSERT INTO task (id, title) VALUES ('012345678912346', 'test');

UPDATE task SET title = 'updated' WHERE id IS NOT NULL;

PRAGMA table_info(task);
*/
