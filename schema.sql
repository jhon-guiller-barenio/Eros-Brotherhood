CREATE TABLE IF NOT EXISTS activities (id TEXT PRIMARY KEY,title VARCHAR(120) NOT NULL,description TEXT NOT NULL,location VARCHAR(200) NOT NULL,starts_at TIMESTAMPTZ NOT NULL,ends_at TIMESTAMPTZ NOT NULL,created_by TEXT NOT NULL,created_at TIMESTAMPTZ DEFAULT NOW(),CHECK(ends_at>starts_at));
CREATE TABLE IF NOT EXISTS attendance (activity_id TEXT REFERENCES activities(id) ON DELETE CASCADE,user_id TEXT NOT NULL,name TEXT NOT NULL,checked_at TIMESTAMPTZ DEFAULT NOW(),PRIMARY KEY(activity_id,user_id));
CREATE TABLE IF NOT EXISTS activity_log (id BIGSERIAL PRIMARY KEY,user_id TEXT NOT NULL,name TEXT NOT NULL,event TEXT NOT NULL,details TEXT NOT NULL DEFAULT '',created_at TIMESTAMPTZ DEFAULT NOW());
CREATE INDEX IF NOT EXISTS attendance_user ON attendance(user_id);
CREATE INDEX IF NOT EXISTS activity_log_recent ON activity_log(created_at DESC);
