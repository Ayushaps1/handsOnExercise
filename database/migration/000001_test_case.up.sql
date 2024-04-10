CREATE TABLE "users" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    image TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);


CREATE TABLE IF NOT EXISTS "log_settings" (
  -- log_setting_id SERIAL PRIMARY KEY,
  log_setting_id INTEGER PRIMARY KEY AUTOINCREMENT,
  log_setting_name VARCHAR(20) UNIQUE NOT NULL,
  creator_id CHARACTER VARYING(36),
  settings JSONB NOT NULL,
  default_setting  BOOLEAN DEFAULT FALSE
);


CREATE TABLE IF NOT EXISTS "configurations"
(
  -- config_id character varying(100) PRIMARY KEY,
  config_id INTEGER PRIMARY KEY AUTOINCREMENT,
  config_name VARCHAR(30) NOT NULL UNIQUE,
  config_description Text NULL,
  creator_id CHARACTER VARYING(36),
  modifier_id CHARACTER VARYING(36),
  config_intermediate_object JSONB NULL,
  config_status TEXT DEFAULT 'Not Executed',
  elapse_time TEXT DEFAULT NULL,
  log_option_id INTEGER, -- Reference to log_settings table
  -- config_file JSONB NULL,
  executed_date TIMESTAMP DEFAULT NULL,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deleted_date TIMESTAMP DEFAULT NULL,
  FOREIGN KEY (log_option_id) REFERENCES log_settings(log_setting_id)
);

CREATE TABLE IF NOT EXISTS "sample_configurations"
(
  
  config_id INTEGER PRIMARY KEY AUTOINCREMENT,
  config_name VARCHAR(30) NOT NULL UNIQUE,
  config_description Text NULL,
  creator_id CHARACTER VARYING(36),
  modifier_id CHARACTER VARYING(36),
  config_intermediate_object JSONB NULL,
  log_option_id INTEGER, -- Reference to log_settings table
  -- config_file JSONB NULL,
  created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMP DEFAULT NULL,
  deleted_date TIMESTAMP DEFAULT NULL,
  FOREIGN KEY (log_option_id) REFERENCES log_settings(log_setting_id)
);

-- Log_Settings

INSERT INTO log_settings (log_setting_name, settings, default_setting) VALUES ('debug', '{"nas": "debug", "rrc":"debug", "pdcp":"debug", "rlc":"debug", "mac":"debug", "phy":"debug", "ngap":"debug", "xnap":"debug", "gtp_u":"debug", "savePhySignals": false, "displayEncryptedPayload": false, "displaySecuritykey": false}', true);
INSERT INTO log_settings (log_setting_name, settings, default_setting) VALUES ('info', '{"nas": "info", "rrc":"info", "pdcp":"info", "rlc":"info", "mac":"info", "phy":"info", "ngap":"info", "xnap":"info", "gtp_u":"info", "savePhySignals": false, "displayEncryptedPayload": false, "displaySecuritykey": false}', true);
INSERT INTO log_settings (log_setting_name, settings, default_setting) VALUES ('error', '{"nas": "debug", "rrc":"debug", "pdcp":"debug", "rlc":"debug", "mac":"debug", "phy":"debug", "ngap":"debug", "xnap":"debug", "s1ap":"debug", "x2ap":"debug", "gtp_u":"debug", "savePhySignals": false, "displayEncryptedPayload": false, "displaySecuritykey": false}', true);
INSERT INTO log_settings (log_setting_name, settings, default_setting) VALUES ('none', '{"nas": "none", "rrc":"none", "pdcp":"none", "rlc":"none", "mac":"none", "phy":"none", "ngap":"none", "xnap":"none", "gtp_u":"none", "savePhySignals": false, "displayEncryptedPayload": false, "displaySecuritykey": false}', true);

-- Default User

INSERT INTO users (username, email, password) VALUES ('admin', 'admin@email.com', 'admin');

