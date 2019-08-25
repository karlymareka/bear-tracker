require_relative './config/environment'

require './config/environment'

require_relative 'app/controllers/bears_controller'
require_relative 'app/controllers/parks_controller'
require_relative 'app/controllers/rangers_controller'

use BearsController
use ParksController
use RangersController 
use Rack::MethodOverride
use SessionsController
run ApplicationController
