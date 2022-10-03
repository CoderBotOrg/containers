curl -X DELETE \
"https://api.balena-cloud.com/v6/release?\$filter=belongs_to__application%20eq%201967944%20and%20commit%20eq%20'582503119fd8f7d9f0bb3e102dd7909b'&\$select=id" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer <token>" 