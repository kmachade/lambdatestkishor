#Define Variable for input
URL=$1
SSNAME=`echo $URL | cut -d / -f3`
S3BUCKET=lambdatestkishor

#Take screenshot with Google chrome
docker run  -v /tmp:/tmp --privileged --rm  -it tekfik/chrome /bin/google-chrome-stable --disable-gpu  --headless --no-sandbox --screenshot=/tmp/chrome_"$SSNAME".png $URL


#Take screenshot with Firefox
docker run --rm --privileged -v /tmp:/tmp -it jlesage/firefox  firefox -screenshot firefox_"$SSNAME".png -url  "$URL"
# Upload screenshots to s3
aws s3 cp /tmp/chrome_"$SSNAME".png s3://$S3BUCKET/
aws s3 cp /tmp/firefox_"$SSNAME".png s3://$S3BUCKET/

# set expiration of 30  mins

CHROME_SS_URL=`aws s3 presign s3://$S3BUCKET/chrome_"$SSNAME".png  --expires-in 1800`
FIREFOX_SS_URL=`aws s3 presign s3://$S3BUCKET/firefox_"$SSNAME".png --expires-in 1800`

echo -e "\n\n\n"
echo -e "The url for Chrome screenshot of $URL is: \n\n $CHROME_SS_URL "
echo -e "\n\n\n"
echo -e "The url for firefox screenshot of $URL is: \n\n $FIREFOX_SS_URL "