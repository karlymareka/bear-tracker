Specifications for the Sinatra Assessment
Specs:

[X] Use Sinatra to build the app
    ApplicationController inherits from Sinatra Base.

[X] Use ActiveRecord for storing information in a database
    Models inherit from ActiveRecord; environment contains connection to sqlite3 thru ActiveRecord.

[X] Include more than one model class (e.g. User, Post, Category)
    Contains 3 models: Bear, Park, and Ranger.

[X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    Park has_many bears, Ranger has_many bears, Park has_many Rangers.

[X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Bear belongs_to Ranger, Bear belongs_to Park, Ranger belongs_to Park.

[X] Include user accounts with unique login attribute (username or email)
    User (ranger) must have a unique username. Ranger class validates_uniqueness_of :username.

[X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    The Bears controller has routes for create, read, update, and destroy.

[X] Ensure that users can't modify content created by other users
    Rangers may only edit or delete bears they themselves have created: "if logged_in? && current_user.id == @bear.ranger_id" check is present for edit and delete controllers.

[X] Include user input validations
    Ranger model contains following validations:
      validates :name, presence: true
      validates :username, presence: true
      validates_uniqueness_of :username
    Bear model contains following validations:
      validates :name, presence: true
      validates :species, presence: true
      validates :sex, presence: true
      validates :health_status, presence: true
      validates :habituation_status, presence: true
      validates :ranger_id, presence: true

[X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    4 different flash messages if bad input attempted or if ranger attempts to edit/delete another ranger's bear.
    
[X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

[X] You have a large number of small Git commits
[X] Your commit messages are meaningful
[X] You made the changes in a commit that relate to the commit message
[X] You don't include changes in a commit that aren't related to the commit message
