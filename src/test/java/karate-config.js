function fn() {
  var env = karate.env; // get system property 'karate.env'

  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
  //  credential: karate.properties['cred'],
   credential: 'Welcome123!',
   username: 'bvl',
   clientid: karate.properties['userid'],
   clientsecret: karate.properties['usersecret'],
   environment: 'TST',
   baseUrlReflex: 'https://gall-dep-tst.ah.nl/gall/merchandising',
   baseUrl: 'https://reflex-tst.gall.nl/reflexWS/rest/public/v1/',
   activity_code: 'GG1',
   physical_depot_code: '101',
   originator: 'ERP'
  }

  //karate.log('=========================== CREDENTIAL: ', karate.properties['cred']);
  //karate.log('=========================== USERID: ', karate.properties['userid']);
  //karate.log('=========================== USERSECRET: ', karate.properties['usersecret']);

/*  if (env == 'dev') {
    config.baseUrl = 'https://gall-dep-acc.ah.nl/gall/merchandising';
    config.environment = 'ACC';
  }
*/

  if (env == 'e2e') {
    // customize
  }

  return config;
}