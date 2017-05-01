#
# Copyright (C) Business Learning Incorporated (www.businesslearninginc.com)
# Use of this source code is governed by an MIT-style license, details of
# which can be found in the project LICENSE file
#

require 'logger'

# ---------------------------------------------------------------------------
# logging library
#
module LibLog
  def logger
    LibLog.logger
  end

  # ---------------------------------------------------------------------------
  # creates an application log file object
  #
  # see logger documentation (http://www.ruby-doc.org/stdlib-2.1.0/libdoc/logger/rdoc/Logger.html)
  # for logfile management options
  #
  # NOTE: this log file is recreated when it exceeds 50MB in size
  #
  def self.create_logfile(logger_type, log_location, log_filename)
    case logger_type
    when 1
      @logger ||= Logger.new(log_location + '/' + log_filename, 0,
                             50 * 1024 * 1024)
    when 2
      @logger ||= Logger.new(STDOUT)
    end
  end

  # ---------------------------------------------------------------------------
  # log msg with severity passed in
  #
  def self.log(msg, severity)
    case severity
    when 1 then @logger.info msg
    when 2 then @logger.warn msg
    when 3 then @logger.error msg
    else @logger.unknown msg
    end
  end

  # ---------------------------------------------------------------------------
  # expose the logging (logger) object
  #
  def self.logger
    @logger
  end
end
