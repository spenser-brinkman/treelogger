# TreeLogger
This application allows users to keep an inventory of trees growing on a property.  The user may choose to record a survey of multiple trees, or to add/edit individual trees, separate from a survey.  Future surveys may be conducted on trees already inventoried by a user.  Users may record various attributes such as a tree's species, height, diameter, foliar density, and any additional comments relating to general health, watering/fertilization schedules, animal nesting, etc.  Trees may be given identifying names to help differentiate multiple trees of the same species.

### Video Demonstration
https://user-images.githubusercontent.com/70671519/112223965-de680f80-8be7-11eb-93bd-a7ae4cb9bbeb.mp4



### Accessing TreeLogger
For the time being, TreeLogger is not hosted on a live domain, but if you'd like to set it up to use on a personal device, you may follow these steps:
1. Fork and clone this repository from GitHub into your coding environment of choice
2. Run `bundle install` to ensure all required Ruby Gems are present
3. Run `rails s` to initialize TreeLogger on a server housed on your device
4. In your web browser, navigate to TreeLogger's homepage at http://localhost:3000/

### Stretch Goals
- Improve password complexity & length reqs without breaking OAuth
- User provides zip code which will help app generate list of endemic species on their homepage
- Homepage includes general tree-care links (ANSI standards, terminology, identification)
- Homepage provides resource to find local arborists
- Include age of tree (if known) & checkbox for new survey to mark a tree as "newly planted" to assign it a birthdate
- Homepage shows how many trees are saved
- Homepage shows most recent survey date
- Include a weather attribute for surveys
- Allow users to upload photograps of each tree
- Latin names of species
- Forgot your password? Click to reset (unsecure without email verification)
- Require old password when creating new password
- Tree inspection show page should have an edit button -> edit form
