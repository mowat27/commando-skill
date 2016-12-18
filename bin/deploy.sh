PROJECT_HOME=$( cd $(dirname $0)/..; pwd )
ZIPFILE=$PROJECT_HOME/dist/commandoxfit.src.zip

echo "Pushing $(basename $ZIPFILE) to s3"
s3cmd put $ZIPFILE s3://commandoxfit
