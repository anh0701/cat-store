# api register
curl --location 'http://127.0.0.1:8000/api/register' \
--form 'email=?' \
--form 'password=?' \
--form 'password_confirmation=?'

# api logout
curl --location --request POST 'http://localhost:8000/api/logout'

# api login
curl --location 'http://localhost:8000/api/login' \
--form 'email=?' \
--form 'password=?'

# api reset password
curl --location 'http://localhost:8000/api/reset-password' \
--form 'email=?' \
--form 'password=?' \
--form 'password_confirmation=?'

# api forgot password
curl --location 'http://localhost:8000/api/forgot-password' \
--form 'email=?'

# api verify pin
curl --location 'http://localhost:8000/api/verify/pin' \
--form 'email=?' \
--form 'token=?'

# api get all categories
curl --location 'http://127.0.0.1:8000/api/categories' \
--header 'Authorization: Bearer ?' \
--header 'Cookie: XSRF-TOKEN=?'