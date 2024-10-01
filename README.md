# README

This Kamal 2.0 example application demonstrates:

- Deploying a Rails Application to an untouched Hetzner VPS
- Uses Github's Container Registry
- HTTPS via kamal-proxy's built-in letsencrypt support
- PostgreSQL as an accessory on the same server
- SolidQueue performing a Job recurringly
- SolidCable updating the view every 5 seconds

## Steps

#### Create Hetzner VPS

- Create Hetzner VPS
- Add Firewall
- Add Firewall rules for port 80 and 443

#### Initialize the Application

```sh
rails _8.0.0.beta1_ new kamal-2-rails-example --database=postgresql
cd kamal-2-rails-example

# this assumes postgres running on 5432 locally and accessible by the current user/role
bin/setup --skip-server

bin/rails generate scaffold Painting color:string

# - Change some routes, controller and view files
# - Add `Painting.create!` to db/seeds.rb
# - Add app/jobs/randomize_painting_colors_job.rb
# - Add an entry to config/recurring.yml
```

#### Update deploy.yml

- Change `image` from your-user/kamal_2_rails_example to tbuehlmann/kamal_2_rails_example (my github/ghrc.io name)
- Change `servers.web` from 192.168.0.1 to my hetzner public IP
- Add `servers.job` entry for SolidQueue
- Change `proxy.host` from app.example.com to my domain (that domain should have an A Record pointing to the hetzner public IP)
- Add `registry.server` entry for ghrc.io
- Change `registry.username` from your-user to tbuehlmann (my github/ghrc.io name)
- Add `KAMAL_2_RAILS_EXAMPLE_DATABASE_PASSWORD` entry to `env.secret`
- Remove `SOLID_QUEUE_IN_PUMA` from `env.clear` (I don't want SolidQueue to run inside Puma)
- Add `DB_HOST: kamal_2_rails_example-db` entry to `env.clear`
- Add an `accessories.db` entry for PostgreSQL

#### Update config/database.yml

- Add `host: <%= ENV["DB_HOST"] %>` to `production.primary`

#### Add Secrets

Add values for `POSTGRES_PASSWORD` and `KAMAL_2_RAILS_EXAMPLE_DATABASE_PASSWORD` in .kamal/secrets. I'm putting them in plaintext, don't do this in your application!

#### Deploy

```sh
KAMAL_REGISTRY_PASSWORD=my-github-personal-access-token-classic bundle exec kamal setup
```

After that, deploy with:

```sh
KAMAL_REGISTRY_PASSWORD=my-github-personal-access-token-classic bundle exec kamal deploy
```
