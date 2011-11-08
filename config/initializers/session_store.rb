# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bib_session',
  :secret      => '30f83b9d4a7d7f51ef63b4bfb3652363c337635c5b109f0259276191dacd9c8cc51c6ba2333a5d367e1448ea233a44a00823f5f2eaff436aad628934f3c474c9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
