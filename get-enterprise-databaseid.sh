echo "Enter the ENTERPRISE_SLUG: "  
read ENTERPRISE_SLUG  
curl -H "Authorization: Bearer BEARER_TOKEN" -X POST \
  -d '{ "query": "query($slug: String!) { enterprise (slug: $slug) { slug databaseId } }" ,
        "variables": {
          "slug": "'"$ENTERPRISE_SLUG"'"
        }
      }' \
https://api.github.com/graphql
