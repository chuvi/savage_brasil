# Usage:
#
# AppLogger.info "message"

class CustomLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp.to_formatted_s(:db)} [#{severity}] #{msg}\n" 
  end 
end

# Application wide config constant
AppLogger = CustomLogger.new "log/application.log"