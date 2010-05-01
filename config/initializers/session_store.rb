# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_savage_brasil_session',
  :secret      => '933d73898c1d5bb42239e195ff821be82cfbfa889a72f51a59ed98817f4121069d5ae4a431320306bcebb282d0f5b8ea584d7cfd52a38d00a4711b8fce467ddc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
