// Deploy CommandoXFit Skill Lambda functions
// Customised from https://aws.amazon.com/blogs/compute/new-deployment-options-for-aws-lambda/

console.log('Loading function');
var AWS = require('aws-sdk');
var lambda = new AWS.Lambda();

const srcBucket = "commandoxfit";
const srcZip = "commandoxfit.src.zip";
const functionName = "arn:aws:lambda:eu-west-1:525027603511:function:commandoXFitClasses";

exports.handler = function(event, context) {
    key = event.Records[0].s3.object.key
    bucket = event.Records[0].s3.bucket.name

    if (bucket == srcBucket && key == srcZip) {
        console.log("uploaded to lambda function: " + functionName);
        var params = {
            FunctionName: functionName,
            S3Key: key,
            S3Bucket: bucket
        };
        lambda.updateFunctionCode(params, function(err, data) {
            if (err) {
                console.log(err, err.stack);
                context.fail(err);
            } else {
                console.log(data);
                context.succeed(data);
            }
        });
    } else {
        context.succeed("skipping zip " + key + " in bucket " + bucket);
    }
};
