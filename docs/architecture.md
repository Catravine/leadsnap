#Architectural Decision Record

###2016-05-10
Had to change the name of the `callback` model to `recall`; Callback is a class
within the Active Support package, and was causing `number or arguments error
(0 for 5)` when trying to do `Callback.new`.  

##2016-05-6
Trying `pg_search` gem, and so I'm also changing the development db to postgres.
DB will have to be reseeded with the ~3000 SotP leads.
Leads can be killed, disc'd, or daytime, and the project is backed up.

###2016-05-02
`Lead` model is in place, with pertenent contact info fields and a campaign
reference.  I'm thinking `killed` (already done), `disconnected`, and `daytime`
should be extra boolean columns, but more complex situations, like no, sale,
already sub'd(?), and of course callback, will be separate models since they
have more associated information and would be more columns to the lead table
than just the one boolean.

###2016-04-25
`Campaign` CRUD is done, with authorization where only admins can create/
update/delete, but everyone can view.  

###2016-04-21
`Pundit` for authorization, after making my own user managment functions.

###2016-04-20
`Puma` web server added.  Don't know if that will make much of a difference
just yet, but for the fact that it's supposed to support multi-threading.

###2016-04-19
Decided to to try to make my own admin for users and see how that goes.  
`Administrate` is cool, but I learned more about it, and customizing its views
doesn't work. Its good for basic CRUD and not a lot else customization-wise.  
As the (relatively recent) GoRails screen cast about it says, it has potential
but isn't quite there yet in terms of customization.

###2016-04-18
Using `administrate` for admin dashboards.  Charlie suggested it and it seems
to do just what I need, although it could use some graphical customization.
very easy to customize data though.

###2016-04-16
Using `devise` for user authentication, rather than "from scratch".  
Pre-planning is done, about to 'break ground' on some code.
