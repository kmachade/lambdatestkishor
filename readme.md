# Script to take a screenshot in chrome



### Prerquisite

1. Install docker and aws cli 

   ```
   apt update && apt install docker.io awscli -y
   
   ```

2. Either use IAM role or  Configure aws cli and provide credentials via running this command

3. ```
   aws configure
   ```

   



## Script usage

1. Clone the repo

   ```
   git clone https://github.com/kmachade/lambdatest.git
   ```

2.  Give execute permission to script

   ```
   chmod +x screenshot.sh
   ```

3. Run the script

   ```
   ./screenshot.sh https://www.google.com
   ```

   

