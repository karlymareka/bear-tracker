
require './config/environment'

require './app/controllers/bears_controller'
require './app/controllers/parks_controller'
require './app/controllers/rangers_controller'
use Rack::MethodOverride

use BearsController
use ParksController
use RangersController
run ApplicationController
