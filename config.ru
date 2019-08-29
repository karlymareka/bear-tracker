
require './config/environment'

use BearsController
use ParksController
use RangersController
use Rack::MethodOverride
run ApplicationController
