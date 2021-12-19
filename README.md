
# Printerous Code Challenge

  

## Installation

```sh

git clone git@github.com:Zulkifli-r/PrinterousCodeChallenge_Ruby.git

cd PrinterousCodeChallenge_Ruby

bundle install
yarn install

```

the default database is using sqlite so just run:

```sh

rails db:drop db:create db:migrate

rails db:seed // to seed admin user

rails s // to serve the app at http://localhost:3000 (default)

```

login to the app as super admin using :

```

email: super@admin.com

password: password

```