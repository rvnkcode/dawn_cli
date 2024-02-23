use rusqlite::Connection;
use std::{fs, path::PathBuf};

fn main() {
    let mut path = define_path();
    path = check_dir(&path);
    check_db(&path);
}

fn define_path() -> PathBuf {
    dirs::home_dir().unwrap().join(".dawn")
}

fn check_dir(path: &PathBuf) -> PathBuf {
    if !&path.exists() {
        fs::create_dir(&path).unwrap();
    }
    path.join("dawn.db")
}

fn check_db(path: &PathBuf) {
    let _conn = Connection::open(&path).unwrap();
    // TODO: Check if the DB schema is fine
    /*
    conn.pragma_query_value("dawn", "user_version", |row| row.get(0)).unwrap();
    conn.execute_batch(include_str!("./sql/create_schema.sql")).expect("");
    */
}
