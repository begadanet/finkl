require 'logger'
require 'FileUtils'

module Log

	@@LOG_DIR = './log'
	@@LOG_FILE = @@LOG_DIR + '/test.log'
	FileUtils.mkdir_p(@@LOG_DIR)

	@@loggerFile = Logger.new(@@LOG_FILE, 'daily')
	@@loggerFile.level = Logger::INFO

	@@loggerConsole = Logger.new(STDOUT)
	@@loggerConsole.level = Logger::DEBUG
	# @@loggerConsole.datetime_format = '%Y-%m-%d %H:%M:%S'
	
	def self.init()
	
	def self.d(log)
		@@loggerConsole.debug(log)
		@@loggerFile.debug(log)		
	end

	def self.i(log)
		@@loggerConsole.info(log)
		@@loggerFile.info(log)		
	end	

	def self.w(log)
		@@loggerConsole.warn(log)
		@@loggerFile.warn(log)		
	end		

	def self.e(log)
		@@loggerConsole.error(log)
		@@loggerFile.error(log)		
	end			

	def self.f(log)
		@@loggerConsole.fatal(log)
		@@loggerFile.fatal(log)		
	end				

end

