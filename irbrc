
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

short_version = IRB.conf[:short_version] || ''
version_string = short_version.empty? ? '' : short_version + ' '

prompt = IRB.conf[:PROMPT][:SIMPLE].dup
prompt[:PROMPT_I] = "#{version_string}>> "
prompt[:PROMPT_N] = "#{version_string}>> "
prompt[:PROMPT_C] = "#{version_string}?> "
IRB.conf[:PROMPT][:CUSTOM] = prompt
IRB.conf[:PROMPT_MODE] = :CUSTOM
