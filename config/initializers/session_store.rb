# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jumaimai_g2c_session',
  :secret      => 'f9ddc0f05d5c3bc0806df7c6683c930f76ddd0b8999d79754820bb0346e6b595069e212c9c94c264e4f8cd12fd2de882b2fbf695f440fd92a2599468e6567339'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
