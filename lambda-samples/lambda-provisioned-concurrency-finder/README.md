[lambda-provisioned-concurrency-finder](lambda-provisioned-concurrency-finder.sh) uses aws cli's --query option to search for all function versions to check if provisioned concurrency is enabled, and displays the table output of it. Takes optional region flag ```(-r)``` to override the default region of the aws cli ```(aws configure get region)```


```shell
./lambda-provisioned-concurrency-finder.sh
```

```
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|                                                                                                     ListProvisionedConcurrencyConfigs                                                                                                    |
+------------------------------------------+-------------------------------------------+----------------------------------------------------------------+---------------------------+-------------------------------------------+----------+
| AllocatedProvisionedConcurrentExecutions | AvailableProvisionedConcurrentExecutions  |                          FunctionArn                           |       LastModified        | RequestedProvisionedConcurrentExecutions  | Status   |
+------------------------------------------+-------------------------------------------+----------------------------------------------------------------+---------------------------+-------------------------------------------+----------+
|  50                                      |  50                                       |  arn:aws:lambda:us-west-2:758005405094:function:nVersions:dev  |  2020-01-23T15:30:53+0000 |  50                                       |  READY   |
|  5                                       |  5                                        |  arn:aws:lambda:us-west-2:758005405094:function:nVersions:10   |  2020-01-20T15:58:50+0000 |  5                                        |  READY   |
|  10                                      |  10                                       |  arn:aws:lambda:us-west-2:758005405094:function:nVersions:20   |  2020-02-20T14:18:07+0000 |  10                                       |  READY   |
+------------------------------------------+-------------------------------------------+----------------------------------------------------------------+---------------------------+-------------------------------------------+----------+
```
