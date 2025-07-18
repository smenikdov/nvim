"$(dirname "$0")/../vdelo.local"

curl $HOST/api/TODO \
    -X GET \
    -H "access: $ACCESS" \
    -H "profile: $PROFILE" \
