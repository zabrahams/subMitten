# SubMitten

## Description:

SubMitten is a personal submission manager geared towards poets.  This
branch holds the initial rails prototype for the project.  Eventually it'll be moved to the MEAN stack and published as a desktop app with NW.js.

## Schema:

### poems:

table name: poems


 column     | type      | properties            |
------------|-----------|-----------------------|
 id        | :integer  | primary key, not null
 title     | :string   | not null
 status    | :string   | not null, default NONE
 written_on| :datetime | not null
 created_at| :datetime | not null
 updated_at| :datetiem | not null

### journals:

table name: journals

column      | type      | properties            |
------------|-----------|-----------------------|
id          | :integer  | primary key, not null |
name        | :string   | not null              |
email       | :string   |                       |
address     | :text     |                       |
url         | :text     |                       |
simul_submit| :boolean  |                       |
phone_number| :string   |                       |
created_at  | :datetime | not null              |
updated_at  | :datetime | not null              |

### submissions:

table name: submissions

column      | type      | properties            |
------------|-----------|-----------------------|
id          | :integer  | primary key, not null |
journal_id  | :integer  | foreign_key, not null |
date_made   | :datetime | not null              |
result      | :string   | not null, default PENDING |

## submission poems

table name: submission_poems

column        | type      | properties            |
--------------|-----------|-----------------------|
id            | :integer  | primary key, not null |
submission_id | :integer  | foreign key, not null |
poem_id       | :integer  | foreign key, not null |
result        | :string   | default PENDING       |

## publication

table name: publications

column        | type      | properties              |
--------------|-----------|-------------------------|
id            | :integer  | primary key, not null   |
poem_id       | :integer  | foreign_key, null false |
submission_id | :integer  | foreign key, null false |
journal_id    | :integer  | foreign key             |
pub_name      | :string   |                         |
