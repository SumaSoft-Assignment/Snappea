# Snappea

Ruby version 2.3

Rails Version 5.0

 ```
     bundle install

     rake db:migrate

     rke db:seed
 ```

## Note
You can use Chrome Rest Console/Postman to run and check the output of api.

### API Document
1. Get list of restaurants for valid client

  URL: /api/v1/restaurants
  Method:  GET
  header: 'Authorization' = API KEY
  params:  page = 1
  Response:
     failuer: { success: false, error: 'error message', data: [] }
     success: { success: true, error: '', data: 'list of restaurants' }

2. Get menu of a restaurant

  URL: /api/v1/restaurants/:id/menu_list
  Method: GET
  header: 'Authorization' = API KEY
  params: page=1
  Response:
    failuer: { success: false, error: 'error message', data: [] }
    success: { success: true, error: '', data: 'menu list' }


## To run the test-cases use following command:
 ```
    rspec spec spec/controllers/api/v1/restaurants_controller_spec.rb
 ```
