BEGIN;
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "match_complete" bool NOT NULL, "team_1_score" integer NULL, "team_2_score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL);
INSERT INTO "brackets_match__new" ("contestant_2_id", "team_1_score", "match_complete", "contestant_1_id", "contestant_1_at", "team_2_score", "id", "fixture_id", "contestant_2_at") SELECT "contestant_2_id", "team_1_score", "match_complete", "contestant_1_id", "contestant_1_at", "team_2_score", "id", "fixture_id", "contestant_2_at" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "match_scheduled" date NULL, "match_complete" bool NOT NULL, "team_1_score" integer NULL, "team_2_score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL);
INSERT INTO "brackets_match__new" ("contestant_1_id", "contestant_2_id", "team_1_score", "match_complete", "contestant_1_at", "team_2_score", "id", "fixture_id", "match_scheduled", "contestant_2_at") SELECT "contestant_1_id", "contestant_2_id", "team_1_score", "match_complete", "contestant_1_at", "team_2_score", "id", "fixture_id", NULL, "contestant_2_at" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "match_complete" bool NOT NULL, "team_1_score" integer NULL, "team_2_score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL, "match_scheduled" date NULL, "match_updated" datetime NOT NULL);
INSERT INTO "brackets_match__new" ("contestant_1_id", "contestant_2_id", "team_1_score", "match_complete", "match_updated", "contestant_1_at", "team_2_score", "id", "fixture_id", "match_scheduled", "contestant_2_at") SELECT "contestant_1_id", "contestant_2_id", "team_1_score", "match_complete", '2015-06-05 05:20:39.669938', "contestant_1_at", "team_2_score", "id", "fixture_id", "match_scheduled", "contestant_2_at" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");

COMMIT;
