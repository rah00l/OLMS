# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_module_session',
  :secret      => 'a321bf674b61e053432cd91a9fee54c0a52b488029b41df09d4b305ff679c41d15db9d92a48d961df32d64a10afa195f6ad3eb76afd4d15a6129a56fc6d8b8fd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
