Project To-Do's
Throughout: Keep in mind partials and helpers -- for use in views 
-[ ] map out your project models - include tables, attr, fields, relationships - as you expect them to be
-[x] generate rails with - rails new NAME
-[x] if not devise:
    - generate user/s model
    - build out authentication
        -using bcrypt
    - add in omniauth & 3rd party authentication
-[x] generate your migrations for your tables
    -make sure that you do your join tables last (in order to take advantage of the macros in rails)
        - migrations should be in order from parent to join
        - t.belongs_to :thing >> this is how you use the macro
            - this will add the belongs_to line in your models --- make sure you don't have doubles
-[x] add in models for all of the tables
-[x] add in all of relationships in the models
-[ ] test relationships in rails console
    - create some objects and create associated objects (rails c -s)
-[ ] make seed data
-[ ] write your routes
-[ ] make CRUD routes for one of your parent controllers (note: parent controller examples - the 'owners', has the "has many through)
    - [ ]make associated views for those
-[ ] build out the rest of the functionality
*** At this point look for redundancies, DRY up your code using partials and helpers ***
-[ ] scope methods
-[ ] validations
-[ ] test all forms and features
-[ ] styling, if you want to
    - CSS, HTML, bootstrap, materialize, JS