### List Lambda functions by runtime

[list-functions-by-runtime](list-functions-by-runtime.sh) uses AWS CLI's --query option to filter functions using a certain runtime. Takes optional region flag ```(-r)``` to override the default region of the aws cli ```(aws configure get region)```. This can be useful if you are trying to find Lambda functions nearing the deprecation cycle.

If the script runs without any outputs when you are expecting certain functions, recheck the AWS region (or the optional -r region flag override) and the runtime identifier to match the names from: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html



```shell
./list-functions-by-runtime.sh -x python2.7

# Override AWS region:
./list-functions-by-runtime.sh -x python2.7 -r us-east-1
```

```
Usage: $(basename "$0") -x RUNTIME [-r REGION]

Retuns lists of Lambda functions and versions using a runtime set by:

  -x  Set the runtime identifier to select:
    NodeJS: nodejs14.x, nodejs12.x, nodejs10.x
    Python: python3.8, python3.7, python3.6, python2.7
    Ruby: ruby2.7, ruby2.5
    Java: java11, java8.al2. java8
    Go: go1.x
    .NET Core: dotnetcore3.1, dotnetcore2.1
    Custom Runtime: provided.al2, provided
  More info: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html

  -r  (Optional) Overrides the AWS region. Defaults to current region as per aws configure
```


```
$ ./list-functions-by-runtime.sh -x python2.7
-----------------------------------------------------------------------------------------
|                                     ListFunctions                                     |
+--------------------------------------------------------------------------+------------+
|  arn:aws:lambda:us-west-2:XXXXXXXXXXXX:function:default_logging:$LATEST  |  python2.7 |
|  arn:aws:lambda:us-west-2:XXXXXXXXXXXX:function:boto3_python27:$LATEST   |  python2.7 |
|  arn:aws:lambda:us-west-2:XXXXXXXXXXXX:function:tmp_content:$LATEST      |  python2.7 |
|  arn:aws:lambda:us-west-2:XXXXXXXXXXXX:function:insights_2:$LATEST       |  python2.7 |
|  arn:aws:lambda:us-west-2:XXXXXXXXXXXX:function:cw_insights:$LATEST      |  python2.7 |
|  arn:aws:lambda:us-west-2:XXXXXXXXXXXX:function:python27:$LATEST         |  python2.7 |
+--------------------------------------------------------------------------+------------+
```

---
Boto3 SDK example: https://github.com/shreyasgaonkar/aws-lambda-code-samples/tree/master/lambda-samples/list_functions_by_a_runtime
