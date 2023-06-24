SET GLOBAL sql_mode = '';

CREATE DATABASE calls;
USE calls;

CREATE TABLE megaline_users (
  user_id INT PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  age INT,
  city TEXT,
  state TEXT,
  reg_date DATE,
  plan_name TEXT,
  churn_date DATE NULL
);

CREATE TABLE megaline_internet (
  id VARCHAR(50),
  user_id INT,
  session_date DATE,
  mb_used DOUBLE,
  FOREIGN KEY (user_id) REFERENCES megaline_users(user_id)
  ON DELETE CASCADE
);
CREATE TABLE megaline_calls (
  id VARCHAR(50),
  user_id INT,
  call_date DATE,
  duration DOUBLE,
  FOREIGN KEY (user_id) REFERENCES megaline_internet(user_id)
  ON DELETE CASCADE
);
CREATE TABLE megaline_messages (
	id VARCHAR(50),
	user_id INT,
    message_date DATE,
    FOREIGN KEY (user_id) REFERENCES megaline_calls(user_id)
    ON DELETE CASCADE
);    
CREATE TABLE megaline_plans (
	plan_name TEXT,
    messages_included INT,
    mb_per_month_included INT,
    minutes_included INT,
    usd_monthly_pay INT,
    usd_per_gb INT,
    usd_per_message DOUBLE,
    usd_per_minute DOUBLE
);

DESCRIBE megaline_users;