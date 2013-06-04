# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_CinemaManager_session',
  :secret      => 'ccdd28da5bee86d03b8b82771e071575e2e4d06698e6ff8138b6cd3c5c725ab97b2bae4fe2e1c5edb02e697124276c85b19b1d72f043408246fef9a3c7deffa3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
