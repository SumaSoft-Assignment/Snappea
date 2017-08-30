require "rails_helper"
RSpec.describe Api::V1::RestaurantsController, type: :controller do
  let!(:user) { create :user }
  let!(:entree_menu) { create :entree_menu }
  let!(:appetizer_menu) { create :appetizer_menu }
  let(:restaurant) { create :restaurant }
  before(:each) do
    request.headers['Authorization'] = user.guid
    restaurant.menus << entree_menu
    restaurant.menus << appetizer_menu
  end
  describe '#index' do
    context 'get restaurants list' do
      it 'returns the list of all restaurants' do
        get :index, params: { page: 1 }
        resp = JSON.parse(response.body)
        expect(resp['data'].size).to eq 1
        expect(resp['success']).to eq true
      end

      it 'should not return restaurant list for invalid api key' do
        request.headers['Authorization'] = 'invalid key'
        get :index, params: { page: 1 }
        resp = JSON.parse(response.body)
        expect(resp['data'].size).to eq 0
        expect(resp['success']).to eq false
      end

      it 'should not return restaurant list if api key is nil' do
        request.headers['Authorization'] = nil
        get :index, params: { page: 1 }
        resp = JSON.parse(response.body)
        expect(resp['data'].size).to eq 0
        expect(resp['success']).to eq false
      end
    end
  end

  describe '#menu_list' do
    it 'returns the menu list of a restaurants' do
      get :menu_list, params: { id: restaurant.id, page: 1 }
      resp = JSON.parse(response.body)
      expect(resp['data'].size).to eq 2
      expect(resp['success']).to eq true
    end

    it 'should not return menu list list for invalid api key' do
      request.headers['Authorization'] = 'invalid key'
      get :menu_list, params: { id: restaurant.id,  page: 1 }
      resp = JSON.parse(response.body)
      expect(resp['data'].size).to eq 0
      expect(resp['success']).to eq false
    end

    it 'should not return menu list if api key is nil' do
      request.headers['Authorization'] = nil
      get :menu_list, params: { id: restaurant.id, page: 1 }
      resp = JSON.parse(response.body)
      expect(resp['data'].size).to eq 0
      expect(resp['success']).to eq false
    end
  end

end