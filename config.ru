require './config/environment'
require_relative 'app/controllers/books_controller'
require_relative 'app/controllers/users_controller'

use Rack::MethodOverride

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
use BooksController
use UsersController
