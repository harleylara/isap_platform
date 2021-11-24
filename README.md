[hr]: hr
[hr_recruitment]: hr_recruitment
[s2u_online_appointment]: s2u_online_appointment
[website_hr_recruitment]: website_hr_recruitment
[website_of_s2u_online_appointment]: https://apps.odoo.com/apps/modules/14.0/s2u_online_appointment/
[reload]: reload
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

### addons

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

### uml

This directory contains the UML files described in Plant UML.
You can see [here][website_of_plantUML] if you want to know about Plant UML.

### docs

This directory contains documents of this project as markdown files.


## How to start development

1. 
