function fn() {
  var env = karate.env;
  if (!env) {
    env = 'qa';
  }
  karate.log('karate.env system property was:', env);
  var config = {
    path_pet: '/v2/pet',
    path_user: '/v2/user',
    path_order: '/v2/store/order',
    path_inventory: '/v2/store/inventory'
  }
  config.environment = karate.call('classpath:core/environment/config-' + env + '.js');
  config.constants = karate.call('classpath:core/constants/constants.js');
  return config;
}