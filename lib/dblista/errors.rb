# frozen_string_literal: true

# Error messages
module DBLista::Errors
  # Raised when ID is not provided
  ID_NEEDED = 'You need to enter ID'
  # Raised when provided page is not an integer
  PAGE_INTEGER = 'Page must be an integer'
  # Raised when rank is not an integer
  RANK_INTEGER = 'Rank must be an integer'
  # Raised when provided limit is not an integer
  LIMIT_INTEGER = 'Limit must be an integer'
  # Raised when token is not provided
  TOKEN_NOT_PROVIDED = 'Token is not provided'
  # Raised when type symbol is invalid
  TYPE_NOT_ALLOWED = 'Only bot and server types are allowed'
  # Raised wheen search query is not provided
  QUERY_NOT_PROVIDED = 'Search query is not provided'
  # Raised when body is not a hash
  BODY_HASH = 'Body must be a hash'
  # Raised when token is invalid or expired
  INVALID_TOKEN = 'Invalid or expired token'
end
