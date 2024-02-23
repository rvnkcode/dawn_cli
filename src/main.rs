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
    if !path.exists() {
        fs::create_dir(path).unwrap();
    }
    path.join("dawn.db")
}

fn check_db(path: &PathBuf) {
    let conn = Connection::open(path).unwrap();
    let user_version: u32 = conn
        .pragma_query_value(None, "user_version", |row| row.get(0))
        .unwrap();
    // TODO: backup DB
    // println!("{user_version}");
    if user_version != 1 {
        conn.execute_batch(include_str!("./sql/create_schema.sql"))
            .expect("");
    }
    // TODO: restore backup
}
