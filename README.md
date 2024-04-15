### Hexlet tests and linter status:
[![Actions Status](https://github.com/eKulshan/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/eKulshan/rails-project-64/actions)
![Check status](https://github.com/eKulshan/rails-project-64/actions/workflows/check.yml/badge.svg)

# Collective blog

[Homepage](https://collective-blog-ltel.onrender.com/) - application for posting thematic blogs. Engage in conversations via comments and like interesting posts.

### Purpose
Make full fledged web application using RoR framework.

### Implemented features
- User auth flow (registration, authentication)
- Posts creation
- Commenting with nested comments via ancestry gem
- Posts liking 

### Instruments and skills learned/used
- ActiveRecord (relations, n+1 solutions)
- Simpleform
- Slim
- Resourceful routing 
- Minitest
- Device
- Ancestry

### Local setup
``` bash
# install dependencies and setup db
make setup

#start application on localhost:3000
make start
```