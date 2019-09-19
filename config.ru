
require './config/environment'

require_relative 'app/controllers/bears_controller'
require_relative 'app/controllers/parks_controller'
require_relative 'app/controllers/rangers_controller'
use Rack::MethodOverride

use BearsController
use ParksController
use RangersController
run ApplicationController
