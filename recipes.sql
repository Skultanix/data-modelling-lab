create table Authentication_data (
user_name varchar(30) PRIMARY KEY,
password text,
email varchar(50)
);

create table User_Data (
  user_name varchar(30) REFERENCES Authentication_data(user_name),
  user_id SERIAL PRIMARY KEY,
  saved_recipe_id integer REFERENCES Recipe_data(recipe_id),
  saved_recipe_name integer REFERENCES Recipe_data(recipe_name),
  grocery_list_id integer REFERENCES Grocery_list(grocery_list_id)
  );
  
 create table Grocery_list (
   grocery_list_id SERIAL PRIMARY KEY,
   ingredient_name varchar(30) REFERENCES Ingredient_Data(ingredient_name),
   ingredient_id integer REFERENCES Ingredient_Data(ingredient_id),
   ingredient_measure varchar(50),
   ingredient_amount integer
   );
   
  create table Ingredient_Data (
    ingredient_name varchar(30) PRIMARY KEY,
    ingredient_id SERIAL PRIMARY KEY,
    protein_percent integer,
    fat_percent integer,
    carb_percent integer,
    sodium_percent integer,
    sugar_percent integer,
    calorie_count integer,
    is_vegan boolean,
    gluten_free boolean
    );
    
   create table Recipe_data (
     recipe_name varchar(30)PRIMARY KEY,
     recipe_id SERIAL PRIMARY KEY,
     creation_timestamp date,
     author_id integer REFERENCES Author_Data(author_id),
     ingredient_name varchar(30) REFERENCES Ingredient_Data(ingredient_name),
     ingredient_id integer REFERENCES Ingredient_Data(ingredient_id),
     ingredient_measure varchar(30),
     ingredient_amount integer,
     is_private boolean
     );
    
 create table Author_Data (
   user_id integer REFERENCES User_Data(user_id),
   author_id SERIAL PRIMARY KEY,
   bio text
   );
   
 create table Events (
   event_tag varchar(50),
   event_id SERIAL PRIMARY KEY,
   recipe_id REFERENCES Recipe_data(recipe_id)
   );