require "test_helper"

class CostumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jack = users(:jack)
    @jack_costume = costumes(:jack_costume)
    @liz_costume = costumes(:liz_costume)
    login_as @jack
  end

  test 'should get index' do
    get costumes_url
    assert_response :success
  end

  test 'should get show' do
    get costume_url(@jack_costume)
    assert_response :success

    get costume_url(@liz_costume)
    assert_response :success
  end

  test 'should get new' do
    get new_costume_url
    assert_response :success
  end

  test 'should create costume' do
    assert_difference('Costume.count') do
      post costumes_url, params: { costume: { name: 'New Costume', size: 'M', price: 20, condition: 'perfect', gender: 'men', description: 'New Costume Description' } }
    end

    assert_redirected_to costume_url(Costume.last)
  end

  test 'should not create invalid costume' do
    assert_no_difference('Costume.count') do
      post costumes_url, params: { costume: { name: 'Invalid Costume' } }
    end
  end

  test 'should get edit' do
    get edit_costume_url(@jack_costume)
    assert_response :success
  end

  test 'should update costume' do
    patch costume_url(@jack_costume), params: { costume: { name: 'Updated Costume' } }
    assert_redirected_to costume_url(@jack_costume)
    @jack_costume.reload
    assert_equal 'Updated Costume', @jack_costume.name
  end

  test "A user can update a costume he owns" do
    get costume_url(@jack_costume)
    assert_select "a", text: "Edit"
    assert_select "a", text: "Delete"
  end

  test 'should destroy costume' do
    assert_difference('Costume.count', -1) do
      delete costume_url(@jack_costume)
    end

    assert_redirected_to costumes_url
  end

  test 'should get my_costumes' do
    get my_costumes_url
    assert_response :success
  end

  test "A user can't edit or delete a costume he doesn't own" do
    get costume_url(@liz_costume)
    assert_select "a", text: "Edit", count: 0
    assert_select "a", text: "Delete", count: 0
  end
end
