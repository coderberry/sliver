# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sliver_session',
  :secret      => '3bbd78d648b481bb06ef282d5fd7f93bb37a1d7d3cc23b9777885371fd29e1b28feb1a2d23794f1ccdb627df4853c0f5c93e32e1160f0f782b3b46dfd3f46e81'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
