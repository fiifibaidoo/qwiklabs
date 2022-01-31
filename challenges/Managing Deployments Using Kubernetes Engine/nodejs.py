{
     'name': frontend,
     'type': 'frontend.py',
     'properties': {
         'zone': context.properties['zone'],
         'dockerImage': 'gcr.io/deployment-manager-examples/nodejsservice',
         'port': application_port,
         # Define the variables that are exposed to container as env variables.
         'dockerEnv': {
             'SEVEN_SERVICE_MYSQL_PORT': mysql_port,
             'SEVEN_SERVICE_PROXY_HOST': '$(ref.' + backend
                                         + '.networkInterfaces[0].networkIP)'
         },
         # If left out will default to 1
         'size': 2,
         # If left out will default to 1
         'maxSize': 4
     }
 },
