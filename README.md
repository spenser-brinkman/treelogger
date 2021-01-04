# TreeLogger
This application allows users to keep an inventory of trees growing on a property.  The user may choose to record a survey of multiple trees, or to add/edit individual trees, separate from a survey.  Future surveys may be conducted on trees already inventoried by a user.  Users may record various attributes such as a tree's species, height, diameter, foliar density, and any additional comments relating to general health, watering/fertilization schedules, animal nesting, etc.  Trees may be given identifying names to help differentiate multiple trees of the same species.

### Installation & Startup
1. Fork and clone this repository from GitHub into your coding environment of choice
2. Run `bundle install` to ensure all required Ruby Gems are present
3. Run `rails s` to initialize TreeLogger on a server housed on your device
4. In your web browser, navigate to TreeLogger's homepage at http://localhost:3000/

### Flatiron Assessment Video & Blog
link
link

### Stretch Goals
- User can manage multiple properties
- Password complexity & length reqs
- User provides zip code which will help app generate list of endemic species on their homepage
- Homepage includes general tree-care links (ANSI standards, terminology, identification)
- Homepage provides resource to find local arborists
- Include age of tree (if known) & checkbox for new survey to mark a tree as "newly planted" to assign it a birthdate
- Homepage shows how many trees are saved
- Incorporate a Survey model, in which many trees can be added & updated at once. The data from a survey is added to a tree's history of surveys which may be viewed and altered. A tree would then contain a record of past data with corresponding visualiztions, etc
- Homepage shows most recent survey date
- Include a weather attribute for surveys
- Allow users to upload photograps of each tree
- Latin names of species
- Forgot your password? Click to reset (unsecure without email verification)
- Require old password when creating new password


### Bugs
- When new tree is created there should be a button to create a new survey
- Tree inspection show page should have an edit button -> edit form