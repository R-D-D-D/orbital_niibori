# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_08_145825) do

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "tutor_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id", "created_at"], name: "index_courses_on_tutor_id_and_created_at"
    t.index ["tutor_id"], name: "index_courses_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subscriptions_on_course_id"
    t.index ["student_id", "course_id"], name: "index_subscriptions_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_subscriptions_on_student_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_tutors_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "link"
    t.string "uid"
    t.string "title"
    t.datetime "published_at"
    t.integer "likes"
    t.integer "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_videos_on_uid"
  end

end
