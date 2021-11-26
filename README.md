[hr]: addons/hr
[hr_recruitment]: addons/hr_recruitment
[s2u_online_appointment]: addons/s2u_online_appointment
[website_hr_recruitment]: addons/website_hr_recruitment
[website_of_s2u_online_appointment]: https://apps.odoo.com/apps/modules/14.0/s2u_online_appointment/
[reload]: reload
[reset]: reset
[setup]: setup
[clear_container]: clear_container
[website_of_plantUML]: https://plantuml.com/en/
[website_of_docker_image]: https://hub.docker.com/_/odoo


# ISAP platform with odoo

## Development Environment
- macOS Big Sur v11.6
- Docker desktop v3.6.0
- Docker image of odoo v15.0 (IMAGE ID: 1e31bb4d7cd0)
- Docker image of postgres v14.1-1.pgdg110+1 (IMAGE ID: 3d8d97994585)
> [This][website_of_docker_image] is the site I referenced when I start up this environment  
> And, you can also see [How to start development](#how-to-start-development) in this document.

## Directory explanation

### /addons

In this directory, there are custom addons. And there are two categories below,
- Installed custom addon
  - [s2u_online_appointment][s2u_online_appointment]
- Existed custom addon
  - [hr][hr]
  - [hr_recruitment][hr_recruitment]
  - [website_hr_recruitment][website_hr_recruitment]


#### Installed custom addon

This includes [s2u_online_appointment][s2u_online_appointment] addon.  
This addon is installed from [here][website_of_s2u_online_appointment] and made it available in odoo v15.  
And, it is automatically mounted as a custom addon when start odoo container.

Please click [here][s2u_online_appointment] if you want to see the detail of s2u_online_appointment addon

#### Existed custom addon

This includes [hr][hr], [hr_recruitment][hr_recruitment] and [website_hr_recruitment][website_hr_recruitment] addons.
These addons initially exist in odoo docker container.
> you can see source code of odoo addon in odoo container(/usr/lib/python3/dist-packages/odoo/addons)

I customized these source code in the local environment and mounted to odoo container.
Then I copy these customized addons to source code by using [reload script][reload]

This is the way to customize existed addon.

### /uml

This directory contains the UML files described in Plant UML.
You can see [here][website_of_plantUML] if you want to know about Plant UML.

### /docs

This directory contains documents of this project as markdown files.


## How to start development

1. Execute [./setup][setup]
1. localhost:8069 in browser
1. Enter Master Password, Database Name, Email and Password
1. Execute ./reload
1. Upgrade "Base" addon
1. Install "ISAP Recruitment" addon
1. Making website (I want an elearning platform for my foreign exchange students organization business, with the main objective to schedule appointments)
1. Add "Programs", "Appointment" and "Portal" to menu bar
1. Change to debug mode  
   localhost:8069/web?debug=1
1. Check "Free sign up" on Setting -> Permissions -> Customer Account
1. Setting two access rights
   1. Add "Recruitment / Admin university" from Settings -> Users & Companies -> Groups -> Admin University -> Inherited -> Add a line
   1. Add "Recruitment / Professor" from Settings -> Users & Companies -> Groups -> Professor -> Inherited -> Add a line

## How to create Admin University account and University instance by Admin of system

## How to create Professor account by Admin University account
